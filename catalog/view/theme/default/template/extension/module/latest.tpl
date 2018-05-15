<div class="top_arrow_carousel_section">
            <h2><?php echo $heading_title; ?></h2>
            <ul class="top_arrow_carousel variable_carousel products_carousel">
              <?php $index=1; foreach ($products as $product) { ?>
              <?php if($index%5==0) { ?>
              <li class="max_variable_slide">
                <div class="products_holder">
                  <a href="<?php echo $product['href']; ?>" class="max_variable_visual">
                    <img src="<?php echo $product['image']; ?>" alt="">
                  </a>
                  <div class="max_variable_holder">
                    <a href="<?php echo $product['href']; ?>" class="visual"><img src="<?php echo $product['image']; ?>" alt=""></a>
                    <h3><?php echo $product['name']; ?></h3>
                    <div class="characteristic_list">
                      <?php if ($product['attr']) { ?>
                            <?php $index=1; foreach ($product['attr'] as $attribute_group) { ?>
                              <?php foreach ($attribute_group['attribute'] as $attribute) { ?>
                                <p><?php echo $attribute['name']; ?> <span><?php echo $attribute['text']; ?></span></p>
                              <?php if($index>4) break; $index++; } ?>
                            <?php } ?>
                        <?php } ?>
                    </div>
                    <div class="prod_price_wrapper">
                      <div class="price_holder">
                        <b><?php echo $text_price; ?></b>
                        <span><?php if($product['special']) { echo $product['special']; } else { echo $product['price']; } ?></span>
                      </div>
                      <div class="actions_holder">
                      <a onclick="compare.add('<?php echo $product['product_id']; ?>');" class="change"><i class="icon-exchange"></i></a>
                      <a onclick="cart.add('<?php echo $product['product_id']; ?>');" class="buy"><?php echo $button_cart; ?></a>
                      <a onclick="wishlist.add('<?php echo $product['product_id']; ?>',$(this));" class="addfav <?php echo ($product['wish']) ? 'wish-done':'';?>">
                                      <i class="far fa-heart"></i>
                                      <i class="fas fa-heart"></i>
                                    </a>
                    </div>
                    </div>
                  </div>
                </div>
              </li>
              <?php } else { ?>
              <li>
                <div class="products_holder">
                  <a href="<?php echo $product['href']; ?>" class="visual"><img src="<?php echo $product['thumb']; ?>" alt=""></a>
                  <h3><?php echo $product['name']; ?></h3>
                  <div class="prod_price_wrapper">
                    <div class="price_holder">
                        <b><?php echo $text_price; ?></b>
                        <span><?php if($product['special']) { echo $product['special']; } else { echo $product['price']; } ?></span>
                      </div>
                    <div class="actions_holder">
                      <a onclick="compare.add('<?php echo $product['product_id']; ?>');" class="change"><i class="icon-exchange"></i></a>
                      <a onclick="cart.add('<?php echo $product['product_id']; ?>');" class="buy"><?php echo $button_cart; ?></a>
                      <a onclick="wishlist.add('<?php echo $product['product_id']; ?>');" class="addfav">
                        <i class="far fa-heart"></i>
                        <i class="fas fa-heart"></i>
                      </a>
                    </div>
                  </div>
                </div>
              </li><?php } ?>           
              <?php $index++; } ?>
            </ul>
            <div class="view_all"><a href="<?php echo $latest; ?>"><?php echo $text_all; ?></a></div>
          </div>