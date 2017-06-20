<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>	
<!DOCTYPE html>
<html>
<head>
<title>會員專區</title>
<!-- for-mobile-apps -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta property="og:title" content="Vide" />
<meta name="keywords"
	content="Fit Point Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<script type="application/x-javascript">
	
    addEventListener("load", function() {
        setTimeout(hideURLbar, 0);
    }, false);

    function hideURLbar() {
        window.scrollTo(0, 1);
    }
    
    
</script>
<!-- //for-mobile-apps -->
<link rel='stylesheet' href='${pageContext.request.contextPath}/css/bootstrap.css'  type="text/css" />
<!-- Custom Theme files -->
<link rel='stylesheet' href='${pageContext.request.contextPath}/css/style.css'  type="text/css" />
<!-- js -->
<script src="js/jquery-1.11.1.min.js"></script>
<link
	href='//fonts.googleapis.com/css?family=Alegreya+Sans:400,100,100italic,300,300italic,400italic,500,500italic,700,700italic,800,800italic,900,900italic'
	rel='stylesheet' type='text/css'>
<link
	href='//fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic'
	rel='stylesheet' type='text/css'>
<!-- start-smoth-scrolling -->
<script type="text/javascript" src="js/move-top.js"></script>
<script type="text/javascript" src="js/easing.js"></script>
<script type="text/javascript">
	jQuery(document).ready(function($) {
		$(".scroll").click(function(event) {
			event.preventDefault();
			$('html,body').animate({
				scrollTop : $(this.hash).offset().top
			}, 1000);
		});
	});
</script>
<!-- start-smoth-scrolling -->
</head>

<body>
	<div class="page-head">
		<div class="container">
			<div class="navigation">
				<div class="logo">
					<h1>
						<a class="navbar-brand link link--yaku" href="index.html"><span>S</span><span>H</span><span>S</span><span>M</span></a>
					</h1>
				</div>
				<div class="top-nav">
					<span class="menu"><img src="images/menu.png" alt=" " /></span>
					<ul class="nav1 nav nav-wil cl-effect-11" id="cl-effect-11">
						<li><a class="active" data-hover="" href="index.html">首頁
								<span class="sr-only">(current)</span>
						</a></li>
						<li><a data-hover="" href="member.html">會員專區 </a></li>
						<li><a data-hover="" href="
Mall.html">購物商城</a></li>
						<li><a data-hover="" href="About.html">關於我們</a></li>
						<li><a href="register.html">註冊</a></li>
					</ul>
					<!-- script-for-menu -->
					<script>
						$("span.menu").click(function() {
							$("ul.nav1").slideToggle(300, function() {
								// Animation complete.
							});
						});
					</script>
					<!-- /script-for-menu -->
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
	</div>



	<!--footer-top-->
	<div class="footer-top">
		<div class="container">
			<div class="footer-left">
				<h3>網站導覽</h3>
				<p>At vero eos et accusamus et iusto odio dignissimos ducimus
					qui blanditiis praesentium voluptatum deleniti atque corrupti quos
					dolores et quas molestias excepturi sint occaecati cupiditate non
					provident, similique sunt in culpa qui officia deserunt mollitia
					animi, id est laborum et dolorum fuga.</p>
				<ul>
					<li>公司地址<span>台北市大安區</span>信義路三段118號
					</li>
					<li>+886-6631-6666</li>
					<li><a href="mailto:info@example.com">iiiorg@example.com</a></li>
				</ul>
			</div>
			<div class="footer-middle">
				<h3>推薦廠商</h3>
				<div class="foo-grids">
					<a href="#"><img class="img-responsive" src="images/blog1.jpg"
						alt="" /></a>
					<p>
						<a href="#">Accusamus et iusto odio dignissimos ducimus et
							iusto odio qui blanditiis dignissimos</a>
					</p>
					<div class="clearfix"></div>
				</div>
				<div class="foo-grids">
					<a href="#"><img class="img-responsive" src="images/blog2.jpg"
						alt="" /></a>
					<p>
						<a href="#">Odio dignissimos ducimus qui blanditiis
							praesentium voluptatum Accusamus et iusto</a>
					</p>
					<div class="clearfix"></div>
				</div>
				<div class="foo-grids">
					<a href="#"><img class="img-responsive" src="images/blog3.jpg"
						alt="" /></a>
					<p>
						<a href="#">Dignissimos ducimus qui blanditiis praesentium
							voluptatum. Odio dignissimos ducimus</a>
					</p>
					<div class="clearfix"></div>
				</div>
			</div>
			<div class="footer-right">
				<h3>聯絡我們</h3>
				<p>Sed ut perspiciatis odio dignissimos ducimus qui blanditiis
					praesentium voluptatum deleniti atque corrupti quos dolores et quas
					molestias</p>
				<form>
					<input type="text" value="Email" onfocus="this.value = '';"
						onblur="if (this.value == '') {this.value = 'Email';}" required="">
					<input type="submit" value=" ">
				</form>
			</div>
			<div class="clearfix"></div>
		</div>
	</div>
	<!--//footer-top-->

	<!-- smooth scrolling -->
	<script type="text/javascript">
		$(document).ready(function() {
			/*
				var defaults = {
				containerID: 'toTop', // fading element id
				containerHoverID: 'toTopHover', // fading element hover id
				scrollSpeed: 1200,
				easingType: 'linear' 
				};
			 */
			$().UItoTop({
				easingType : 'easeOutQuart'
			});
		});
	</script>
	<a href="#" id="toTop" style="display: block;"> <span
		id="toTopHover" style="opacity: 1;"> </span></a>
	<!-- //smooth scrolling -->
	<!-- for bootstrap working -->
	<script src="js/bootstrap.js"></script>
	<!-- //for bootstrap working -->
</body>

</html>
