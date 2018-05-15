<?php echo $header; ?>
<div class="breadcrums_wrapper">
            <ul class="breadcrumb">
          <?php foreach ($breadcrumbs as $breadcrumb) { ?>
          <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
          <?php } ?>
        </ul>
          </div>

          <div class="user_form_action_wrapper">
            <?php if ($success) { ?>
  <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?></div>
  <?php } ?>
  <?php if ($error_warning) { ?>
  <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?></div>
  <?php } ?>
            <h2 class="page_title"><?php echo $heading_title; ?></h2>
            <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
              <div class="input_holder">
                <label>
                  <span><?php echo $entry_email; ?></span>
                  <input type="text" name="email" value="<?php echo $email; ?>" id="input-email" class="form-control" />
                </label>
              </div>
              <div class="input_holder">
                <label>
                  <span><?php echo $entry_password; ?></span>
                  <input type="password" name="password" value="<?php echo $password; ?>" id="input-password" class="form-control" />
                </label>
              </div>
              <div class="forgot_pass_btn"><a href="<?php echo $forgotten; ?>"><?php echo $text_forgotten; ?></a></div>
              <div class="submit_holder">
                <input type="submit" value="<?php echo $button_login; ?>">
              </div>
              <div class="another_user_action"><a href="<?php echo $register; ?>"><?php echo $text_register; ?></a></div>
            </form>
          </div>
<?php echo $footer; ?>