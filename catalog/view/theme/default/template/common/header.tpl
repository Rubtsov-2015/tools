<!DOCTYPE html>
<!--[if IE]><![endif]-->
<!--[if IE 8 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie8"><![endif]-->
<!--[if IE 9 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie9"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<!--<![endif]-->
<head>
<meta charset="UTF-8" />
<meta name="format-detection" content="telephone=no"/>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title><?php echo $title;  ?></title>
<base href="<?php echo $base; ?>" />
<?php if ($description) { ?>
<meta name="description" content="<?php echo $description; ?>" />
<?php } ?>
<?php if ($keywords) { ?>
<meta name="keywords" content= "<?php echo $keywords; ?>" />
<?php } ?>
<meta property="og:title" content="<?php echo $title; ?>" />
<meta property="og:type" content="website" />
<meta property="og:url" content="<?php echo $og_url; ?>" />
<?php if ($og_image) { ?>
<meta property="og:image" content="<?php echo $og_image; ?>" />
<?php } else { ?>
<meta property="og:image" content="<?php echo $logo; ?>" />
<?php } ?>
<meta property="og:site_name" content="<?php echo $name; ?>" />
<link rel="stylesheet" href="catalog/view/theme/default/stylesheet/all.css">
<script src="catalog/view/javascript/fontawesome-all.min.js"></script>
  <script src="catalog/view/javascript/jquery-3.3.1.min.js"></script>
<?php foreach ($styles as $style) { ?>
<link href="<?php echo $style['href']; ?>" type="text/css" rel="<?php echo $style['rel']; ?>" media="<?php echo $style['media']; ?>" />
<?php } ?>
<script src="catalog/view/javascript/common.js" type="text/javascript"></script>
<?php foreach ($links as $link) { ?>
<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
<?php } ?>
<?php foreach ($scripts as $script) { ?>
<script src="<?php echo $script; ?>" type="text/javascript"></script>
<?php } ?>
<?php foreach ($analytics as $analytic) { ?>
<?php echo $analytic; ?>
<?php } ?>
</head>
<body class="<?php echo $class; ?>">
  <div id="wrapper">
      <header>
        <div class="center">
          <div class="top_row">
            <ul class="feedback_list_top">
              <li>
                <a href="#" data-popup="#write_us_pop">
                  <i class="icon-e-mail-envelope"></i>
                  <span><?php echo $text_message2; ?></span>
                </a>
              </li>
              <li>
                <a href="#" data-popup="#call_back_pop">
                  <i class="icon-telephone"></i>
                  <span><?php echo $text_call; ?></span>
                </a>
              </li>
            </ul>
            <ul class="numbers_list">
              <li><a href="tel:<?php echo $phone['phone1']; ?>"><?php echo $phone['phone1']; ?></a></li>
              <li><a href="tel:<?php echo $phone['phone2']; ?>"><?php echo $phone['phone2']; ?></a></li>
              <li><a href="tel:<?php echo $phone['phone3']; ?>"><?php echo $phone['phone3']; ?></a></li>
            </ul>
            <ul class="top_management">
              <li>
                <a href="<?php echo $login; ?>"><i class="fas fa-user"></i><span><?php echo $text_login; ?></span></a>
              </li>
              <li>
                <?php echo $language; ?>
              </li>
            </ul>
          </div>
          <div class="middle_row">
            <div class="burger_menu"><i class="fas fa-bars"></i></div>
            <strong class="logo">
              <a href="#">
                <img src="catalog/view/theme/default/images/logo.png" alt="" width="163" height="39">
                <span><?php echo $name; ?></span>
              </a>
            </strong>
            <div class="basket_holder">
              <a href="<?php echo $compare; ?>" class="exchange_btn">
                <i class="icon-exchange"></i>
                <span><?php echo $text_compare; ?></span>
              </a>
              <span class="cr"><?php echo $cart; ?></span>
            </div>
            <div class="search_btn">
              <a href="#">
                <i class="fas fa-search"></i>
              </a>
            </div>
            <?php echo $search; ?>
          </div>
          <nav>
            <div class="addmenu_wrapper">
              <div class="burger_menu_holder">
                <div class="burger_menu"><span></span></div>
                <span><?php echo $text_catalog; ?></span>
                <div class="close_mob_menu"></div>
                <div class="language_list">
                  <?php echo $language; ?>
                </div>
                <?php if ($categories) { ?>
                  <ul class="addmenu_list">
                        <?php foreach ($categories as $category) { ?>
                          <?php if ($category['children']) { ?>
                          <li class="addmenu_has_drop">
                            <?php echo html_entity_decode($category['column']); ?>
                            <a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a>
                            <ul>
                                <?php foreach ($category['children'] as $children) { ?>
                                  <?php if ($children['child']) { ?>
                                    <li class="addmenu_has_drop">
                                      <a href="<?php echo $children['href']; ?>"><?php echo $children['name']; ?></a>
                                      <ul>
                                          <?php foreach ($children['child'] as $chil) { ?>
                                            <li>
                                              <a href="<?php echo $chil['href']; ?>">
                                                <i class="visual">
                                                  <img src="<?php echo $chil['image']; ?>" alt="" width="68" height="45">
                                                </i>
                                                <span><?php echo $chil['name']; ?></span>
                                              </a>
                                            </li>
                                          <?php } ?>
                                          <li class="more_products">
                                            <a href="<?php echo $children['href']; ?>">
                                              <i class="icon-back visual_arrow"></i>
                                              <span><?php echo $text_all2; ?></span>
                                            </a>
                                          </li>
                                        </ul>
                                    </li>
                                    <?php } else { ?>
                                    <li><a href="<?php echo $children['href']; ?>"><?php echo $children['name']; ?></a></li>
                                    <?php } ?>
                                <?php } ?>
                              </ul>
                          </li>
                          <?php } else { ?>
                          <li><?php echo html_entity_decode($category['column']); ?><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>
                          <?php } ?>
                          <?php } ?>
                        </ul>
                  <?php } ?>
              </div>
            </div>
            <ul class="main_menu">
              <li><a href="<?php echo $contacts; ?>"><?php echo $text_contacts; ?></a></li>
              <?php foreach ($informations as $information) { ?>
                <li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
                <?php } ?>
            </ul>
            <ul class="mobile_user_actions">
              <li><a href="<?php echo $login; ?>"><i class="icon-user"></i><?php echo $text_login; ?></a></li>
              <li><a href="<?php echo $compare; ?>"><i class="icon-exchange"></i><?php echo $text_compare; ?></a>/li>
            </ul>
          </nav>
        </div>
      </header>
      <main>
        <div class="center">