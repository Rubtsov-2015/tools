<div class="top_arrow_carousel_section brands_carousel_section">
            <h2><?php echo $heading_title; ?></h2>
            <ul class="top_arrow_carousel brands_carousel">
              <?php foreach ($banners as $banner) { ?>
              <li><img src="<?php echo $banner['image']; ?>" alt=""></li>
              <?php } ?>
            </ul>
          </div>