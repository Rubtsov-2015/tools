<?php echo $header; ?>
<div class="breadcrums_wrapper">
            <ul>
              <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
            </ul>
          </div>
<div class="personal_office_wrapper">
            <h2 class="page_title"><?php echo $text_account; ?></h2>
            <nav class="personal_office_nav">
              <ul>
                <li class="active" data-tab-name="my_info">
                  <a ><i class="icon-user"></i><?php echo $text_info; ?></a>
                </li>
                <li data-tab-name="my_favorites">
                  <a ><i class="icon-star"></i><?php echo $text_wish; ?></a>
                </li>
                <li data-tab-name="history">
                  <a ><i class="icon-list"></i><?php echo $text_order; ?></a>
                </li>
                <li data-tab-name="bonus">
                  <a ><i class="icon-percentage"></i><?php echo $text_reward4; ?></a>
                </li>
                <li data-tab-name="subsribe">
                  <a ><i class="icon-email"></i><?php echo $text_email; ?></a>
                </li>
                <li data-tab-name="exit">
                  <a data-popup="#exit_popup"><i class="icon-logout"></i><?php echo $text_log; ?></a>
                </li>
              </ul>
            </nav>
            <div class="personal_office_tabs_holder">
              <div class="personal_office_tab personal_office_favorites" data-tab-office="my_favorites">
                <h3><?php echo $text_wish; ?></h3>
                <?php if($products_wish) { ?>
                <ul>
                  <?php foreach ($products_wish as $product) { ?>
                    <li>
                      <a href="<?php echo $product['href']; ?>" class="visual"><img src="<?php echo $product['thumb']; ?>" alt="" width="94" height="62"></a>
                      <div class="personal_office_favorites_text">
                        <div class="name"><?php echo $product['name']; ?></div>
                        <div class="vendor_code"><?php echo $text_model; ?>: <?php echo $product['model']; ?></div>
                        <div class="price_holder">
                          <b><?php echo $text_price; ?>: </b>
                                <?php if($product['special']) { ?>
                                  <span class="discount"><?php echo $product['special']; ?><i><?php echo $product['price']; ?></i></span>
                                <?php } else { ?>
                                  <span><?php echo $product['price']; ?></span>
                                <?php } ?>
                        </div>
                        <a onclick="cart.add(<?php echo $product['product_id']; ?>);" class="buy"><?php echo $button_cart; ?></a>
                      </div>
                        <a href="<?php echo $product['remove']; ?>" class="remove"></a>
                    </li>
                  <?php } ?>
                </ul>
                <?php } else { ?>
                  <p class="empty"><?php echo $text_empty3; ?></p>
                  <?php } ?>
              </div>
              <div class="personal_office_tab active" data-tab-office="my_info">
                  <div class="personal_info_block myinfo">
                    <h3><?php echo $text_info; ?></h3>
                    <form>
                      <div class="input_holder">
                        <label>
                          <span>ФИО*</span>
                          <input type="text" class="i1" value="<?php echo $firstname; ?>">
                          <div class="input_message" style="display:none"><?php echo $error_firstname; ?></div>
                        </label>
                      </div>
                      <div class="input_holder">
                        <label>
                          <span>E-mail*</span>
                          <input type="email" class="i2" value="<?php echo $email; ?>">
                          <div class="input_message" style="display:none"><?php echo $error_email; ?></div>
                        </label>
                      </div>
                      <div class="input_holder">
                        <label>
                          <span>Телефон</span>
                          <input type="tel" class="i3" value="<?php echo $telephone; ?>" class="phone">
                          <div class="input_message" style="display:none"><?php echo $error_telephone; ?></div>
                        </label>
                      </div>
                      <div class="save_btn"><a class="saveinfo"><?php echo $text_save; ?></a></div>
                      <div class="tnt2 result"><?php echo $result5; ?></div>
                    </form>
                  </div>
                  <div class="personal_info_block">
                    <h3>Изменить пароль</h3>
                    <form action="<?php echo $action1; ?>" method="post" enctype="multipart/form-data" class="chpass">
                      <div class="input_holder half_width">
                        <label>
                          <span>Новый пароль</span>
                          <input type="password" name="password" value="<?php echo $password; ?>" id="input-password" />
                          <div class="input_message" style="display:none"><?php echo $error_password; ?></div>
                        </label>
                      </div>
                      <div class="input_holder half_width">
                        <label>
                          <span>Подтвердите новый пароль</span>
                          <input type="password" name="confirm" value="<?php echo $confirm; ?>" id="input-confirm" />
                          <div class="input_message" style="display:none"><?php echo $error_confirm; ?></div>
                        </label>
                      </div>
                      <div class="save_btn"><a onclick="$('.chpass').submit();"><?php echo $text_save; ?></a></div>
                      <div class="result"><?php echo $result3; ?></div>
                    </form>                    
                  </div>
                  <div class="personal_info_block">
                    <h3><?php echo $text_add1; ?></h3>
                    <ul class="deliveries_address">
                      <?php foreach($addresses as $add) { ?>
                      <li class="old" data-id="<?php echo $add['address_id']; ?>">
                        <div class="input_holder">
                          <label>
                            <span><?php echo $text_add2; ?></span>
                            <input type="text" class="address1" value="<?php echo $add['address1']; ?>">
                          </label>
                        </div>
                        <div class="input_holder">
                          <label>
                            <span><?php echo $text_add3; ?></span>
                            <input type="text" class="address2" value="<?php echo $add['address2']; ?>">
                          </label>
                        </div>
                        <div class="more_deliveries_address"></div>
                      </li>
                      <?php } ?>
                    </ul>
                    <div class="save_btn"><a class="save_add"><?php echo $text_save; ?></a></div>
                    <div class="tnt result"><?php echo $result2; ?></div>
                  </div>
              </div>
              <div class="personal_office_tab" data-tab-office="subsribe">
                <form class="form_newsletter">
                  <h3><?php echo $text_news; ?></h3>
                    <div class="radiolist_input_holder">
                      <div class="radiolist_input">
                        <input type="radio" id="subscribe-1" value="1" name="newsletter" <?php if ($newsletter2==1) { ?>checked<?php } ?>>
                        <span></span>
                        <label for="subscribe-1"></label>
                      </div>
                      <label for="subscribe-1"><?php echo $text_news_yes; ?></label>
                    </div>
                    <div class="radiolist_input_holder">
                      <div class="radiolist_input">
                        <input type="radio" id="subscribe-2" value="0" name="newsletter" <?php if ($newsletter2==0) { ?>checked<?php } ?>>
                        <span></span>
                        <label for="subscribe-2"></label>
                      </div>
                      <label for="subscribe-2"><?php echo $text_news_no; ?></label>
                    </div>
                  <div class="save_btn"><a onclick="$('.form_newsletter').submit();"><?php echo $text_save; ?></a></div>
                  <div class="result"><?php echo $result4; ?></div>
                </form>
              </div>
              <div class="personal_office_tab" data-tab-office="history">
                <h3><?php echo $text_order; ?></h3>
                <?php echo count($orders); if(count($orders)!=0) { ?>
                <ul class="history_orders_list">                  
                  <?php foreach($orders as $order) { ?>
                    <li>
                      <div class="short_description_block">
                        <ul>
                          <li><?php echo $text_ord; ?> №: <?php echo $order['order_id']; ?></li>
                          <li><?php echo $order['date_added']; ?></li>
                          <li><?php echo $order['total_text']; ?></li>
                        </ul>
                        <div class="short_description_more"><span><?php echo $text_more; ?></span></div>
                      </div>
                      <?php print_r($order['prod']); ?>
                      <ul>
                        <?php foreach($order['prod'] as $prods) { ?>
                          <li>
                            <a href="<?php echo $prods['href']; ?>" class="visual"><img src="<?php echo $prods['thumb']; ?>" alt=""></a>
                            <div class="name_holder">
                              <div class="name"><?php echo $prods['name']; ?></div>
                              <div class="vendor_code"><?php echo $text_model; ?>: <?php echo $prods['model']; ?></div>
                            </div>
                            <div class="order_status">
                              <img src="../../../../image/status-order.png" alt="" width="35" height="33">
                              <span><?php echo $order['status']; ?></span>
                            </div>
                          </li>
                        <?php } ?>
                      </ul>
                    </li>
                  <?php } ?>
                </ul>
                <?php } else { ?>
                    <p class="empty"><?php echo $text_empty2; ?></p>
                  <?php } ?>
              </div>
              <div class="personal_office_tab" data-tab-office="bonus">
                <div class="bonus_wrapper">
                  <h3><?php echo $text_reward1; ?></h3>
                    <table class="bonus_table">
                      <thead>
                        <tr>
                          <th><?php echo $text_reward2; ?></th>
                          <th><?php echo $text_reward3; ?></th>
                          <th><?php echo $text_reward4; ?></th>
                        </tr>
                      </thead>
                      <tbody>
                        <?php if ($rewards) { ?>
                        <?php foreach ($rewards  as $reward) { ?>
                          <tr>
                            <td><?php echo $reward['date_added']; ?></td>
                            <td><?php echo $reward['description']; ?></td>
                            <td><?php echo $reward['points']; ?></td>
                          </tr>
                        <?php } ?>
                        <?php } else { ?>
                        <tr>
                          <td class="text-center" colspan="3"><?php echo $text_empty; ?></td>
                        </tr>
                        <?php } ?>
                      </tbody>
                    </table>
                    <p><?php echo $results1; ?></p>
                    <div class="continue_btn loadmore_catalog_btn" style="text-align:right;margin-bottom:20px;"><?php echo $pagination1; ?></div>
                </div>
              </div>
            </div>
          </div>

    <div class="popup_holder exit_popup" id="exit_popup">
      <div class="bg">&nbsp;</div>
      <div class="popup">
        <div class="popup_title">
          <h3><?php echo $text_lg; ?></h3>
        </div>
        <div class="popup_content">
          <ul class="exit_list">
            <li class="exit_account"><a href="<?php echo $logout; ?>"><?php echo $text_logout; ?></a></li>
            <li class="close"><a><?php echo $text_no; ?></a></li>
          </ul>
        </div>
      </div>
    </div>
  <script>
    $('.form_newsletter').submit(function(e) {
      var data=$(this).serialize();
      e.preventDefault();
      $.ajax({
        url: 'index.php?route=account/account/newsletter',
        type: 'post',
        data: data,
        success: function(json) {
          $('.form_newsletter').find('.result').show();
          setTimeout("$(this).find('.result').hide();",5000);
        },
        error: function(xhr, ajaxOptions, thrownError) {
          alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
      });
    });
    $('.chpass').submit(function(e) {
      var data=$(this).serialize();
      e.preventDefault();
      $.ajax({
        url: 'index.php?route=account/account/password',
        type: 'post',
        data: data,
        success: function(json) {
          if(json['password']) {
            $('#input-password').next().show();
            $('#input-password').closest('.input_holder').addClass('error');
          } else if(json['confirm']) {
            $('.input_holder').removeClass('error');
            $('.input_message').hide();
            $('#input-confirm').next().show();
            $('#input-confirm').closest('.input_holder').addClass('error');
          } else {
            $('.input_holder').removeClass('error');
            $('.input_message').hide();
            $('.chpass').find('.result').show();
            setTimeout("$(this).find('.result').hide();",5000);            
          }
        },
        error: function(xhr, ajaxOptions, thrownError) {
          alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
      });
    });
    $('body').on('click','.more_deliveries_address', function() {
      var html = "<li class='new'>\
                        <div class='input_holder'>\
                          <label>\
                            <span>Адрес</span>\
                            <input type='text' class='address1' value=''>\
                          </label>\
                        </div>\
                        <div class='input_holder'>\
                          <label>\
                            <span>Дом, квартира</span>\
                            <input type='text' class='address2' value=''>\
                          </label>\
                        </div>\
                        <div class='more_deliveries_address'></div>\
                      </li>";
      $('.deliveries_address').append(html);
    });
    $('.save_add').click(function(){
      $('.old').each(function(){
        var address_id = $(this).data('id');
        var address1 = $(this).find('.address1').val();
        var address2 = $(this).find('.address2').val();
        if(address1!='' && address2!='') {
          $.ajax({
            url: 'index.php?route=account/account/editaddress',
            type: 'post',
            data: 'address_id='+address_id+'&address_1='+address1+'&address_2='+address2,
            success: function(json) {
              $('.tnt').show();
              setTimeout("$('.tnt').hide();",5000);
            },
            error: function(xhr, ajaxOptions, thrownError) {
              alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
            }
          });
        }
      });
      $('.new').each(function(){
        var address1 = $(this).find('.address1').val();
        var address2 = $(this).find('.address2').val();
        if(address1!='' && address2!='') {
          $.ajax({
            url: 'index.php?route=account/account/addaddress',
            type: 'post',
            data: 'address_1='+address1+'&address_2='+address2,
            success: function(json) {
              $('.tnt').show();
              setTimeout("$('.tnt').hide();",5000);
            },
            error: function(xhr, ajaxOptions, thrownError) {
              alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
            }
          });
        }
      });
    });
    $('.saveinfo').click(function(){
        var firstname = $('.myinfo').find('.i1').val();
        var email = $('.myinfo').find('.i2').val();
        var telephone = $('.myinfo').find('.i3').val();
        $.ajax({
          url: 'index.php?route=account/account/editcustomer',
          type: 'post',
          data: 'firstname='+firstname+'&email='+email+'&telephone='+telephone,
          success: function(json) {
            if(json['firstname']) {
              $('.i1').next().show();
              $('.i1').closest('.input_holder').addClass('error');
            } else if(json['email']) {
              $('.input_holder').removeClass('error');
              $('.input_message').hide();
              $('.i2').next().show();
              $('.i2').closest('.input_holder').addClass('error');
            } else if(json['warning']) {
              $('.input_holder').removeClass('error');
              $('.input_message').hide();
              $('.i2').next().show();
              $('.i2').closest('.input_holder').addClass('error');
            } else if(json['telephone']) {
              $('.input_holder').removeClass('error');
              $('.input_message').hide();
              $('.i3').next().show();
              $('.i3').closest('.input_holder').addClass('error');
            } else {
              $('.tnt2').show();
              $('.input_holder').removeClass('error');
              $('.input_message').hide();
              setTimeout("$('.tnt2').hide();",5000);
            }
          },
          error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
          }
        });
    });
    $('body').on('click','.loadmore_catalog_btn a.next-pagination', function(){
      $.get($(this).attr('href'), function (data) {
          data = $(data).find('.bonus_table tbody').html();
          $('.bonus_table tbody').append(data);
      });
      $.get($(this).attr('href'), function (data) {
          data = $(data).find('.pagination').html();
          $('.loadmore_catalog_btn .pagination').empty().append(data);
      });
      return false;
    });
  </script>
<?php echo $footer; ?> 