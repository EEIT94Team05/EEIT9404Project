<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
    <title>廠商專區</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="css/bootstrap.css" rel='stylesheet' type='text/css' />
    <link href="css/style.css" rel='stylesheet' type='text/css' />
    <script src="js/jquery-1.11.1.min.js"></script>
    <link rel="stylesheet" href="css/lightbox.css" type="text/css" media="all" />
    <script type="text/javascript" src="js/move-top.js"></script>
    <script type="text/javascript" src="js/easing.js"></script>
</head>
<body>
    <div class="page-head">
        <div class="container">
            <div class="navigation">
                <div class="logo">
                    <h1>
                            <a class="navbar-brand link link--yaku" href="Manufacturers.jsp"><span>廠</span><span>商</span><span>專</span><span>區</span></a>
                    </h1>
                </div>
                <div class="top-nav">
                    <span class="menu"><img src="images/menu.png" alt=" " /></span>
                    <ul class="nav1 nav nav-wil cl-effect-11" id="cl-effect-11">
                     <li><a class="active" data-hover="" href="irikuji/index.jsp">首頁 <span class="sr-only">(current)</span></a></li>
                     <li><a href="#">${company.com_name}</a></li>
                        <li><a href="NewFile.jsp">登出</a></li>
                    </ul>
                </div>
                <div class="clearfix"></div>
            </div>
        </div>
    </div>
    <div>
        <iframe src="bootstarptest2.jsp" frameborder="0" width="100%" height="1200"></iframe>
    </div>
    <script src="js/bootstrap.js"></script>
</body>


</html>
