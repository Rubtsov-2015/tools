<?php
class ModelModuleNsmenu extends Model {
	public function MegaMenuTypeLink($data){
		$this->load->model('tool/image');
		$result_menu_link = array();
		if($data['image']){
			$thumb = $this->model_tool_image->resize($data['thumb'], 25, 25);
		} else {
			$thumb = "";
		}
		$type_link_data['result_menu_link'] = array(
			'type' 				=> "link",
			'thumb' 			=> $thumb,
			'children' 			=> false,
			'href' 				=> (trim($data['link']))?$data['link']:"javascript:void(0);",
			'name' 				=> $data['namemenu'],
			'sticker_parent' 	=> $data['sticker_parent'],
			'additional_menu' 	=> $data['additional_menu'],
			'new_blank' 		=> (isset($data['new_blank']))?$data['new_blank']:'0',
		);		
			return $type_link_data['result_menu_link'];     
	}
	public function MegaMenuTypeInformation($data){
		$this->load->model('tool/image');
		$this->load->model('catalog/information');		
		$result_menu_information=array();
		if($data['image']){
			$thumb = $this->model_tool_image->resize($data['image'], 25, 25);
		} else {
			$thumb = "";
		}
		if($data['use_add_html']){
			$add_html = $data['add_html'];
		} else { 
			$add_html = "";
		}
		$result['result_information'] = array();
		if(!empty($data['informations_list'])){
			foreach($data['informations_list'] as $information_id){
				$information = $this->model_catalog_information->getInformation($information_id);
				if($information){
					$result['result_information'][]=array(
						'sort_order' => $information['sort_order'],
						'name'  => $information['title'],
						'href'  => $this->url->link('information/information', 'information_id=' . $information['information_id']),
					);	
				}
			}
		}
		if(!empty($result['result_information'])){
			foreach ($result['result_information'] as $key => $value) {
				$sort_order[$key] = $value['sort_order'];
			}
			array_multisort($sort_order, SORT_ASC, $result['result_information']);
		}
		
		
		$type_link_data['result_menu_information'] = array(
			'type' 				=> "information",
			'thumb' 			=> $thumb,
			'children' 			=> $result['result_information'],
			'add_html' 			=> $add_html,
			'href' 				=> (trim($data['link']))?$data['link']:"javascript:void(0);",
			'name' 				=> $data['namemenu'],
			'sticker_parent' 	=> $data['sticker_parent'],
			'additional_menu' 	=> $data['additional_menu'],
			'new_blank' 		=> (isset($data['new_blank']))?$data['new_blank']:'0',
		);	
	
		
        return $type_link_data['result_menu_information'];	
	}
	
	public function MegaMenuTypeManufacturer($data){
		$this->load->model('catalog/manufacturer');
		$this->load->model('tool/image');
		$result_menu_manufacturer=array();
		if($data['image']){
			$thumb_menu = $this->model_tool_image->resize($data['image'], 25, 25);
		} else {
			$thumb_menu = "";
		}
		if($data['use_add_html']) {
			$add_html = $data['add_html'];
		} else { 
			$add_html = "";
		}
		$data['result_manufacturer']=array();
		if(!empty($data['manufacturers_list'])){
			foreach($data['manufacturers_list'] as $manufacturer_id){
				$manufacturer = $this->model_catalog_manufacturer->getManufacturer($manufacturer_id);
				if($manufacturer){
						$thumb = "";
					if (is_file(DIR_IMAGE . $manufacturer['image'])) {
						$thumb = $this->model_tool_image->resize($manufacturer['image'], 50, 50);
					} else {
						$thumb = $this->model_tool_image->resize('no_image.png', 50, 50);			
					}
			
					$data['result_manufacturer'][] = array(
						'name'  => 	$manufacturer['name'],
						'href'  => 	$this->url->link('product/manufacturer/info', 'manufacturer_id=' . $manufacturer['manufacturer_id']),
						'thumb'	=>	$thumb
					);	
				}
			}
		}
		$type_link_data['result_menu_manufacturer'] = array(
			'type' 				=> "manufacturer",
			'thumb' 			=> $thumb_menu,
			'children' 			=> $data['result_manufacturer'],
			'add_html' 			=> $add_html,
			'href' 				=> (trim($data['link']))?$data['link']:"javascript:void(0);",
			'name' 				=> $data['namemenu'],
			'sticker_parent' 	=> $data['sticker_parent'],
			'additional_menu' 	=> $data['additional_menu'],
			'new_blank' 		=> (isset($data['new_blank']))?$data['new_blank']:'0',
		);	
		return $type_link_data['result_menu_manufacturer'];		
	}
	public function MegaMenuTypeProduct($data){		
		$this->load->model('catalog/product');
		$this->load->model('tool/image');
		$width = ((int)$data['product_width']>0)?(int)$data['product_width']:50;
		$height = ((int)$data['product_height']>0)?(int)$data['product_height']:50;
		$result_menu_product=array();
		if($data['image']){
			$thumb_menu = $this->model_tool_image->resize($data['image'], 25, 25);
		} else {
			$thumb_menu = "";
		}
		if($data['use_add_html']) {
			$add_html = $data['add_html'];
		} else { 
			$add_html = "";
		}
		$data['result_product']=array();
		if(is_array($data['products_list'])){
			foreach($data['products_list'] as $product_id){
				$product_info = $this->model_catalog_product->getProduct($product_id);
				if($product_info){
					$thumb = "";				
					if (is_file(DIR_IMAGE . $product_info['image'])) {
						$thumb = $this->model_tool_image->resize($product_info['image'], $width, $height);
					} else {
						$thumb = $this->model_tool_image->resize('no_image.png', $width, $height);			
					}
					if (VERSION >= 2.2) {
						$currency = $this->session->data['currency'];
					} else {
						$currency = '';
					}					
					if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
						$data['price'] = $this->currency->format($this->tax->calculate($product_info['price'], $product_info['tax_class_id'], $this->config->get('config_tax')), $currency);
					} else {
						$data['price'] = false;
					}
									
					if ((float)$product_info['special']) {
						$data['special'] = $this->currency->format($this->tax->calculate($product_info['special'], $product_info['tax_class_id'], $this->config->get('config_tax')), $currency);
					} else {
						$data['special'] = false;
					}	
					$data['result_product'][]=array(
						'name'  => $product_info['name'],
						'href'  => $this->url->link('product/product', 'product_id=' . $product_info['product_id'])	,
						'thumb'	=> $thumb,
						'price'	=> $data['price'],
						'special'=>$data['special']
					);	
				}	
			}
		}	
		$type_link_data['result_menu_product'] = array(
			'type' 				=> "product",
			'children' 			=> $data['result_product'],
			'href' 				=> (trim($data['link']))?$data['link']:"javascript:void(0);",
			'name' 				=> $data['namemenu'],
			'sticker_parent' 	=> $data['sticker_parent'],
			'additional_menu' 	=> $data['additional_menu'],
			'new_blank' 		=> (isset($data['new_blank']))?$data['new_blank']:'0',
			'add_html' 			=> $add_html,
			'thumb' 			=> $thumb_menu,
		);
					
		return $type_link_data['result_menu_product'];
	}
    public function getCategoryPath($category_id){
		$query = $this->db->query("SELECT path_id FROM " . DB_PREFIX . "category_path WHERE category_id='". (int)$category_id ."' ORDER BY LEVEL");						
		if($query->rows){
			$result=array();
			foreach($query->rows as $row){ 	
				$result[]=$row['path_id'];
			}
			return $result;
		} else {
			return false;
		}
	}
	public function MegaMenuTypeCategory($data){
		$this->load->model('catalog/category');
		$this->load->model('tool/image');
		
		$width=((int)$data['category_img_width']>0)?(int)$data['category_img_width']:50;
		$height=((int)$data['category_img_height']>0)?(int)$data['category_img_height']:50;
		if($data['image']){
			$thumb_menu = $this->model_tool_image->resize($data['image'], 25, 25);
		} else {
			$thumb_menu = "";
		}
		if($data['use_add_html']) {
			$add_html = $data['add_html'];
		} else { 
			$add_html = "";
		}
		
		$result_category=array();
		if(!empty($data['category_list'])){
			$data_categories_list = $data['category_list'];
		} else {
			$data_categories_list = '';
		}
		
		if (!empty($data_categories_list)){
			foreach ($data_categories_list as $key => $value) {
				$sort_menu[$key] = $data['sort_category'][$value];
			} 
			array_multisort($sort_menu, SORT_ASC, $data_categories_list);
		}
		
		if(is_array($data_categories_list)){
			$category_list=array();
			foreach($data_categories_list as $cat){
				$category = $this->model_catalog_category->getCategory($cat);
				if($category){
					$category_list[]=$category;
				}

			}
			
			foreach($category_list as $category){
				if($category){
					$thumb="";
					if($data['variant_category']=="full_image"){
						if (is_file(DIR_IMAGE . $category['image'])) {
						$thumb = $this->model_tool_image->resize($category['image'], $width, $height);
						} else {
						$thumb = $this->model_tool_image->resize('no_image.png', $width, $height);			
						}
					}		

					$children_data=array();
					if($data['show_sub_category']){
						$children = $this->model_catalog_category->getCategories($category['category_id']);
						if($children){
							foreach ($children as $child) {
								$path=$this->getCategoryPath($child['category_id']);		
								if($path)
								$path=implode("_",$path);
								
								if(!empty($data['sticker'][$child['category_id']])) {
									$sticker_category = $data['sticker'][$child['category_id']];
								} else {
									$sticker_category = '0';
								}
								
								$children_data[] = array(
									'sticker_category'  => $sticker_category,
									'name'  => $child['name'],
									'href'  => $this->url->link('product/category', 'path=' . $path)
								);
							}	
							
						}
					}
					
					$path = $this->getCategoryPath($category['category_id']);
									
					if($path)
					$path=implode("_",$path);
					if(isset($data['sticker'][$category['category_id']])){
						$sticker_category = $data['sticker'][$category['category_id']];
					} else {
						$sticker_category = '0';
					}
					$result_category[]=array(
						'name'  			=> $category['name'],
						'sticker_category'  => $sticker_category,
						'href'  			=> $this->url->link('product/category', 'path=' . $path),
						'children'  		=> $children_data,
						'thumb'				=> $thumb
					);	
				}
			}
		}
		
		
		$result_menu_category = array();
		$type_link_data['result_menu_category'] = array(
			'type' 				=> "category",
			'children' 			=> $result_category,
			'subtype' 			=> $data['variant_category'],
			'href' 				=> (trim($data['link']))?$data['link']:"javascript:void(0);",
			'name' 				=> $data['namemenu'],
			'sticker_parent' 	=> $data['sticker_parent'],
			'additional_menu' 	=> $data['additional_menu'],
			'new_blank' 		=> (isset($data['new_blank']))?$data['new_blank']:'0',
			'add_html' 			=> $add_html,
			'thumb' 			=> $thumb_menu,
		);
		return $type_link_data['result_menu_category'];
		
	}
	public function MegaMenuTypeHtml($data){
		$this->load->model('tool/image');
		$result_menu_html = array();
		if($data['image']){
			$thumb_menu = $this->model_tool_image->resize($data['image'], 25, 25);
		} else {
			$thumb_menu = "";
		}
		$type_link_data['result_menu_html'] = array(
			'type' 				=> "html",
			'children'			=> true,
			'href' 				=> (trim($data['link']))?$data['link']:"javascript:void(0);",
			'name' 				=> $data['namemenu'],
			'sticker_parent' 	=> $data['sticker_parent'],
			'additional_menu' 	=> $data['additional_menu'],
			'new_blank' 		=> (isset($data['new_blank']))?$data['new_blank']:'0',
			'html' 				=> $data['html_block'],
			'thumb' 			=> $thumb_menu,
		);
			return $type_link_data['result_menu_html'];
	}
 
}