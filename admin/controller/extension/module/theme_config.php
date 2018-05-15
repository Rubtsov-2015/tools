<?php

class ControllerExtensionModuleThemeConfig extends Controller {

	private $error = [];

	public function index(){
		$this->load->language('extension/module/theme_config');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('setting/setting');
		$this->load->model('localisation/language');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_setting_setting->editSetting('theme_config', $this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$this->cache->delete('theme_config');

			$this->response->redirect($this->url->link('extension/extension', 'token=' . $this->session->data['token'],
				'SSL'));
		}

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_edit'] = $this->language->get('text_edit');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');
		$data['text_header_menu'] = $this->language->get('text_header_menu');
		$data['text_footer_menu'] = $this->language->get('text_footer_menu');
		$data['text_header_text'] = $this->language->get('text_header_text');
		$data['text_footer_text'] = $this->language->get('text_footer_text');
		$data['text_contact_text'] = $this->language->get('text_contact_text');
		$data['text_shipping'] = $this->language->get('text_shipping');
		$data['text_not_found'] = $this->language->get('text_not_found');


		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');
		$data['button_remove'] = $this->language->get('button_remove');
		$data['button_add_menu'] = $this->language->get('button_add_menu');

		if ($this->config->get('config_editor_default')) {
        $this->document->addScript('view/javascript/ckeditor/ckeditor.js');
        $this->document->addScript('view/javascript/ckeditor/ckeditor_init.js');
	    } else {
	        $this->document->addScript('view/javascript/summernote/summernote.js');
	        $this->document->addScript('view/javascript/summernote/lang/summernote-' . $this->language->get('lang') . '.js');
	        $this->document->addScript('view/javascript/summernote/opencart.js');
	        $this->document->addStyle('view/javascript/summernote/summernote.css');
	    }
		$data['lang'] = $this->language->get('lang');
		$data['ckeditor'] = $this->config->get('config_editor_default');
		$data['token'] = $this->session->data['token'];

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		$data['breadcrumbs'] = [];

		$data['breadcrumbs'][] = [
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], 'SSL')
		];

		$data['breadcrumbs'][] = [
			'text' => $this->language->get('text_module'),
			'href' => $this->url->link('extension/extension', 'token=' . $this->session->data['token'], 'SSL')
		];

		$data['breadcrumbs'][] = [
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('extension/module/theme_config', 'token=' . $this->session->data['token'], 'SSL')
		];

		$data['action'] = $this->url->link('extension/module/theme_config', 'token=' . $this->session->data['token'], 'SSL');

		$data['cancel'] = $this->url->link('extension/extension', 'token=' . $this->session->data['token'], 'SSL');

		$data['token'] = $this->session->data['token'];

		if (isset($this->request->post['theme_config'])) {
			$theme_config = $this->request->post['theme_config'];
		} elseif ($this->config->get('theme_config')) {
			$theme_config = $this->config->get('theme_config');
		} else {
			$theme_config = [];
		}

		$this->load->model('tool/image');
		$data['placeholder'] = $this->model_tool_image->resize('no_image.png', 100, 100);


		if (isset($theme_config['social'])) {
			$data['social'] = $theme_config['social'];
		} else {
			$data['social'] = '';
		}
		if (isset($theme_config['phone'])) {
			$data['phone'] = $theme_config['phone'];
		} else {
			$data['phone'] = '';
		}

				

		$data['languages'] = $this->model_localisation_language->getLanguages();

		$data['lang'] = $this->language->get('lang');

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('extension/module/theme_config.tpl', $data));
	}

	protected function validate(){
		if (!$this->user->hasPermission('modify', 'extension/module/theme_config')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		return !$this->error;
	}
}