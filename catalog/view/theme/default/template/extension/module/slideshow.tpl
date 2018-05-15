<div class="main_carousel_section">  <ul class="main_carousel"><?php foreach ($banners as $banner) { ?>
  
                        
                            <li class="main_carousel_holder">
                                <div class="main_carousel_bg">
                                    <img src="catalog/view/theme/default/images/main-carousel-logo-2.jpg" alt="" width="676" height="218">
                                </div>
                                <div class="main_carousel_block">
                                    <div class="main_carousel_text">
                                        <div class="stock"><?php echo $banner['title']; ?></div>
                                        <strong><?php echo $banner['title2']; ?></strong>
                                        <div class="price_holder">
                                            <span class="new_price"><?php echo $banner['title3']; ?></span>
                                            <span><?php echo $banner['title4']; ?></span>
                                        </div>
                                        <p><?php echo $banner['title5']; ?></p>
                                    </div>
                                    <a href="<?php echo $banner['link']; ?>" class="visual"><img src="<?php echo $banner['image']; ?>" alt="" width="378"></a>
                                </div>
                            </li>
                            <?php } ?>
                        </ul>
                    </div>