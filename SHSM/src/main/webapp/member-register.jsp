<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <jsp:include page=""></jsp:include> --%>
<!DOCTYPE html>
<html>

<head>
<title>會員註冊</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script type="application/x-javascript">
	
	
	
	
	
	
	
    addEventListener("load", function() {
        setTimeout(hideURLbar, 0);
    }, false);

    function hideURLbar() {
        window.scrollTo(0, 1);
    }
    






</script>
<link href="css/bootstrap.css" rel='stylesheet' type='text/css' />
<link href="css/style.css" rel='stylesheet' type='text/css' />
<script src="js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="js/move-top.js"></script>
<script type="text/javascript" src="js/easing.js"></script>
<style>
#ul {
	margin: 0 0 -2px 0;
}
</style>
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
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.2/css/bootstrap-select.min.css">

<!-- Latest compiled and minified JavaScript -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.2/js/bootstrap-select.min.js"></script>

<!-- (Optional) Latest compiled and minified JavaScript translation files -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.2/js/i18n/defaults-*.min.js"></script>

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
						<li><a class="active" data-hover="" href="index.jsp">首頁 <span
								class="sr-only">(current)</span></a></li>
						<li><a data-hover="" href="member-register.jsp">會員專區</a></li>
						<li><a data-hover="" href="Manufacturers-register.jsp">廠商專區</a></li>
					</ul>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
	</div>
	<!-- registration-form -->
	<div class="registration-form">
		<div class="container">
			<h2 class="tittle">
				會員註冊
				</h3>
				<div class="registration-grids">
					<div class="reg-form">
						<div class="reg"></div>
					</div>
					<!-- /container -->
					<div class="reg-right">
						<h3>會員見證</h3>
						<img src="images/atama6.png" alt=""> <img
							src="images/atama4.png" alt=""> <img
							src="images/atama2.png" alt=""> <img
							src="images/atama1.png" alt="">
						<hr />
						<h3 class="lorem">3天發包,7天維修完成</h3>
						<p>Tincidunt metus, sed euismod elit enim ut mi. Nulla
							porttitor et dolor sed condimentum. Praesent porttitor lorem dui,
							in pulvinar enim rhoncus vitae. Curabitur tincidunt, turpis ac
							lobortis hendrerit, ex elit vestibulum est, at faucibus erat
							ligula non neque.</p>
					</div>


					<div class="clearfix"></div>
				</div>
		</div>
	</div>
	<!-- registration-form -->
	<!-- login -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content modal-info">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
			</div>
		</div>
	</div>
	<!-- //login -->
	<script src="js/bootstrap.js"></script>
</body>

</html>
