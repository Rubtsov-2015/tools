<?php if (count($languages) > 1) { ?>
<?php foreach ($languages as $language) { ?>
    <?php if ($language['code'] == $code) { ?>
<a href="#" class="lang_btn">
                  <span><?php echo $language['name']; ?></span></a>
                  <?php }} ?>
                
                <ul class="lg">
                  <?php foreach ($languages as $language) { ?>
                  
                  	<li class="<?php if ($language['code'] == $code) { ?>current<?php } ?>"><a data-code="" data-redirect="<?php echo $redirect; ?>" data-name="<?php echo $language['code']; ?>"><?php echo $language['name']; ?></a></li>
                  <?php } ?>
                </ul>
              <?php } ?>