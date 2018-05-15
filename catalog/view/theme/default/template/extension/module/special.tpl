<div class="top_arrow_carousel_section">
            <h2><?php echo $heading_title; ?></h2>
            <ul class="top_arrow_carousel products_carousel">
              <?php foreach ($products as $product) { ?>
              <li>
                <div class="products_holder">
                  <a href="<?php echo $product['href']; ?>" class="visual"><img src="<?php echo $product['thumb']; ?>" alt=""></a>
                  <h3><?php echo $product['name']; ?></h3>
                  <div class="prod_price_wrapper">
                    <div class="price_holder">
                      <b><?php echo $text_price; ?></b>
                      <span class="discount"><?php echo $product['special']; ?><i><?php echo $product['price']; ?></i></span>
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
              </li>
              <?php } ?>
            </ul>
            <div class="view_all"><a href="<?php echo $special; ?>"><?php echo $text_all; ?></a></div>
          </div>