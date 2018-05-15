<?php echo $header; ?>
<div class="breadcrums_wrapper">
						<ul>
							<?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
						</ul>
					</div>
					<h2 class="page_title"><?php echo $heading_title; ?></h2>
					<?php if ($products) { ?>
					<div class="catalog_wrapper">
						<form class="compare_form">
							<table>
								<tr>
									<td>
									</td>
									<?php foreach ($products as $product) { ?>
										<td>
											<a href="<?php echo $product['remove']; ?>" class="remove_compare_product"></a>
											<div class="products_holder">
												<a href="<?php echo $product['href']; ?>" class="visual"><img src="<?php echo $product['thumb']; ?>" alt=""></a>
												<div class="catalog_fullinfo_wrapper">
													<div class="catalog_fullinfo_title">
														<h3><?php echo $product['name']; ?></h3>
													</div>
													<div class="prod_price_wrapper">
														<div class="catalog_product_price">
															<div class="price_holder">
																<b><?php echo $text_price; ?></b>
																<?php if($product['special']) { ?>
																	<span class="discount"><?php echo $product['special']; ?><i><?php echo $product['price']; ?></i></span>
																<?php } else { ?>
																	<span><?php echo $product['price']; ?></span>
																<?php } ?>
															</div>
															<div class="actions_holder">
																<a onclick="cart.add(<?php echo $product['product_id']; ?>);" class="buy"><?php echo $button_cart; ?></a>
															</div>
														</div>
													</div>
												</div>
											</div>
										</td>
									<?php } ?>						            	
								</tr>
								<tr>
									<td class="title_type_table"><?php echo $text_comp1; ?></td>
									<?php foreach ($products as $product) { ?>
										<td></td>
									<?php } ?>
								</tr>
								<tr>
									<td><?php echo $text_comp2; ?></td>
									<?php foreach ($products as $product) { ?>
										<td><?php echo $product['model']; ?></td>
									<?php } ?>
								</tr>
								<tr>
									<td><?php echo $text_comp3; ?></td>
									<?php foreach ($products as $product) { ?>
										<td><?php echo $product['manufacturer']; ?></td>
									<?php } ?>
								</tr>
								<tr>
									<td><?php echo $text_comp4; ?></td>
									<?php foreach ($products as $product) { ?>
										<td><?php echo $product['availability']; ?></td>
									<?php } ?>
								</tr>
								<tr>
									<td><?php echo $text_comp5; ?></td>
									<?php foreach ($products as $product) { ?>
										<td><?php echo $product['description']; ?></td>
									<?php } ?>
								</tr>
								<tr>
									<td><?php echo $text_comp6; ?></td>
									<?php foreach ($products as $product) { ?>
										<td><?php echo $product['weight']; ?></td>
									<?php } ?>
								</tr>
								<tr>
									<td class="title_type_table"><?php echo $text_comp7; ?></td>
									<?php foreach ($products as $product) { ?>
										<td></td>
									<?php } ?>
								</tr>
								<?php foreach ($attribute_groups as $attribute_group) { ?>
							        <?php foreach ($attribute_group['attribute'] as $key => $attribute) { ?>
							          <tr>
							            <td><?php echo $attribute['name']; ?></td>
							            <?php foreach ($products as $product) { ?>
							            <?php if (isset($product['attribute'][$key])) { ?>
							            <td><?php echo $product['attribute'][$key]; ?></td>
							            <?php } else { ?>
							            <td></td>
							            <?php } ?>
							            <?php } ?>
							          </tr>
							        <?php } ?>
						        <?php } ?>
							</table>
						</form>
					</div>
					<form class="compare_mob_form">
					</form>
					<div class="catalog_mob_wrapper">
						<table>
							<tr>
								<?php foreach ($products as $product) { ?>
										<td>
											<a href="<?php echo $product['remove']; ?>" class="remove_compare_product"></a>
											<div class="products_holder">
												<a href="<?php echo $product['href']; ?>" class="visual"><img src="<?php echo $product['thumb']; ?>" alt=""></a>
												<div class="catalog_fullinfo_wrapper">
													<div class="catalog_fullinfo_title">
														<h3><?php echo $product['name']; ?></h3>
													</div>
													<div class="prod_price_wrapper">
														<div class="catalog_product_price">
															<div class="price_holder">
																<b><?php echo $text_price; ?></b>
																<?php if($product['special']) { ?>
																	<span class="discount"><?php echo $product['special']; ?><i><?php echo $product['price']; ?></i></span>
																<?php } else { ?>
																	<span><?php echo $product['price']; ?></span>
																<?php } ?>
															</div>
															<div class="actions_holder">
																<a onclick="cart.add(<?php echo $product['product_id']; ?>);" class="buy"><?php echo $button_cart; ?></a>
															</div>
														</div>
													</div>
												</div>
											</div>
										</td>
									<?php } ?>
							</tr>
							<tr class="title">
								<td><i><span><?php echo $text_comp1; ?></span></i></td>
							</tr>
							<tr class="title">
								<td><i><span><?php echo $text_comp2; ?></span></i></td>
							</tr>
							<tr>
								<?php foreach ($products as $product) { ?>
										<td><?php echo $product['model']; ?></td>
									<?php } ?>
							</tr>
							<tr class="title">
								<td><i><span><?php echo $text_comp3; ?></span></i></td>
							</tr>
							<tr>
								<?php foreach ($products as $product) { ?>
										<td><?php echo $product['manufacturer']; ?></td>
									<?php } ?>
							</tr>
							<tr class="title">
								<td><i><span><?php echo $text_comp4; ?></span></i></td>
							</tr>
							<tr>
								<?php foreach ($products as $product) { ?>
										<td><?php echo $product['availability']; ?></td>
									<?php } ?>
							</tr>
							<tr class="title">
								<td><i><span><?php echo $text_comp5; ?></span></i></td>
							</tr>
							<tr>
								<?php foreach ($products as $product) { ?>
										<td><?php echo $product['description']; ?></td>
									<?php } ?>
							</tr>
							<tr class="title">
								<td><i><span><?php echo $text_comp6; ?></span></i></td>
							</tr>
							<tr>
								<?php foreach ($products as $product) { ?>
										<td><?php echo $product['weight']; ?></td>
									<?php } ?>
							</tr>
							<tr class="title">
								<td><i><span><?php echo $text_comp7; ?></span></i></td>
							</tr>
							<?php foreach ($attribute_groups as $attribute_group) { ?>
							        <?php foreach ($attribute_group['attribute'] as $key => $attribute) { ?>
							          	<tr class="title">
											<td><i><span><?php echo $attribute['name']; ?></span></i></td>
										</tr>
										<tr>
								            <?php foreach ($products as $product) { ?>
								            <?php if (isset($product['attribute'][$key])) { ?>
								            <td><?php echo $product['attribute'][$key]; ?></td>
								            <?php } else { ?>
								            <td></td>
								            <?php } ?>
								            <?php } ?>
							          </tr>
							        <?php } ?>
						        <?php } ?>
						</table>
					</div>
					<?php } else { ?>
						<p class="empty"><?php echo $text_empty; ?></p>
					<?php } ?>
<?php echo $footer; ?>