<?php echo $header; ?>
  <div class="breadcrums_wrapper">
            <ul>
              <?php foreach ($breadcrumbs as $breadcrumb) { ?>
                <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
                <?php } ?>
            </ul>
          </div>
          <div class="catalog_wrapper">
            <?php if ($products) { ?>
            <h2><?php echo $heading_title; ?></h2>
            <div class="search_count_info"><?php echo $text_total; ?></div>
            <div class="catalog_products_wrapper">
              
                <div class="parameters_filter_holder">
                  <?php echo $column_left; ?>
                </div>
                <div class="products_catalog_holder">
                  <div class="parameters_btn"><a href="#"><?php echo $text_pr1; ?></a></div>
                  <div class="type_sort_holder">
                    <div class="type_sort_block">
                      <span><?php echo $text_pr2; ?></span>
                      <div class="type_sort_list_block">
                        <div class="selected"><?php foreach ($sorts as $sorts1) { ?>
                            <?php if ($sorts1['value'] == $sort . '-' . $order) { ?>
                            <?php echo $sorts1['text']; ?>
                            <?php } ?>
                            <?php } ?></div>
                        <ul>
                          <?php foreach ($sorts as $sorts2) { ?>
                            <li><a href="<?php echo $sorts2['href']; ?>"><?php echo $sorts2['text']; ?></a></li>
                            <?php } ?>
                        </ul>
                      </div>
                    </div>
                    <div class="type_sort_view">
                      <span><?php echo $text_pr3; ?></span>
                      <ul>
                        <li class="col active"><a href="#"><i class="fas fa-th-large"></i></a></li>
                        <li class="row"><a href="#"><i class="fas fa-list"></i></a></li>
                      </ul>
                    </div>
                  </div>
                  <div class="catalog_products_list_holder">
                    <ul class="appenddivproduct catalog_products_list">
                      <?php foreach ($products as $product) { ?>
                        <li>
                          <div class="products_holder">
                            <a href="<?php echo $product['href']; ?>" class="visual"><img src="<?php echo $product['thumb']; ?>" alt="" width="239" height="157"></a>
                            <div class="catalog_fullinfo_wrapper">
                              <div class="catalog_fullinfo_title">
                                <h3><?php echo $product['name']; ?></h3>
                                <div class="vendor_code"><?php echo $text_pr4; ?>: <?php echo $product['model']; ?></div>
                              </div>
                              <div class="prod_price_wrapper">
                                <div class="characteristic_list">
                                  <?php if ($product['attr']) { ?>
                                    <?php $index=1; foreach ($product['attr'] as $attribute_group) { ?>
                                      <?php foreach ($attribute_group['attribute'] as $attribute) { ?>
                                        <p><?php echo $attribute['name']; ?> <span><?php echo $attribute['text']; ?></span></p>
                                      <?php if($index>4) break; $index++; } ?>
                                    <?php } ?>
                                  <?php } ?>
                                </div>
                                <div class="catalog_product_price">
                                  <div class="price_holder">
                                    <b><?php echo $text_price; ?></b>
                                    <?php if(!$product['special']) { ?>
                                      <span><?php echo $product['price']; ?></span>
                                      <?php } else { ?>
                                        <span class="discount"><?php echo $product['special']; ?><i><?php echo $product['price']; ?></i></span>
                                      <?php } ?>
                                  </div>
                                  <div class="actions_holder">
                                    <a onclick="compare.add('<?php echo $product['product_id']; ?>');" class="change"><i class="icon-exchange"></i></a>
                                    <a onclick="cart.add('<?php echo $product['product_id']; ?>', '<?php echo $product['minimum']; ?>');" class="buy"><?php echo $button_cart; ?></a>
                                    <a onclick="wishlist.add('<?php echo $product['product_id']; ?>',$(this));" class="addfav <?php echo ($product['wish']) ? 'wish-done':'';?>">
                                      <i class="far fa-heart"></i>
                                      <i class="fas fa-heart"></i>
                                    </a>
                                  </div>
                                </div>
                              </div>
                            </div>
                          </div>
                        </li>
                      <?php } ?>
                    </ul>
                    <div class="loadmore_catalog_btn">
                      <?php echo $pagination; ?>
                    </div>
                  </div>
                </div>
              
            </div>
            <?php } else { ?>
                <div class="search_not_found_wrapper">
                  <h2><?php echo $heading_title3; ?></h2>
                  <p><?php echo $text_emp; ?></p>
                  <form class="research">
                    <div class="search_not_found_title"><?php echo $text_call2; ?></div>
                    <div class="input_holder">
                      <label>
                        <input type="text" name="name" placeholder="<?php echo $text_name; ?>" required>
                      </label>
                    </div>
                    <div class="input_holder">
                      <label>
                        <input type="email" name="email" placeholder="<?php echo $text_email; ?>" required>
                      </label>
                    </div>
                    <div class="textarea_holder">
                      <textarea rows="5" name="message" placeholder="<?php echo $text_message2; ?>"></textarea>
                    </div>
                    <div class="submit_holder">
                      <input type="submit" value="<?php echo $button_research; ?>">
                      <div class="result"><?php echo $result; ?></div>
                    </div>
                  </form>
                </div>
                <script>
                  $('.research').submit(function(e) {
                    var name=$(this).find('input[name="name"]').val();
                    var email=$(this).find('input[name="email"]').val();
                    var message=$(this).find('textarea[name="message"]').val();
                    e.preventDefault();
                    $.ajax({
                      url: 'index.php?route=common/footer/research',
                      type: 'post',
                      data: 'name='+name+'&email='+email+'&message='+message,
                      success: function(json) {
                        $('.research .result').show();
                        setTimeout("$('.result').hide()",5000);
                      },
                      error: function(xhr, ajaxOptions, thrownError) {
                        alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                      }
                    });
                  });
                </script>
              <?php } ?>
          </div>
<?php echo $footer; ?>