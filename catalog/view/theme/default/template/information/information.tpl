<?php echo $header; ?>
<div class="breadcrums_wrapper">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
</div>
<div class="about_us_wrapper">
  <h2 class="page_title"><?php echo $heading_title; ?></h2>
  <?php echo $description; ?>
</div>
<?php echo $footer; ?>