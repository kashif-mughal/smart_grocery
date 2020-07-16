<?php
$CI =& get_instance();
$CI->load->model('Web_settings');
$Web_settings = $CI->Web_settings->retrieve_setting_editdata();
?>
<section class="main-footer">
	<div class="container-fluid">
		<div class="main-content">
			<p class="footer-text">
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
								
								<?php for ($i=0; $i < count($value); $i++) {?>
									<a href="#">
										<span class="hyphen">&#8212;</span> <span class="category-text"><?=$value[$i]['Alias']?></span>
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
				<a href="#">Unilever (151)</a>
				<a href="#">Reckitt (105)</a>
				<a href="#">National (73)</a>
				<a href="#">Nestle (68)</a>
				<a href="#">Reckitt-Health (59)</a>
				<a href="#">Peek-Freans (50)</a>
				<a href="#">Mitchell's (47)</a>
				<a href="#">Reckitt-RB-Hygiene (39)</a>
				<a href="#">Dawn (38)</a>
				<a href="#">Bake-Parlor (30)</a>
				<a href="#">Dettol (30)</a>
				<a href="#">K&N's (29)</a>
				<a href="#">Kolson (28)</a>
				<a href="#">Shezan (26)</a>
				<a href="#">Bunnys (26)</a>
				<a href="#">Shangrilla (25)</a>
				<a href="#">Youngs (24)</a>
				<a href="#">LifeBuoy (23)</a>
				<a href="#">Marhaba (22)</a>
				<a href="#">Cnabebe (21)</a>
				<a href="#">Kausar (20)</a>
				<a href="#">Lux (20)</a>
				<a href="#">Guard-Rice (20)</a>
				<a href="#">Scotch-Brite (20)</a>
				<a href="#">Colgate (19)</a>
			</div>

			<div class="company-address">
				<div class="container-fluid">
					<div class="row">
						<div class="col-md-9">
							<p>info@saudaexpress.com, 0300 123 45678, Plot No. 30, Sector 26, Korangi Industrial Area, Karachi,<br>PakistanSauda Express &#0174 2020</p>
						</div>
						<div class="col-md-3">
							<p class="float-right">Power by: <a href="http://bitechware.com/" target="_blank">bitechware 	</a></p>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>
	<strong>
		<?php if (isset($Web_settings[0]['footer_text'])) { echo $Web_settings[0]['footer_text']; }?>
	</strong><i class="fa fa-heart color-green"></i>
</section>