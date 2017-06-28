<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <title>Fit Point a Sports Category Flat Bootstrap Responsive Web Template| Contact :: w3layouts</title>
    <!-- for-mobile-apps -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta property="og:title" content="Vide" />
    <meta name="keywords" content="Fit Point Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
	Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
    <script type="application/x-javascript">
    addEventListener("load", function() {
        setTimeout(hideURLbar, 0);
    }, false);S

    function hideURLbar() {
        window.scrollTo(0, 1);
    }
    </script>
    <!-- //for-mobile-apps -->
    <link href="css/bootstrap.css" rel='stylesheet' type='text/css' />
    <!-- Custom Theme files -->
    <link href="css/style.css" rel='stylesheet' type='text/css' />
    <!-- js -->
    <script src="js/jquery-1.11.1.min.js"></script>
    <!-- //js -->
    <!--轉跳畫面導覽-->
    <link href="css/bootstrap.css" rel="stylesheet">
    <link href="css/font-awesome.min.css" rel="stylesheet" media="all">
    <link href="css/animate.min.css" rel="stylesheet" media="all">
    <!--轉跳畫面導覽-->
    <!-- Bootstrap bootstrap-touch-slider Slider Main Style Sheet -->
    <link href="css/bootstrap-touch-slider.css" rel="stylesheet" media="all">
    <!-- Custom Theme files -->
    <!-- start-smoth-scrolling -->
    <script type="text/javascript" src="js/move-top.js"></script>
    <script type="text/javascript" src="js/easing.js"></script>
    <script type="text/javascript">
    jQuery(document).ready(function($) {
        $(".scroll").click(function(event) {
            event.preventDefault();
            $('html,body').animate({
                scrollTop: $(this.hash).offset().top
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
                        <li><a class="active" data-hover="" href="index.html">首頁 <span class="sr-only">(current)</span></a></li>

                        <li><a data-hover="" href="member-login.jsp">會員專區</a></li>
                        <li><a data-hover="" href="Manufacturers-logning.jsp">廠商專區</a></li>
                        <li><a data-hover="" href="
Mall.html">購物商城</a></li>
                        <li><a data-hover="" href="About.jsp">關於我們</a></li>
                    </ul>
                    <!--轉跳頁面內容開始-->
                    
                    <div id="bootstrap-touch-slider" class="carousel bs-slider fade  control-round indicators-line" data-ride="carousel" data-pause="hover" data-interval="5000">
                        <!-- Indicators -->
                        <ol class="carousel-indicators">
                            <li data-target="#bootstrap-touch-slider" data-slide-to="0" class="active"></li>
                        </ol>
                        <!-- Wrapper For Slides -->
                        <div class="carousel-inner" role="listbox">
                            <!-- Second Slide -->
                            <!-- Third Slide -->
                            <div class="item active">
                                <!-- Slide Background -->
                                <img src="images/slide1.jpeg" alt="Bootstrap Touch Slider" class="slide-image" />
                                <div class="bs-slider-overlay"></div>
                                <div class="container">
                                    <div class="row">
                                        <!-- Slide Text Layer -->
                                        <div class="slide-text slide_style_left">
                                            <h1 data-animation="animated zoomInRight">WELCOME TO SHSM</h1><br>
                                            <a href="member-login.jsp" target="_self" class="btn btn-default" data-animation="animated fadeInLeft">會員由此進入</a>
                                            <a href="Manufacturers-logning.jsp" target="_self" class="btn btn-primary" data-animation="animated fadeInRight">廠商由此進入</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- End  bootstrap-touch-slider Slider -->
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
    <script src="js/bootstrap.js"></script>
    <script src="js/jquery.touchSwipe.min.js"></script>
    <script src="js/bootstrap-touch-slider.js"></script>
    <script type="text/javascript">
    $('#bootstrap-touch-slider').bsTouchSlider();
    </script>
</body>

</html>
