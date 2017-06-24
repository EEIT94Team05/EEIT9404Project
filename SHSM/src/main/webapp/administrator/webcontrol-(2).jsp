<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>後台管理</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css" rel="stylesheet">
    <link href="../css/dashboard.css" rel="stylesheet">
    <script type="text/javascript" src="../js/jquery-1.11.1.min.js"></script>
    <script type="text/javascript" src="../js/jquery-tablepage-1.0.js"></script>
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script>
    $(function() {
        $('#sidebar li').bind('click', function() {
            $(this).next().show();
        })
    });
    </script>
</head>

<body>
    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
        <div class="container-fluid">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="#">後台管理系統</a>
            </div>
            <div id="navbar" class="navbar-collapse collapse">
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="index.html">前往SHSM首頁</a></li>
                    <li><a href="member.html">會員專區</a></li>
                    <li><a href="Manufacturers.html">廠商專區</a></li>
                    <li><a href="#">登出</a></li>
                </ul>
            </div>
        </div>
    </nav>
    <div class="container-fluid">
        <div class="row">
            <div class="col-sm-3 col-md-2 sidebar">
                <ul class="nav nav-sidebar">
                    <li class="active"><a href="#" id="sidebar">管理者頁面 <span class="sr-only">(current)</span></a></li>
                    <li><a href="webcontrol-(1).jsp" id="sidebar">會員管理 (會員列表)</a></li>
                    <li><a href="webcontrol-(2).jsp">廠商審核</a></li>
                    <li><a href="webcontrol-(3).jsp">廠商管理 (廠商列表)</a></li>
                    <li><a href="webcontrol-(4).jsp">商城管理</a></li>
                    <li><a href="webcontrol-(5).jsp">檢舉清單審查</a></li>
                </ul>
            </div>
            <!--會員圖像顯示新增會員區塊-->
            <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
                <!--廠商審核-->
                <div id="Manufacturerschack-dataresource">
                    <iframe src="Manufacturerschack-dataresource.jsp" frameborder="0" width="1200" height="800" scrolling="no" style="margin: 30px 0 0 0 "></iframe>
                </div>
                <!--廠商審核 end-->
            </div>
        </div>
    </div>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
    <script src="../js/docs.min.js"></script>
</body>

</html>
