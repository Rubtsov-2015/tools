<?php echo $header; ?>
<div class="breadcrums_wrapper">
            <ul>
              <?php foreach ($breadcrumbs as $breadcrumb) { ?>
                <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
                <?php } ?>
            </ul>
          </div>
      <section class="product-block">
        <div class="product-wrap">
          <div class="gallery-holder">
            <div class="heading">
              <h1><?php echo $heading_title; ?></h1>
              <span class="code"><?php echo $text_model; ?> <?php echo $model; ?></span>
            </div>
            <ul class="gallery">
              <?php if ($thumb) { ?>
              <li>
                <div class="image-box">
                  <?php if($special) { ?><span class="label" data-label-product="<?php echo $text_spec; ?>"></span><?php } ?>
                  <a class="zoom"><i class="fas fa-search-plus"></i></a>
                  <img src="<?php echo $thumb; ?>" alt="image description">
                </div>
              </li>
            <?php } ?>
            <?php if ($images) { ?>
            <?php foreach ($images as $image) { ?>
              <li>
                <div class="image-box">
                  <?php if($special) { ?><span class="label" data-label-product="<?php echo $text_spec; ?>"></span><?php } ?>
                  <a href="#" class="zoom"><i class="fas fa-search-plus"></i></a>
                  <img src="<?php echo $image['popup']; ?>" alt="image description">
                </div>
              </li>
            <?php } ?>
            <?php } ?>
            </ul>
            <div class="switcher-gallery">
              <div class="frame">
                <ul class="slideset">
                   <li><a href="#"><img src="<?php echo $popup; ?>" alt="image description"></a></li>
                  <?php foreach ($images as $image) { ?>
                    <li><a href="#"><img src="<?php echo $image['thumb']; ?>" alt="image description"></a></li>
                  <?php } ?>
                </ul>
              </div>
              <a href="#" class="btn-prev">prev</a>
              <a href="#" class="btn-next">next</a>
            </div>
          </div>
          <div class="description-holder">
            <div class="description-block">
              <div class="heading">
                <span class="code"><?php echo $text_model; ?> <?php echo $model; ?></span>
                <h1><?php echo $heading_title; ?></h1>
              </div>
              <div class="price-box">
                <div class="box">
                  <?php if($special) { ?>
                    <span class="note"><?php echo $text_price; ?>:</span>
                    <span class="sale-price"><?php echo $special; ?><span><?php echo $price; ?></span></span>
                  <?php } else { ?>
                    <span class="note"><?php echo $text_price; ?>:</span>
                    <span class="sale-price"><?php echo $price; ?></span>
                  <?php } ?>
                  
                </div>
                <div class="btn-wrap">
                  <a href="#" class="buy-now"><?php echo $button_fastorder; ?></a>
                  <a onclick="cart.add(<?php echo $product_id; ?>,1);" class="buy"><?php echo $button_cart; ?></a>
                </div>
              </div>
              <ul class="description-list">
                <?php if ($attribute_groups) { ?>
                                    <?php $index=1; foreach ($attribute_groups as $attribute_group) { ?>
                                      <?php foreach ($attribute_group['attribute'] as $attribute) { ?>
                                       <li>
                                          <span class="note"><?php echo $attribute['name']; ?></span>
                                          <span><?php echo $attribute['text']; ?></span>
                                        </li>
                                      <?php if($index>4) break; $index++; } ?>
                                    <?php } ?>
                                  <?php } ?>
              </ul>
              <div class="action-holder">
                <ul class="action-list">
                  <li>
                    <a onclick="wishlist.add(<?php echo $product_id; ?>);">
                      <i class="far fa-heart"></i>
                      <i class="fas fa-heart"></i>
                      <span><?php echo $button_wishlist; ?></span>
                    </a>
                  </li>
                  <li>
                    <a onclick="compare.add(<?php echo $product_id; ?>);">
                      <i class="icon-exchange"></i>
                      <span><?php echo $button_compare; ?></span>
                    </a>
                  </li>
                </ul>
                <div class="social-img">
                  <script type="text/javascript">(function() {
                if (window.pluso)if (typeof window.pluso.start == "function") return;
                if (window.ifpluso==undefined) { window.ifpluso = 1;
                  var d = document, s = d.createElement('script'), g = 'getElementsByTagName';
                  s.type = 'text/javascript'; s.charset='UTF-8'; s.async = true;
                  s.src = ('https:' == window.location.protocol ? 'https' : 'http')  + '://share.pluso.ru/pluso-like.js';
                  var h=d[g]('body')[0];
                  h.appendChild(s);
                }})();</script>
              <div class="pluso" data-background="transparent" data-options="small,square,line,horizontal,counter,theme=04" data-services="twitter,facebook,google"></div>
                </div>
              </div>
            </div>
            <?php if($products2) { ?>
            <div class="add-holder">
              <div class="frame">
                <div class="slideset">
                  <?php foreach($products2 as $prod) { ?>
                    <div class="slide">
                      <div class="holder">
                        <?php if($prod['top']) { ?><span class="label" data-label-product="<?php echo $text_top; ?>"></span><?php } ?>
                        <div class="text-holder">
                          <img src="<?php echo $prod['thumb']; ?>" alt="" class="alignleft">
                          <div class="buy-holder">
                            <div class="price-box">
                              <?php if($prod['special']) { ?>
                              <span class="price"><?php echo $prod['special']; ?></span>
                              <span class="note"><?php echo $text_price; ?>:</span>
                            <?php } else { ?>
                              <span class="price"><?php echo $prod['price']; ?></span>
                              <span class="note"><?php echo $text_price; ?>:</span>
                            <?php } ?>
                            </div>
                            <a onclick="cart.add(<?php echo $prod['prodct_id']; ?>);" class="buy"><?php echo $button_cart; ?></a>
                          </div>
                          <div class="block">
                            <strong class="title"><?php echo $text_rel; ?></strong>
                            <h2><?php echo $prod['name']; ?></h2>
                          </div>
                        </div>
                      </div>
                    </div>
                  <?php }  ?>
                </div>
              </div>
              <a href="#" class="btn-prev">prev</a>
              <a href="#" class="btn-next">next</a>
            </div>
            <?php } ?>
          </div>
        </div>
        <div class="tab-holder">
          <ul class="tabset">
            <li class="active"><a href="<?php echo $url; ?>#tab1"><?php echo $text_tab1; ?></a></li>
            <li><a href="<?php echo $url; ?>#tab2"><?php echo $text_tab2; ?></a></li>
            <li><a href="<?php echo $url; ?>#tab3"><?php echo $text_tab3; ?></a></li>
          </ul>
          <div class="tab-content active" id="tab1">
            <a href="#" class="opener"><?php echo $text_tab1; ?></a>
            <div class="slide">
              <ul class="product-list">
                <?php if ($products) { ?>
                    <?php foreach ($products as $product) { ?>
                    <li>
                      <img src="<?php echo $product['thumb']; ?>" alt="image description" class="alignleft">
                      <h2><?php echo $product['name']; ?></h2>
                      <ul class="description-list">
                        <?php if ($product['attr']) { ?>
                                    <?php $index=1; foreach ($product['attr'] as $attribute_group) { ?>
                                      <?php foreach ($attribute_group['attribute'] as $attribute) { ?>
                                       <li>
                                          <span class="note"><?php echo $attribute['name']; ?></span>
                                          <span><?php echo $attribute['text']; ?></span>
                                        </li>
                                      <?php if($index>4) break; $index++; } ?>
                                    <?php } ?>
                                  <?php } ?>
                      </ul>
                      <div class="buy-holder">
                        <div class="price-box">
                          <?php if($product['special']) { ?>
                            <span class="price"><?php echo $product['special']; ?></span>
                            <span class="note"><?php echo $text_price; ?>:</span>
                          <?php } else { ?>
                            <span class="price"><?php echo $product['price']; ?></span>
                            <span class="note"><?php echo $text_price; ?>:</span>
                          <?php } ?>
                      </div>
                        <a onclick="cart.add(<?php echo $product['product_id']; ?>);" class="buy"><?php echo $button_cart; ?></a>
                      </div>
                    </li>
                  <?php }} ?>
              </ul>
            </div>
          </div>
          <div class="tab-content" id="tab2">
            <a href="#" class="opener"><?php echo $text_tab2; ?></a>
            <div class="slide text-wrap">
              <div class="wrap">
                <?php echo $description; ?></div>
            </div>
          </div>
          <div class="tab-content" id="tab3">
            <a href="#" class="opener"><?php echo $text_tab3; ?></a>
            <div class="slide">
              <dl class="characteristics">
                <?php if ($attribute_groups) { ?>
                                    <?php $index=1; foreach ($attribute_groups as $attribute_group) { ?>
                                      <?php foreach ($attribute_group['attribute'] as $attribute) { ?>
                                        <dt><?php echo $attribute['name']; ?></dt>
                                        <dd><?php echo $attribute['text']; ?></dd>
                                      <?php if($index>4) break; $index++; } ?>
                                    <?php } ?>
                                  <?php } ?>
              </dl>
            </div>
          </div>
        </div>
      </section>
<script src="catalog/view/javascript/jquery.gallery.js"></script>
<?php echo $footer; ?>
