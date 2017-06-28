<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>會員專區</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />



<link href="css/bootstrap.css" rel='stylesheet' type='text/css' />
<link href="css/style.css" rel='stylesheet' type='text/css' />
<script src="js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="js/move-top.js"></script>
<script type="text/javascript" src="js/easing.js"></script>
<style>
@import url(http://fonts.googleapis.com/css?family=Fjalla+One);

@import url(http://fonts.googleapis.com/css?family=Gudea);

.footer1 {
	background: #fff url("../images/footer/footer-bg.png") repeat scroll
		left top;
	padding-top: 40px;
	padding-right: 0;
	padding-bottom: 20px;
	padding-left: 0; /*	border-top-width: 4px;
	border-top-style: solid;
	border-top-color: #003;*/
}

.title-widget {
	color: #898989;
	font-size: 20px;
	font-weight: 300;
	line-height: 1;
	position: relative;
	text-transform: uppercase;
	font-family: 'Fjalla One', sans-serif;
	margin-top: 0;
	margin-right: 0;
	margin-bottom: 25px;
	margin-left: 0;
	padding-left: 28px;
}

.title-widget::before {
	background-color: #ea5644;
	content: "";
	height: 22px;
	left: 0px;
	position: absolute;
	top: -2px;
	width: 5px;
}

.widget_nav_menu ul {
	list-style: outside none none;
	padding-left: 0;
}

.widget_archive ul li {
	background-color: rgba(0, 0, 0, 0.3);
	content: "";
	height: 3px;
	left: 0;
	position: absolute;
	top: 7px;
	width: 3px;
}

.widget_nav_menu ul li {
	font-size: 13px;
	font-weight: 700;
	line-height: 20px;
	position: relative;
	text-transform: uppercase;
	border-bottom: 1px solid rgba(0, 0, 0, 0.05);
	margin-bottom: 7px;
	padding-bottom: 7px;
	width: 95%;
}

.title-median {
	color: #636363;
	font-size: 20px;
	line-height: 20px;
	margin: 0 0 15px;
	text-transform: uppercase;
	font-family: 'Fjalla One', sans-serif;
}

.footerp p {
	font-family: 'Gudea', sans-serif;
}

#social:hover {
	-webkit-transform: scale(1.1);
	-moz-transform: scale(1.1);
	-o-transform: scale(1.1);
}

#social {
	-webkit-transform: scale(0.8);
	/* Browser Variations: */
	-moz-transform: scale(0.8);
	-o-transform: scale(0.8);
	-webkit-transition-duration: 0.5s;
	-moz-transition-duration: 0.5s;
	-o-transition-duration: 0.5s;
}
/* 
    Only Needed in Multi-Coloured Variation 
                                               */
.social-fb:hover {
	color: #3B5998;
}

.social-tw:hover {
	color: #4099FF;
}

.social-gp:hover {
	color: #d34836;
}

.social-em:hover {
	color: #f39c12;
}

.nomargin {
	margin: 0px;
	padding: 0px;
}

.footer-bottom {
	background-color: #15224f;
	min-height: 30px;
	width: 100%;
}

.copyright {
	color: #fff;
	line-height: 30px;
	min-height: 30px;
	padding: 7px 0;
}

.design {
	color: #fff;
	line-height: 30px;
	min-height: 30px;
	padding: 7px 0;
	text-align: right;
}

.design a {
	color: #fff;
}
</style>
</head>

<body>

	<div class="page-head">
		<div class="container">
			<div class="navigation">
				<div class="logo">
					<h1>
						<a class="navbar-brand link link--yaku" href="member.jsp"><span>會</span><span>員</span><span>專</span><span>區</span></a>
					</h1>
				</div>
				<div class="top-nav">
					<span class="menu"><img src="images/menu.png" alt=" " /></span>
					<ul class="nav1 nav nav-wil cl-effect-11" id="cl-effect-11">
						<li><a class="active" data-hover="" href="index.jsp">首頁 <span
								class="sr-only">(current)</span></a></li>
						<li><a>${custuser.cus_name}</a></li>
						<li><a href="NewFile.jsp">登出</a></li>
					</ul>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
	</div>
	<div>
		<iframe src="bootstarptest.jsp" frameborder="0" width="2000px"
			height="800" scrolling="yes" style="align:center;"></iframe>
	</div>

	<div class="footer-bottom">

		<div class="container">

			<div class="row">

				<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">

					<div class="copyright">© 2017, Welcome to visit SHSM .</div>

				</div>

				<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">

					<div class="design">
						<a href="#">維修平台 </a> | <a target="_blank"
							href="http://www.shsm.com">Web Design & Development by Team</a>
					</div>

				</div>

			</div>

		</div>

	</div>
	<script src="js/bootstrap.js"></script>
	
</body>

</html>
