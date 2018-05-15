<?php echo $header; ?>
<div class="breadcrums_wrapper">
            <ul class="breadcrumb">
          <?php foreach ($breadcrumbs as $breadcrumb) { ?>
          <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
          <?php } ?>
        </ul>
          </div>
          <div class="user_form_action_wrapper">
  <?php if ($error_warning) { ?>
  <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?></div>
  <?php } ?>
  <div class="user_form_action_wrapper">
              <h2 class="page_title"><?php echo $heading_title; ?></h2>
              <p><?php echo $sub; ?></p>
              <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
                <div class="input_holder">
                  <label>
                    <span><?php echo $entry_email; ?></span>
                  <input type="text" name="email" value="<?php echo $email; ?>" id="input-email" class="form-control" />
                  </label>
                </div>
                <div class="submit_holder">
                  <input type="submit" value="<?php echo $button_forg; ?>">
                </div>
              </form>
            </div>
<?php echo $footer; ?>