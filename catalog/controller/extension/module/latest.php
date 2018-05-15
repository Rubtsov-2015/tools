<?php
class ControllerExtensionModuleLatest extends Controller {
	public function index($setting) {
		$this->load->language('extension/module/latest');

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_tax'] = $this->language->get('text_tax');

		$data['button_cart'] = $this->language->get('button_cart');
		$data['button_wishlist'] = $this->language->get('button_wishlist');
		$data['button_compare'] = $this->language->get('button_compare');
		$data['text_all'] = $this->language->get('text_all');
		$data['text_price'] = $this->language->get('text_price');
		$data['latest'] = $this->url->link('product/latest', '', true);

		$this->load->model('catalog/product');

		$this->load->model('tool/image');

		$data['products'] = array();

		$filter_data = array(
			'sort'  => 'p.date_added',
			'order' => 'DESC',
			'start' => 0,
			'limit' => $setting['limit']
		);

		$results = $this->model_catalog_product->getProducts($filter_data);

		if ($results) {
			foreach ($results as $result) {
				if ($result['image']) {
					$image = $this->model_tool_image->resize($result['image'], $setting['width'], $setting['height']);
					$image2 = $this->model_tool_image->resize($result['image'], 347, 228);
				} else {
					$image = $this->model_tool_image->resize('placeholder.png', $setting['width'], $setting['height']);
					$image2 = $this->model_tool_image->resize('placeholder.png', 347, 228);
				}

				if ($this->customer->isLogged() || !$this->config->get('config_customer_price')) {
					$price = $this->currency->format($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
				} else {
					$price = false;
				}

				if ((float)$result['special']) {
					$special = $this->currency->format($this->tax->calculate($result['special'], $result['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
				} else {
					$special = false;
				}

				if ($this->config->get('config_tax')) {
					$tax = $this->currency->format((float)$result['special'] ? $result['special'] : $result['price'], $this->session->data['currency']);
				} else {
					$tax = false;
				}

				if ($this->config->get('config_review_status')) {
					$rating = $result['rating'];
				} else {
					$rating = false;
				}
				$attribute_groups = $this->model_catalog_product->getProductAttributes($result['product_id']);
				if ($this->customer->isLogged()) {
					$wish_products = array();
				    $wish_products =  $this->model_catalog_product->checkWishProduct();
					  if(in_array($result['product_id'], $wish_products)){
				      $wish = true;
				   	  } else {
				    if(isset($_COOKIE['wish_products'])) {
					   $wish_products = explode(',',$_COOKIE['wish_products']);
		               $wish_products = array_diff($wish_products, array(''));
				       if(in_array($result['product_id'], $wish_products)){
				          $wish = true;
				       }else{
				          $wish = false;
				       } 
				    
				   } else {
				       $wish = false;
				   } 
				 } 
				} else if(isset($_COOKIE['wish_products'])) {				
				   $wish_products = explode(',',$_COOKIE['wish_products']);
		           $wish_products = array_diff($wish_products, array(''));
				   if(in_array($result['product_id'], $wish_products)){
				      $wish = true;
				   }else{
				     $wish = false;
				   } 
				} else {
				   $wish = false;
				}if(strlen($result['name']) > 55) {
					$name = utf8_substr(strip_tags(html_entity_decode($result['name'], ENT_QUOTES, 'UTF-8')), 0, 55) . '...';
				} else {
					$name = $result['name'];
				}

				$data['products'][] = array(
					'product_id'  => $result['product_id'],
					'thumb'       => $image,
					'image'       => $image2,
					'attr'=> $attribute_groups,
					'wish' => $wish,
					'name'        => $name,
					'description' => utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get($this->config->get('config_theme') . '_product_description_length')) . '..',
					'price'       => $price,
					'special'     => $special,
					'tax'         => $tax,
					'rating'      => $rating,
					'href'        => $this->url->link('product/product', 'product_id=' . $result['product_id'])
				);
			}

			return $this->load->view('extension/module/latest', $data);
		}
	}
}
