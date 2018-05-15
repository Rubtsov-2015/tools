<?php echo $header; ?>
<div class="breadcrums_wrapper">
            <ul>
              <?php foreach ($breadcrumbs as $breadcrumb) { ?>
              <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
            <?php } ?>
            </ul>
          </div>
          <div class="about_us_wrapper">
            <h2 class="page_title"><?php echo $heading_title; ?></h2>
            <?php echo $text_message; ?>
            <div class="submit_holder">
                <a href="<?php echo $continue; ?>"><?php echo $button_continue; ?></a>
              </div>
          </div>
<?php echo $footer; ?>