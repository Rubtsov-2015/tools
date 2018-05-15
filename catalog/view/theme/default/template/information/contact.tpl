<?php echo $header; ?>
<div class="breadcrums_wrapper">
            <ul>
              <?php foreach ($breadcrumbs as $breadcrumb) { ?>
                <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
                <?php } ?>
            </ul>
          </div>
<div class="contacts_page_wrapper">
            <h2 class="page_title"><?php echo $heading_title; ?></h2>
            <ul class="contacts_list">
              <li>
                <i class="icon-clock"></i>
                <h3><?php echo $text_office; ?></h3>
                <?php echo $office; ?>
              </li>
              <li>
                <i class="icon-telephone"></i>
                <h3><?php echo $text_phone; ?></h3>
                <p><a href="tel:<?php echo $phone['phone1']; ?>"><?php echo $phone['phone1']; ?></a></p>
                <p><a href="tel:<?php echo $phone['phone2']; ?>"><?php echo $phone['phone2']; ?></a></p>
                <p><a href="tel:<?php echo $phone['phone3']; ?>"><?php echo $phone['phone3']; ?></a></p>
              </li>
              <li>
                <i class="icon-e-mail-envelope"></i>
                <h3><?php echo $text_email; ?></h3>
                <p><a href="mailto:<?php echo $email2; ?>"><?php echo $email2; ?></a></p>
              </li>
              <li>
                <i class="icon-shopping-cart-of-checkered-design"></i>
                <h3><?php echo $text_online; ?></h3>
                <p><?php echo $text_online2; ?></p>
              </li>
            </ul>
            <div class="feedback_form">
              <h3><?php echo $text_recall; ?></h3>

              <form class="call3">
                <fieldset>
                  <div class="input_holder">
                    <label>
                      <input type="text" name="name" placeholder="<?php echo $text_name; ?>" required>
                    </label>
                  </div>
                  <div class="input_holder">
                    <label>
                      <input name="phone" type="text" class="phone" placeholder="+38 - (___)-___-__-__" required>
                    </label>
                  </div>
                  <div class="input_holder">
                    <label>
                      <input type="email" name="email" placeholder="<?php echo $text_email; ?>" required>
                    </label>
                  </div>
                  <div class="submit_holder">
                    <input type="submit" value="<?php echo $button_call2; ?>">
                    <div class="result"><?php echo $result; ?></div>
                  </div>
                </fieldset>
              </form>
            </div>
          </div>
          <script>
            $('.call3').submit(function(e) {
              var name=$(this).find('input[name="name"]').val();
              var email=$(this).find('input[name="email"]').val();
              var phone=$(this).find('input[name="phone"]').val();
              e.preventDefault();
              $.ajax({
                url: 'index.php?route=common/footer/contact',
                type: 'post',
                data: 'name='+name+'&email='+email+'&phone='+phone,
                success: function(json) {
                  $('.call3 .result').show();
                  setTimeout("$('.result').hide()",5000);
                },
                error: function(xhr, ajaxOptions, thrownError) {
                  alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                }
              });
            });
          </script>
<?php echo $footer; ?>