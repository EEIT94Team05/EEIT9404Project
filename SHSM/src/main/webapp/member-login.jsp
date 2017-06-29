<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>會員登入與註冊</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<style type="text/css">
            .code {
                background: url(code_bg.jpg);
                font-family: Arial;
                font-style: italic;
                color: blue;
                font-size: 30px;
                border: 0;
                padding: 2px 3px;
                letter-spacing: 3px;
                font-weight: bolder;
                float: left;
                cursor: pointer;
                width: 150px;
                height: 60px;
                line-height: 60px;
                text-align: center;
                vertical-align: middle;
            }
            
            a {
                text-decoration: none;
                font-size: 12px;
                color: #288bc4;
            }
            
            a:hover {
                text-decoration: underline;
            }
            </style>
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
<script language="javascript" type="text/javascript">
            var code;
            function createCode() {
                code = "";
                var codeLength = 4; //验证码的长度
                var checkCode = document.getElementById("checkCode");
                var codeChars = new Array(0, 1, 2, 3, 4, 5, 6, 7, 8, 9,
                    'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z',
                    'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'); //所有候选组成验证码的字符，当然也可以用中文的
                for (var i = 0; i < codeLength; i++) {
                    var charNum = Math.floor(Math.random() * 52);
                    code += codeChars[charNum];
                }
                if (checkCode) {
                    checkCode.className = "code";
                    checkCode.innerHTML = code;
                }
            }
			
            function validateCode() {
                var inputCode = document.getElementById("inputCode").value;
                if (inputCode.length <= 0) {
                    alert("请輸入驗證碼！");
                } else if (inputCode.toUpperCase() != code.toUpperCase()) {
                    alert("驗證碼錯誤！");
                    createCode();
                    
                } else {
                    alert("驗證碼正確！");
                    str="驗證碼正確！";
                }
            }
            </script>
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

									<li><input type="text" name="username" value="eeit9410" style="margin: 0 -150px"></li>
								</ul>
								<ul>
									<li class="text-info">密碼:</li>

									<li><input type="password" name="password" value="a87654321" style="margin: 0 -150px"></li>
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
