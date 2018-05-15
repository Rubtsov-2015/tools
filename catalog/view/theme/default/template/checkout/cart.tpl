<?php echo $header; ?>
<div class="breadcrums_wrapper">
            <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
</div>
<div class="basket_wrapper">
            <h2 class="page_title"><?php echo $heading_title; ?></h2>
          <?php if($products) { ?>
            <?php if ($attention) { ?>
              <div class="alert alert-info"><i class="fa fa-info-circle"></i> <?php echo $attention; ?>
                <button type="button" class="close" data-dismiss="alert">&times;</button>
              </div>
            <?php } ?>
            <?php if ($success) { ?>
              <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
                <button type="button" class="close" data-dismiss="alert">&times;</button>
              </div>
            <?php } ?>
            <?php if ($error_warning) { ?>
              <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
                <button type="button" class="close" data-dismiss="alert">&times;</button>
              </div>
            <?php } ?>
            <form>
              <div class="basket_holder">
                <ul>
                  <?php foreach ($products as $product) { ?>
                    <li>
                      <a href="<?php echo $product['href']; ?>" class="visual">
                        <img src="<?php echo $product['thumb']; ?>" alt="">
                      </a>
                      <div class="title_product_holder">
                        <a href="<?php echo $product['href']; ?>" class="title_product"><?php echo $product['name']; ?></a>
                        <div class="vendor_code"><?php echo $text_model; ?>: <?php echo $product['model']; ?></div>
                      </div>
                      <div class="price_count_holder">
                        <div class="count_holder">
                          <span><?php echo $text_quantity; ?>:</span>
                          <div class="count_prod">
                            <a class="less"></a>
                            <a class="more"></a>
                            <input type="text" name="quantity[<?php echo $product['cart_id']; ?>]" value="<?php echo $product['quantity']; ?>" />
                          </div>
                        </div>
                        <div class="price_holder">
                          <span><?php echo $text_price; ?>:</span>
                          <span class="price_prod"><i><?php echo $product['price']; ?></i> грн</span>
                        </div>
                      </div>
                      <div onclick="cart.remove('<?php echo $product['cart_id']; ?>');" class="delete"></div>
                    </li>
                  <?php } ?>
                </ul>
                <div class="total_prod_summ">
                  <span><?php echo $text_total; ?>:</span>
                  <p><?php echo end($totals)['text']; ?> грн</p>                  
                </div>
              </div>
              <div class="submit_holder">
                <a href="<?php echo $checkout; ?>"><?php echo $button_checkout; ?></a>
              </div>
            </form>
          <?php } else { ?>
            <p class="empty"><?php echo $text_error; ?></p>
          <?php } ?>
          </div>
<?php echo $footer; ?>