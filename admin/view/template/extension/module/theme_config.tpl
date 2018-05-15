<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
	<div class="page-header">
		<div class="container-fluid">
			<div class="pull-right">
				<button type="submit" form="form-theme-config" data-toggle="tooltip"
				title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i>
				</button>
				<a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>"
				class="btn btn-default"><i class="fa fa-reply"></i></a></div>
				<h1><?php echo $heading_title; ?></h1>
				<ul class="breadcrumb">
					<?php foreach ($breadcrumbs as $breadcrumb) { ?>
					<li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
					<?php } ?>
				</ul>
			</div>
		</div>
		<div class="container-fluid">
			<?php if ($error_warning) { ?>
			<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
				<button type="button" class="close" data-dismiss="alert">&times;</button>
			</div>
			<?php } ?>
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
				</div>
				<div class="panel-body">
					<form action="<?php echo $action; ?>" method="post" id="form-theme-config" class="form-horizontal">
						<div class="form-group">
														<label class="col-sm-2 control-label"
														for="input-header-text">Телефон 1</label>
														<div class="col-sm-8">
															<input name="theme_config[phone][phone1]" class="form-control" value="<?php if($phone['phone1']) { ?><?php echo $phone['phone1']; ?><?php } ?>">
														</div>
													</div>
						<div class="form-group">
														<label class="col-sm-2 control-label"
														for="input-header-text">Телефон 2</label>
														<div class="col-sm-8">
															<input name="theme_config[phone][phone2]" class="form-control" value="<?php if($phone['phone2']) { ?><?php echo $phone['phone2']; ?><?php } ?>">
														</div>
													</div>
						<div class="form-group">
														<label class="col-sm-2 control-label"
														for="input-header-text">Телефон 3</label>
														<div class="col-sm-8">
															<input name="theme_config[phone][phone3]" class="form-control" value="<?php if($phone['phone3']) { ?><?php echo $phone['phone3']; ?><?php } ?>">
														</div>
													</div>
						<div class="form-group">
														<label class="col-sm-2 control-label"
														for="input-header-text">Ссылка google+</label>
														<div class="col-sm-8">
															<input name="theme_config[social][soc1]" class="form-control" value="<?php if($social['soc1']) { ?><?php echo $social['soc1']; ?><?php } ?>">
														</div>
													</div>
													<div class="form-group">
														<label class="col-sm-2 control-label"
														for="input-header-text">Ссылка facebook</label>
														<div class="col-sm-8">
															<input name="theme_config[social][soc2]" class="form-control" value="<?php if($social['soc2']) { ?><?php echo $social['soc2']; ?><?php } ?>">
														</div>
													</div>
													<div class="form-group">
														<label class="col-sm-2 control-label"
														for="input-header-text">Ссылка twitter</label>
														<div class="col-sm-8">
															<input name="theme_config[social][soc3]" class="form-control" value="<?php if($social['soc3']) { ?><?php echo $social['soc3']; ?><?php } ?>">
														</div>
													</div>
													<div class="form-group">
														<label class="col-sm-2 control-label"
														for="input-header-text">Ссылка instagram</label>
														<div class="col-sm-8">
															<input name="theme_config[social][soc4]" class="form-control" value="<?php if($social['soc4']) { ?><?php echo $social['soc4']; ?><?php } ?>">
														</div>
													</div>
</form>
</div>
</div>
</div>
</div>
<script type="text/javascript"><!--
$(document).ready(function(){
		<?php foreach ($languages as $language) { ?>
			$('#input-header-text1<?php echo $language['language_id']; ?>').summernote({height: 300});
		<?php } ?>
	});
$('#language a:first').tab('show');
//--></script>

<?php echo $footer; ?>