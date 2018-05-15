<?php echo $header; ?>
<div class="breadcrums_wrapper">
            <ul>
              <?php foreach ($breadcrumbs as $breadcrumb) { ?>
                <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
              <?php } ?>
            </ul>
          </div>
<div class="site_map_section">
            <h2 class="page_title"><?php echo $heading_title; ?></h2>
            <div class="site_map_wrapper">
              <ul class="site_map_block">
                <li class="has_tree_menu">
                  <a href="/"><?php echo $text_home; ?></a>
                  <ul>
                    <?php foreach ($categories as $category_1) { ?>
                      <?php if ($category_1['children']) { ?>
                        <li><a href="<?php echo $category_1['href']; ?>"><?php echo $category_1['name']; ?></a>
                        <ul>
                          <?php foreach ($category_1['children'] as $category_2) { ?>
                          <li><a href="<?php echo $category_2['href']; ?>"><?php echo $category_2['name']; ?></a>
                            <?php if ($category_2['children']) { ?>
                            <ul>
                              <?php foreach ($category_2['children'] as $category_3) { ?>
                              <li><a href="<?php echo $category_3['href']; ?>"><?php echo $category_3['name']; ?></a></li>
                              <?php } ?>
                            </ul>
                            <?php } ?>
                          </li>
                          <?php } ?>
                        </ul>
                        <?php } ?>
                      </li>
                    <?php } ?>
                  </ul>
                </li>
              </ul>
              <ul class="site_map_block">
                <li><a href="<?php echo $special; ?>"><?php echo $text_special; ?></a></li>
                <li class="has_tree_menu">
                  <a href="<?php echo $login; ?>"><?php echo $text_login; ?></a>
                  <ul>
                    <li><a href="<?php echo $ac1; ?>">Моя информация</a></li>
                    <li><a href="<?php echo $ac2; ?>">Избранное</a></li>
                    <li><a href="<?php echo $ac3; ?>">История заказов</a></li>
                    <li><a href="<?php echo $ac4; ?>">Бонусные балы</a></li>
                    <li><a href="<?php echo $ac5; ?>">E-mail рассылка</a></li>
                  </ul>
                </li>
                <li><a href="<?php echo $cart; ?>"><?php echo $text_cart; ?></a></li>
                <li><a href="<?php echo $checkout; ?>"><?php echo $text_checkout; ?></a></li>
                <li><a href="<?php echo $search; ?>"><?php echo $text_search; ?></a></li>
                <li><a href="<?php echo $contacts; ?>"><?php echo $text_contacts; ?></a></li>
                <li><a href="<?php echo $inf1; ?>"><?php echo $text_inf1; ?></a></li>
                <li><a href="<?php echo $inf2; ?>"><?php echo $text_inf2; ?></a></li>
                <li><a href="<?php echo $inf3; ?>"><?php echo $text_inf3; ?></a></li>
              </ul>
            </div>
          </div>
<?php echo $footer; ?>