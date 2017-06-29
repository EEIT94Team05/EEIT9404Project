<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>會員登入與註冊</title>
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
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>

</head>

<body onload="createCode()">
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
                                <li><a class="active"  href="index.jsp">首頁
								<span class="sr-only">(current)</span>
						</a></li>
                                <li><a  href="member-register.jsp">會員專區</a></li>
                                <li><a  href="Manufacturers-register.jsp">廠商專區</a></li>
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
				會員登入
				</h2>
				<div class="registration-grids">
					<div class="reg-form">
						<div class="reg">

							<form  action="<c:url value="Customerlogin.controller" />" method="get">

								<ul>
									<li class="text-info">帳號:</li>
									<li><input type="text" name="username" value="" style="margin: 0 -150px"></li>
								</ul>
								<ul>
									<li class="text-info">密碼:</li>
									<li><input type="password" name="password" value="" style="margin: 0 -150px"></li>
								</ul>
								
			<table border="0" cellspacing="2" cellpadding="2" style="margin: 0 100px 0 0 ;">
                <tr>
                    <td>
                        <div class="code" id="checkCode" onclick="createCode()"></div>
                    </td>
                    <td><a href="#" onclick="createCode()">換一張</a></td>
                </tr>
                <tr>
                    <td width="100px"><input style="float:left;" type="text" id="inputCode" width="50px" /> </td>
                  
                    <td><a style="margin: 0 0 0 10px">輸入驗證碼</a></td>
                </tr>
            </table>
                                    <div style="margin: -60px 0 0 30px">
									<a href="member-register.jsp" style="margin: 0 0 0 250px">尚未擁有帳號?</a>
									
									<input type="submit"  onclick="validateCode()" value="登入" style="margin: 0 0 0 240px">
								
								</div>
							</form>
						</div>
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
				<!-- registration-form -->

				<script src="js/bootstrap.js"></script>
</body>

</html>
