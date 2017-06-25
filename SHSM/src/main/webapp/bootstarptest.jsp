<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>會員導行列</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
</head>

<body>
    <div class="container">
        <ul class="nav nav-tabs">
            <li class="active"><a href="casepage/services.jsp">會員專區</a></li>
            <li><a href="member-case.jsp">新增案件</a></li>
            <li><a href="member-casequery.jsp">查詢案件</a></li>
            <li><a href="member-Manufacturers.jsp">廠商列表</a>
            </li>
        </ul>
    </div>
    <div>
        <iframe src="casepage/services.jsp" frameborder="0" width="100%" height="1000" scrolling="no"></iframe>
    </div>
</body>

</html>
