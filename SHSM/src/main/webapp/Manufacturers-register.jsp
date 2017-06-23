<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <title>廠商登入與註冊</title>
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
						<a class="navbar-brand link link--yaku" href="index.jsp"><span>S</span><span>H</span><span>S</span><span>M</span></a>
					</h1>
                </div>
                <div class="top-nav">
                    <span class="menu"><img src="images/menu.png" alt=" " /></span>
                    <ul class="nav1 nav nav-wil cl-effect-11" id="cl-effect-11">
                        <li><a class="active" data-hover="" href="index.jsp">首頁 <span class="sr-only">(current)</span></a></li>
                        <li><a data-hover="" href="member-register.jsp">會員專區</a></li>
                        <li><a data-hover="" href="Manufacturers-register.jsp">廠商專區</a></li>
                        <li><a data-hover="" href="
Mall.html">購物商城</a></li>
                        <li><a data-hover="" href="contact.html">關於我們</a></li>
                        <li><a href="changlogin.html">註冊</a></li>
                    </ul>                 
                </div>
                <div class="clearfix"></div>
            </div>
        </div>
    </div>
    <!-- registration-form -->
    <div class="registration-form">
        <div class="container">
            <h2 class="tittle">廠商註冊</h3>
		<div class="registration-grids">
			<div class="reg-form">
				<div class="reg">
					 <form>
						 <ul>
							 <li class="text-info">姓名: </li>
							 <li><input type="text" value=""></li>
						 </ul>
						 <ul>
							 <li class="text-info">信箱: </li>
							 <li><input type="text" value=""></li>
						 </ul>				 
						<ul>
							 <li class="text-info">密碼: </li>
							 <li><input type="text" value=""></li>
						 </ul>
						 <ul>
							 <li class="text-info">再次確認密碼: </li>
							 <li><input type="password" value=""></li>
						 </ul>
						 <ul>
							 <li class="text-info">地址:</li>
							 <li><input type="password" value=""></li>
						 </ul>
						 <ul>
							 <li class="text-info">電話:</li>
							 <li><input type="text" value=""></li>
						 </ul>						
						 <input type="submit" value="註冊廠商">
						 <p class="click">已經擁有帳號? <a href="Manufacturers-logning.html"> 登入請按這</a></p> 
					 </form>
				 </div>
			</div>
        <!-- /container -->
        <div class="reg-right">
            <h3>Completely Free Account</h3>
            <p>Pellentesque neque leo, dictum sit amet accumsan non, dignissim ac mauris. Mauris rhoncus, lectus tincidunt tempus aliquam, odio libero tincidunt metus, sed euismod elit enim ut mi. Nulla porttitor et dolor sed condimentum. Praesent porttitor lorem dui, in pulvinar enim rhoncus vitae. Curabitur tincidunt, turpis ac lobortis hendrerit, ex elit vestibulum est, at faucibus erat ligula non neque.</p>
            <h3 class="lorem">Lorem ipsum dolor sit amet elit.</h3>
            <p>Tincidunt metus, sed euismod elit enim ut mi. Nulla porttitor et dolor sed condimentum. Praesent porttitor lorem dui, in pulvinar enim rhoncus vitae. Curabitur tincidunt, turpis ac lobortis hendrerit, ex elit vestibulum est, at faucibus erat ligula non neque.</p>
        </div>

	
        <div class="clearfix"></div>
    </div>
    </div>
    </div>
    <!-- registration-form -->
    <!-- login -->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content modal-info">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                </div>
            </div>
        </div>
    </div>
    <!-- //login -->
    <!--footer-top-->
    <div class="footer-top">
        <div class="container">
            <div class="footer-left">
                <h3>網站導覽</h3>
                <p>At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga.</p>
                <ul>
                    <li>公司地址<span>台北市大安區</span>信義路三段118號 </li>
                    <li>+886-6631-6666 </li>
                    <li><a href="mailto:info@example.com">iiiorg@example.com</a> </li>
                </ul>
            </div>
            <div class="footer-middle">
                <h3>推薦廠商</h3>
                <div class="foo-grids">
                    <a href="#"><img class="img-responsive" src="images/blog1.jpg" alt="" /></a>
                    <p><a href="#">Accusamus et iusto 
				odio dignissimos ducimus et iusto odio qui blanditiis dignissimos</a></p>
                    <div class="clearfix"></div>
                </div>
                <div class="foo-grids">
                    <a href="#"><img class="img-responsive" src="images/blog2.jpg" alt="" /></a>
                    <p><a href="#">Odio dignissimos ducimus qui blanditiis
				praesentium voluptatum Accusamus et iusto</a></p>
                    <div class="clearfix"></div>
                </div>
                <div class="foo-grids">
                    <a href="#"><img class="img-responsive" src="images/blog3.jpg" alt="" /></a>
                    <p><a href="#">Dignissimos ducimus qui blanditiis
				praesentium voluptatum. Odio dignissimos ducimus</a></p>
                    <div class="clearfix"></div>
                </div>
            </div>
            <div class="footer-right">
                <h3>聯絡我們</h3>
                <p>Sed ut perspiciatis odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias</p>
                <form>
                    <input type="text" value="Email" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Email';}" required="">
                    <input type="submit" value=" ">
                </form>
            </div>
            <div class="clearfix"></div>
        </div>
    </div>
    <!--//footer-top-->
    <a href="#" id="toTop" style="display: block;"> <span id="toTopHover" style="opacity: 1;"> </span></a>
    <script src="js/bootstrap.js"></script>
</body>

</html>
