<div id="main-page">
	<div class="container">

		<section class="main-content">
			<div class="row my-4">
				<div class="col-md-4">

					<div class="call_to_action_grid border-right-full">
						<div class="call_to_action_image">
							<img src="<?php echo base_url() ?>assets/img/footer/call_to_action/SameNextDayDelivery_icon.png?>" alt="Icon">
						</div>
						<div class="call_to_action_content text-center text-md-left mb-4 mb-md-0">
							<h5 class="call_to_action_title">Same/Next Day Delivery</h5>
							<h6 class="call_to_action_content">Free delivery on all orders over Rs. 4,000 Rs 100
								for orders below Rs. 4,000</h6>
						</div>
					</div>
					
				</div>
				<div class="col-md-4">
					
					<div class="call_to_action_grid border-right-full">
						<div class="call_to_action_image">
							<h4 class="call_to_action_custom_img m-0">Rs.</h4>
						</div>
						<div class="call_to_action_content text-center text-md-left mb-4 mb-md-0">
							<h5 class="call_to_action_title">Cash On Delivery</h5>
							<h6 class="call_to_action_content">You pay when rider comes at your address.</h6>
						</div>
					</div>
					
				</div>
				<div class="col-md-4">
					
					<div class="call_to_action_grid">
						<div class="call_to_action_image">
							<img src="<?php echo base_url() ?>assets/img/footer/call_to_action/OnlineSupport_icon.png?>" alt="Icon">
						</div>
						<div class="call_to_action_content text-center text-md-left mb-4 mb-md-0">
							<h5 class="call_to_action_title">Online Support</h5>
							<h6 class="call_to_action_content">Customer support from 9AM - Midnight (021) 111
								111 123
							</h6>
						</div>
					</div>

				</div>
			</div>
		</section>
	</div>
</div>
<section class="main-footer">
	<div class="container">
		<div class="main-content">
			<p class="footer-text text-center text-md-left">
				Sauda Express is not just another online grocery store. We at Sauda Express aim at revolutionizing the whole thinking of online shopping by introducing latest technology into the arena and at the same retaining cultural traditions that are still revered by shoppers in Pakistan but are so easily abandoned by online shopping platforms focusing only on the technological aspect. We consistently work hard to:
			</p>

			<div class="best_features">
				<div class="grid-container">
					<div class="feature-img">
						<h4 class="feature-img-text m-0">Rs.</h4>  
					</div>
					<h4 class="feature-text my-2 py-1">Offer best quality at reasonable price</h4>                  
				</div>
			</div>
			<div class="best_features">
				<div class="grid-container">
					<div class="feature-img">   
						<img src="<?php echo base_url() ?>assets/img/footer/round-rectangle.png?>" alt="">
					</div>
					<h4 class="feature-text my-2 py-1">Present a wide range of grocery products to meet diversified needs of all our customers</h4>                  
				</div>
			</div>
			<div class="best_features">
				<div class="grid-container">
					<div class="feature-img">
						<img src="<?php echo base_url() ?>assets/img/footer/arrow-left.png?>" alt="">
					</div>
					<h4 class="feature-text my-2 py-1">Maintain very high level of satisfaction of all our customers - we offer cashback and return options without any questions asked</h4>                  
				</div>
			</div>
			<div class="best_features">
				<div class="grid-container">
					<div class="feature-img">   
						<img src="<?php echo base_url() ?>assets/img/footer/rocket.png?>" alt="">
					</div>
					<h4 class="feature-text my-2 py-1">Continuously innovate and improve out offerings to enhance the experience of our customers</h4>                  
				</div>
			</div>

			<div class="mission_vision my-4">
				<h4>Mission & Vision</h4>
				<div class="mission_vision_content">
					<h6>Mission:</h6>
					<p>To become the most customer-centric, technologically sound and practical online shopping platform which is highly respected for ethics and professionalism by customers and competition alike</p>
				</div>
				<div class="mission_vision_content">
					<h6>Vision:</h6>
					<p>Build strong understanding of customer needs fby carefully analyzing their shopping patterns and paying close attension to their stated expectations through intelligently carried out research and surverys. Use most suitable technology to create out of box solutions with the aim to acheiving optimum level of satisfaction for our customers and at the same time fullfilling our economic objectives. Attract best talent by offering competative remunerations and a healthy work environment that enables every team member to perform at his or her optimum level and at the same time achieve a perfect work-life balance.
					</p>
				</div>
			</div>

			<div class="categories my-4">
				<h4>Categories</h4>
				<div class="category-grid">

					<?php foreach($CatList as $key => $value) {?>
						<div class="sub-category">
							<div class="sub-category-content">

								<h6><?=$key?></h6>
								
								<?php for ($i=0; $i < count($value->childCats); $i++) {?>
									<a href="#">
										<span class="hyphen">&#8212;</span> <span class="category-text"><?=$value->childCats[$i]['Alias']?></span>
									</a>
								<?php } ?>

							</div>
						</div>
					<?php } ?>


				</div>
			</div>

			<div class="feature-details my-4">
				<h4>Sauda Express - the most customer-centeric online shopping platform</h4>
				<div class="feature_details_content">
					<h6>Wide Geographic Voverage</h6>
					<p>Order from anywhere in karachi to get best deals in grocery items delivered at your doorsteps in a timely and professional manner</p>
				</div>
				<div class="feature_details_content">
					<h6>Innovative Approach</h6>
					<p>We at Sauda Express take special pride in being innovative and ahead of our competition to create convenience for our shoppers.</p>
				</div>
				<div class="feature_details_content">
					<h6>Long term Commitment</h6>
					<p>We genuinely believe in long lasting relationships based on trust and mutual respect.</p>
				</div>
			</div>

			<div class="useful-links my-4">
				<h4>Useful Links</h4>
				<div class="container-fluid">
					<div class="row">
						<div class="col-md-2 pl-0">
							<a href="#">Mission & Vision</a>
						</div>
						<div class="col-md-2 pl-0">
							<a href="#">Brand Stores</a>
						</div>
						<div class="col-md-2 pl-0">
							<a href="#">Privacy Policy</a>
						</div>
						<div class="col-md-2 pl-0">
							<a href="#">Terms & Conditions</a>
						</div>
						
						<div class="w-100"></div>

						<div class="col-md-2 pl-0">
							<a href="#">FAQs</a>
						</div>
						<div class="col-md-2 pl-0">
							<a href="#">Return & Refund</a>
						</div>
						<div class="col-md-2 pl-0">
							<a href="#">Categories</a>
						</div>
					</div>
				</div>
			</div>

			<div class="top-brands my-4">
				<h4>Top Brands</h4>
				<?php foreach($TopBrandList as $key => $value)  { ?>
				<a href="#" id="<?=$value['BrandId']?>"><?=$value['BrandName']?> (<?=$value['Total_Products']?>)</a>
				<?php } ?>
			</div>

			<div class="company-address">
				<div class="container">
					<div class="row">
						<?php if (isset($Web_settings[0]['footer_text'])) { echo $Web_settings[0]['footer_text']; }?>
					</div>
				</div>
			</div>

		</div>
	</div>
</section>