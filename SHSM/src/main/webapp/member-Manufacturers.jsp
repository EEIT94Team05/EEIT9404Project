<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <title>會員專區</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.2/css/bootstrap-select.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.2/js/bootstrap-select.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.2/js/i18n/defaults-*.min.js"></script>
</head>

<body>
    <div class="container">
        <ul class="nav nav-tabs">
            <li><a href="casepage/services.jsp">會員專區</a></li>
            <li><a href="member-case.jsp">新增案件</a></li>
            <li><a href="member-casequery.jsp">查詢案件</a></li>
            <li class="active">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" href="#">廠商列表</a>
            </li>
        </ul>
        <div class="row">
            <div class="col-md-12">
                <iframe src="casepage/services-forManufacturerscahck.jsp" frameborder="0" width="1200" height="500" scrolling="no"></iframe>
            </div>
        </div>
    </div>
    <script src="js/bootstrap.js"></script>
</body>

</html>
