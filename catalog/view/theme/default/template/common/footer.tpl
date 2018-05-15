</div>
</main>
<footer>
        <div class="center">
          <ul class="footer_contacts_list">
            <li>
              <p><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></p>
              <?php foreach ($informations as $information) { ?>
                <p><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></p>
              <?php } ?>
              <p><a href="<?php echo $sitemap; ?>"><?php echo $text_sitemap; ?></a></p>
            </li>
            <li>
              <p><?php echo $text_office; ?></p>
              <?php echo $office; ?>
            </li>
            <li>
              <p><a href="tel:<?php echo $phone['phone1']; ?>"><?php echo $phone['phone1']; ?></a></p>
              <p><a href="tel:<?php echo $phone['phone2']; ?>"><?php echo $phone['phone2']; ?></a></p>
              <p><a href="tel:<?php echo $phone['phone3']; ?>"><?php echo $phone['phone3']; ?></a></p>
            </li>
            <li>
              <p><a href="#" data-popup="#call_back_pop"><i class="icon-telephone"></i><span><?php echo $text_call; ?></span></a></p>
              <p><a href="#" data-popup="#write_us_pop"><i class="icon-e-mail-envelope"></i><span><?php echo $text_message2; ?></span></a></p>
            </li>
          </ul>
          <ul class="social_list"><?php echo $soc1; ?>
            <li><a href="<?php echo $social['soc1']; ?>"><i class="icon-google-plus"></i></a></li>
            <li><a href="<?php echo $social['soc2']; ?>"><i class="icon-facebook"></i></a></li>
            <li><a href="<?php echo $social['soc3']; ?>"><i class="icon-twitter"></i></a></li>
            <li><a href="<?php echo $social['soc4']; ?>"><i class="icon-instagram-social-outlined-logo"></i></a></li>
          </ul>
          <div class="copy"><?php echo $powered; ?></div>
        </div>
      </footer>
    </div>
    <div class="popup_holder" id="call_back_pop">
      <div class="bg">&nbsp;</div>
      <div class="popup">
        <div class="popup_title">
          <h3><?php echo $text_recall; ?></h3>
        </div>
        <div class="popup_content">
          <form class="popup_form call1">
            <fieldset>
              <div class="popup_input_holder">
                <label>
                  <input name="name" type="text" placeholder="<?php echo $text_name; ?>" required>
                </label>
              </div>
              <div class="popup_input_holder">
                <label>
                  <input name="phone" type="text" class="phone" placeholder="+38 - (___)-___-__-__" required>
                </label>
              </div>
              <div class="popup_submit_holder">
                <input type="submit" value="<?php echo $button_call; ?>">
                <div class="result"><?php echo $result; ?></div>
              </div>
            </fieldset>
          </form>
        </div>
      </div>
    </div>
    <div class="popup_holder" id="write_us_pop">
      <div class="bg">&nbsp;</div>
      <div class="popup">
        <div class="popup_title">
          <h3><?php echo $text_recall; ?></h3>
        </div>
        <div class="popup_content">
          <form class="popup_form call2">
            <fieldset>
              <div class="popup_input_holder">
                <label>
                  <input type="text" name="name" placeholder="<?php echo $text_name; ?>" required>
                </label>
              </div>
              <div class="popup_input_holder">
                <label>
                  <input type="email" name="email" placeholder="<?php echo $text_email; ?>" required>
                </label>
              </div>
              <div class="popup_textarea_holder">
                <textarea rows="5" name="message" placeholder="<?php echo $text_message; ?>"></textarea>
              </div>
              <div class="popup_submit_holder">
                <input type="submit" value="<?php echo $button_call2; ?>">
                <div class="result"><?php echo $result; ?></div>
              </div>
            </fieldset>
          </form>
        </div>
      </div>
    </div>
    <script src="catalog/view/javascript/jquery.matchHeight-min.js"></script>
    <script src="catalog/view/javascript/jquery-ui.min.js"></script>
    <script src="catalog/view/javascript/jQuery.UI.Touch.Punch.0.2.3.js"></script>
    <script src="catalog/view/javascript/masked-input.min.js"></script>
    <script src="catalog/view/javascript/slick.min.js"></script>
    <script src="catalog/view/javascript/jquery.main.js"></script>
</body></html>