<?php
class ControllerAccountAccount extends Controller {
	private $error = array();
	public function index() {
		if (!$this->customer->isLogged()) {
			$this->session->data['redirect'] = $this->url->link('account/account', '', true);

			$this->response->redirect($this->url->link('account/login', '', true));
		}

		$this->load->language('account/account');

		$this->document->setTitle($this->language->get('heading_title'));

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_account'),
			'href' => $this->url->link('account/account', '', true)
		);

		if (isset($this->session->data['success'])) {
			$data['success'] = $this->session->data['success'];

			unset($this->session->data['success']);
		} else {
			$data['success'] = '';
		} 

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_my_account'] = $this->language->get('text_my_account');
		$data['text_my_orders'] = $this->language->get('text_my_orders');
		$data['text_my_newsletter'] = $this->language->get('text_my_newsletter');
		$data['text_edit'] = $this->language->get('text_edit');
		$data['text_password'] = $this->language->get('text_password');
		$data['text_address'] = $this->language->get('text_address');
		$data['text_credit_card'] = $this->language->get('text_credit_card');
		$data['text_wishlist'] = $this->language->get('text_wishlist');
		$data['text_order'] = $this->language->get('text_order');
		$data['text_download'] = $this->language->get('text_download');
		$data['text_reward'] = $this->language->get('text_reward');
		$data['text_return'] = $this->language->get('text_return');
		$data['text_transaction'] = $this->language->get('text_transaction');
		$data['text_newsletter'] = $this->language->get('text_newsletter');
		$data['text_recurring'] = $this->language->get('text_recurring');
		$data['text_logout'] = $this->language->get('text_logout');
		$data['text_lg'] = $this->language->get('text_lg');
		$data['text_no'] = $this->language->get('text_no');
		$data['result2'] = $this->language->get('result2');
		$data['result3'] = $this->language->get('result3');
		$data['result4'] = $this->language->get('result4');
		$data['result5'] = $this->language->get('result2');
		$data['text_news'] = $this->language->get('text_news');
		$data['text_news_yes'] = $this->language->get('text_news_yes');
		$data['text_news_no'] = $this->language->get('text_news_no');
		$data['text_empty'] = $this->language->get('text_empty');
		$data['text_empty2'] = $this->language->get('text_empty2');
		$data['text_empty3'] = $this->language->get('text_empty3');
		$data['button_continue'] = $this->language->get('button_continue');
		$data['text_reward1'] = $this->language->get('text_reward1');
		$data['text_reward2'] = $this->language->get('text_reward2');
		$data['text_reward3'] = $this->language->get('text_reward3');
		$data['text_reward4'] = $this->language->get('text_reward4');
		$data['text_model'] = $this->language->get('text_model');
		$data['text_price'] = $this->language->get('text_price');
		$data['button_cart'] = $this->language->get('button_cart');
		$data['text_wish'] = $this->language->get('text_wish');
		$data['text_more'] = $this->language->get('text_more');
		$data['text_order'] = $this->language->get('text_order');
		$data['text_email'] = $this->language->get('text_email');
		$data['text_log'] = $this->language->get('text_log');
		$data['text_info'] = $this->language->get('text_info');
		$data['text_account'] = $this->language->get('text_account');
		$data['error_password'] = $this->language->get('error_password');
		$data['error_confirm'] = $this->language->get('error_confirm');
		$data['error_exists'] = $this->language->get('error_exists');
		$data['error_email'] = $this->language->get('error_email');
		$data['error_telephone'] = $this->language->get('error_telephone');
		$data['error_firstname'] = $this->language->get('error_firstname');
		$data['text_ord'] = $this->language->get('text_ord');
		$data['text_save'] = $this->language->get('text_save');
		$data['text_add1'] = $this->language->get('text_add1');
		$data['text_add2'] = $this->language->get('text_add2');
		$data['text_add3'] = $this->language->get('text_add3');

		$data['logout'] = $this->url->link('account/logout', '', true);
		$data['continue'] = $this->url->link('account/account', '', true);

		$data['action1'] = $this->url->link('account/password', '', true);

		
		if (isset($this->request->post['password'])) {
			$data['password'] = $this->request->post['password'];
		} else {
			$data['password'] = '';
		}

		if (isset($this->request->post['confirm'])) {
			$data['confirm'] = $this->request->post['confirm'];
		} else {
			$data['confirm'] = '';
		}
		
		$data['credit_cards'] = array();
		
		$files = glob(DIR_APPLICATION . 'controller/extension/credit_card/*.php');
		
		foreach ($files as $file) {
			$code = basename($file, '.php');
			
			if ($this->config->get($code . '_status') && $this->config->get($code . '_card')) {
				$this->load->language('extension/credit_card/' . $code);

				$data['credit_cards'][] = array(
					'name' => $this->language->get('heading_title'),
					'href' => $this->url->link('extension/credit_card/' . $code, '', true)
				);
			}
		}

		$data['newsletter2'] = $this->customer->getNewsletter();

		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}

		$this->load->model('account/reward');
		$this->load->model('account/wishlist');
		$this->load->model('catalog/product');
		$this->load->model('tool/image');
		$this->load->model('account/order');
		$this->load->model('account/address');
		$this->load->model('account/customer');
		$data['rewards'] = array();

		$filter_data1 = array(
			'sort'  => 'date_added',
			'order' => 'DESC',
			'start' => ($page - 1) * 10,
			'limit' => 10
		);

		$reward_total = $this->model_account_reward->getTotalRewards();

		$results = $this->model_account_reward->getRewards($filter_data1);

		foreach ($results as $result) {
			$data['rewards'][] = array(
				'order_id'    => $result['order_id'],
				'points'      => $result['points'],
				'description' => $result['description'],
				'date_added'  => date($this->language->get('date_format_short'), strtotime($result['date_added'])),
				'href'        => $this->url->link('account/order/info', 'order_id=' . $result['order_id'], true)
			);
		}

		$pagination1 = new Pagination();
		$pagination1->total = $reward_total;
		$pagination1->page = $page;
		$pagination1->limit = 10;
		$pagination1->text_next = $this->language->get('text_pagination2');
		$pagination1->url = $this->url->link('account/reward', 'page={page}', true);

		$data['pagination1'] = $pagination1->render();

		$data['results1'] = sprintf($this->language->get('text_pagination'), ($reward_total) ? (($page - 1) * 10) + 1 : 0, ((($page - 1) * 10) > ($reward_total - 10)) ? $reward_total : ((($page - 1) * 10) + 10), $reward_total, ceil($reward_total / 10));

		$data['total'] = (int)$this->customer->getRewardPoints();

		$data['products_wish'] = array();

		$results = $this->model_account_wishlist->getWishlist();

		foreach ($results as $result) {
			$product_info = $this->model_catalog_product->getProduct($result['product_id']);

			if ($product_info) {
				if ($product_info['image']) {
					$image = $this->model_tool_image->resize($product_info['image'], 94,62);
				} else {
					$image = false;
				}

				if ($product_info['quantity'] <= 0) {
					$stock = $product_info['stock_status'];
				} elseif ($this->config->get('config_stock_display')) {
					$stock = $product_info['quantity'];
				} else {
					$stock = $this->language->get('text_instock');
				}

				if ($this->customer->isLogged() || !$this->config->get('config_customer_price')) {
					$price = $this->currency->format($this->tax->calculate($product_info['price'], $product_info['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
				} else {
					$price = false;
				}

				if ((float)$product_info['special']) {
					$special = $this->currency->format($this->tax->calculate($product_info['special'], $product_info['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
				} else {
					$special = false;
				}

				$data['products_wish'][] = array(
					'product_id' => $product_info['product_id'],
					'thumb'      => $image,
					'name'       => $product_info['name'],
					'model'      => $product_info['model'],
					'stock'      => $stock,
					'price'      => $price,
					'special'    => $special,
					'href'       => $this->url->link('product/product', 'product_id=' . $product_info['product_id']),
					'remove'     => $this->url->link('account/wishlist', 'remove=' . $product_info['product_id'])
				);
			} else {
				$this->model_account_wishlist->deleteWishlist($result['product_id']);
			}
		}

		$results2 = $this->model_account_order->getOrders(($page - 1) * 10, 10);
		$data['orders'] = array();
		foreach ($results2 as $result) {
			$product_total = $this->model_account_order->getTotalOrderProductsByOrderId($result['order_id']);
			$voucher_total = $this->model_account_order->getTotalOrderVouchersByOrderId($result['order_id']);
			$order_info = $this->model_account_order->getOrder($result['order_id']);

			$products2 = array();

			if ($order_info) {

			$this->load->model('catalog/product');
			$this->load->model('tool/upload');

			// Products

			$products = $this->model_account_order->getOrderProducts($result['order_id']);

			foreach ($products as $product) {
				$product_info = $this->model_catalog_product->getProduct($product['product_id']);
				if ($product_info['image']) {
					$thumb = $this->model_tool_image->resize($product_info['image'], 94,62);
					$this->document->setOgImage($product_info['image']);
				} else {
					$thumb = '';
				}
				$products2[] = array(
					'name'     => $product['name'],
					'model'    => $product['model'],
					'thumb' => $thumb,
					'quantity' => $product['quantity'],
					'href'       => $this->url->link('product/product', 'product_id=' . $product['product_id']),
					'price'    => $this->currency->format($product['price'] + ($this->config->get('config_tax') ? $product['tax'] : 0), $order_info['currency_code'], $order_info['currency_value']),
					'total'    => $this->currency->format($product['total'] + ($this->config->get('config_tax') ? ($product['tax'] * $product['quantity']) : 0), $order_info['currency_code'], $order_info['currency_value'])
				);
			}
			}			

			$data['orders'][] = array(
				'order_id'   => $result['order_id'],
				'name'       => $result['firstname'] . ' ' . $result['lastname'],
				'status'     => $result['status'],
				'date_added' => date($this->language->get('date_format_short'), strtotime($result['date_added'])),
				'prod' => $products2,
				'products'   => ($product_total + $voucher_total),
				'total_text' => sprintf($this->language->get('text_total_order'), ($product_total + $voucher_total), $this->currency->format($result['total'], $result['currency_code'], $result['currency_value'])),
				'total'      => $this->currency->format($result['total'], $result['currency_code'], $result['currency_value'])
			);
		}
		$customer_info = $this->model_account_customer->getCustomer($this->customer->getId());
		if (isset($this->request->post['firstname'])) {
			$data['firstname'] = $this->request->post['firstname'];
		} elseif (!empty($customer_info)) {
			$data['firstname'] = $customer_info['firstname'];
		} else {
			$data['firstname'] = '';
		}

		if (isset($this->request->post['email'])) {
			$data['email'] = $this->request->post['email'];
		} elseif (!empty($customer_info)) {
			$data['email'] = $customer_info['email'];
		} else {
			$data['email'] = '';
		}

		if (isset($this->request->post['telephone'])) {
			$data['telephone'] = $this->request->post['telephone'];
		} elseif (!empty($customer_info)) {
			$data['telephone'] = $customer_info['telephone'];
		} else {
			$data['telephone'] = '';
		}
		
		$data['wishlist'] = $this->url->link('account/wishlist');
		$data['order'] = $this->url->link('account/order', '', true);
		$data['download'] = $this->url->link('account/download', '', true);
		
		if ($this->config->get('reward_status')) {
			$data['reward'] = $this->url->link('account/reward', '', true);
		} else {
			$data['reward'] = '';
		}		

		$data['addresses'] = array();

		$results = $this->model_account_address->getAddresses();

		foreach ($results as $result) {

			$data['addresses'][] = array(
				'address_id' => $result['address_id'],
				'address1'    => $result['address_1'],
				'address2'    => $result['address_2']
			);
		}
		
		$data['return'] = $this->url->link('account/return', '', true);
		$data['transaction'] = $this->url->link('account/transaction', '', true);
		$data['newsletter'] = $this->url->link('account/newsletter', '', true);
		$data['recurring'] = $this->url->link('account/recurring', '', true);
		
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');
		
		$this->response->setOutput($this->load->view('account/account', $data));
	}
	public function newsletter() {
		$this->load->model('account/customer');
		$this->model_account_customer->editNewsletter($this->request->post['newsletter']);
		$this->session->data['success'] = $this->language->get('text_success');
	}
	public function password() {
		$json['password']='';
		$json['confirm']='';
		if ((utf8_strlen($this->request->post['password']) < 4) || (utf8_strlen($this->request->post['password']) > 20)) {
			$json['password'] = $this->language->get('error_password');
		}

		if ($this->request->post['confirm'] != $this->request->post['password']) {
			$json['confirm'] = $this->language->get('error_confirm');
		}
		if($json['password']!='' || $json['confirm']!='') {
			$this->response->addHeader('Content-Type: application/json');
			$this->response->setOutput(json_encode($json));
		}
		$this->load->model('account/customer');

		$this->model_account_customer->editPassword($this->customer->getEmail(), $this->request->post['password']);

		$this->session->data['success'] = $this->language->get('text_success');

			// Add to activity log
		if ($this->config->get('config_customer_activity')) {
			$this->load->model('account/activity');

			$activity_data = array(
				'customer_id' => $this->customer->getId(),
				'name'        => $this->customer->getFirstName() . ' ' . $this->customer->getLastName()
			);

			$this->model_account_activity->addActivity('password', $activity_data);
		}
	}
	public function editaddress() {
		$this->load->model('account/address');
		$this->model_account_address->editAddress($this->request->post['address_id'], $this->request->post);
	}
	public function addaddress() {
		$this->load->model('account/address');
		$this->model_account_address->addAddress($this->request->post);
	}
	public function editcustomer() {
		$this->load->model('account/customer');
		$json['firstname']='';
		$json['email']='';
		$json['warning']='';
		$json['phone']='';

		if ((utf8_strlen(trim($this->request->post['firstname'])) < 1) || (utf8_strlen(trim($this->request->post['firstname'])) > 32)) {
			$json['firstname'] = $this->language->get('error_firstname');
		}
		if ((utf8_strlen($this->request->post['email']) > 96) || !preg_match($this->config->get('config_mail_regexp'), $this->request->post['email'])) {
			$json['email'] = $this->language->get('error_email');
		}
		if (($this->customer->getEmail() != $this->request->post['email']) && $this->model_account_customer->getTotalCustomersByEmail($this->request->post['email'])) {
			$json['warning'] = $this->language->get('error_exists');
		}
		if ((utf8_strlen($this->request->post['telephone']) < 3) || (utf8_strlen($this->request->post['telephone']) > 32)) {
			$json['telephone'] = $this->language->get('error_telephone');
		}

		if($json['firstname']!='' || $json['email']!='' || $json['warning']!='' || $json['telephone']!='') {
			$this->response->addHeader('Content-Type: application/json');
			$this->response->setOutput(json_encode($json));
			return $json;
		}
		$this->load->model('account/customer');
		$this->model_account_customer->editCustomer($this->request->post);
	}

	public function country() {
		$json = array();

		$this->load->model('localisation/country');

		$country_info = $this->model_localisation_country->getCountry($this->request->get['country_id']);

		if ($country_info) {
			$this->load->model('localisation/zone');

			$json = array(
				'country_id'        => $country_info['country_id'],
				'name'              => $country_info['name'],
				'iso_code_2'        => $country_info['iso_code_2'],
				'iso_code_3'        => $country_info['iso_code_3'],
				'address_format'    => $country_info['address_format'],
				'postcode_required' => $country_info['postcode_required'],
				'zone'              => $this->model_localisation_zone->getZonesByCountryId($this->request->get['country_id']),
				'status'            => $country_info['status']
			);
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}
}
