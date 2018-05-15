<?php echo $header; ?>
<div class="breadcrums_wrapper">
            <ul>
              <?php foreach ($breadcrumbs as $breadcrumb) { ?>
              <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
            <?php } ?>
            </ul>
          </div>
          <div class="user_form_action_wrapper">
            <h2 class="page_title"><?php echo $heading_title; ?></h2>
            <?php if ($error_warning) { ?>
              <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?></div>
            <?php } ?>
            <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" class="form-horizontal">
              <div class="input_holder <?php if ($error_firstname) { ?>error<?php } ?>">
                <label>
                  <span><?php echo $entry_firstname; ?></span>
                  <input type="text" name="firstname" value="<?php echo $firstname; ?>" id="input-firstname" />
                  <?php if ($error_firstname) { ?>
                    <div class="input_message"><?php echo $error_firstname; ?></div>
                  <?php } ?>
                </label>
              </div>
              <div class="input_holder <?php if ($error_email) { ?>error<?php } ?>">
                <label>
                  <span><?php echo $entry_email; ?></span>
                  <input type="email" name="email" value="<?php echo $email; ?>" id="input-email" />
                  <?php if ($error_email) { ?>
                    <div class="input_message"><?php echo $error_email; ?></div>
                  <?php } ?>
                </label>
              </div>
              <div class="input_holder <?php if ($error_telephone) { ?>error<?php } ?>">
                <label>
                  <span><?php echo $entry_telephone; ?></span>
                  <input type="text" name="telephone" class="phone" placeholder="+38 - (___)-___-__-__" id="input-telephone">
                  <?php if ($error_telephone) { ?>
                    <div class="input_message"><?php echo $error_telephone; ?></div>
                  <?php } ?>
                </label>
              </div>
              <div class="input_holder <?php if ($error_password) { ?>error<?php } ?>">
                <label>
                  <span><?php echo $entry_password; ?></span>
                  <input type="password" name="password" id="input-password">
                  <?php if ($error_password) { ?>
                    <div class="input_message"><?php echo $error_password; ?></div>
                  <?php } ?>
                </label>
              </div>
              <div class="input_holder <?php if ($error_confirm) { ?>error<?php } ?>">
                <label>
                  <span><?php echo $entry_confirm; ?></span>
                  <input type="password" name="confirm" id="input-confirm">
                  <?php if ($error_confirm) { ?>
                    <div class="input_message"><?php echo $error_confirm; ?></div>
                  <?php } ?>
                </label>
              </div>
              <div class="input_holder">
                <label>
                  <i class="checkbox_holder">
                    <input name="newsletter" type="checkbox" checked>
                    <b></b>
                  </i>
                  <span><?php echo $text_newsletter; ?></span>
                </label>
              </div>
              <div class="submit_holder">
                <input type="submit" value="<?php echo $button_register; ?>" />
              </div>
              <div class="another_user_action"><a href="<?php echo $login; ?>"><?php echo $text_login; ?></a></div>          
            </form>
    </div>
<?php echo $footer; ?>
