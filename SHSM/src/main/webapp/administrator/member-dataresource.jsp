<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="/Content/AssetsBS3/img/favicon.ico">
    <title>會員管理</title>
    <!-- Bootstrap core CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css" rel="stylesheet">
    <!--分頁-->
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.15/css/jquery.dataTables.min.css" />

</head>
<body>
<h2 class="sub-header">會員列表</h2>
    <hr/>
    <div class="table-responsive">
        <table class="table table-striped" id="tb">
            <thead>
                <tr>
                    <th>帳號</th>
                    <th>密碼</th>
                    <th>名稱</th>
                    <th>住址</th>
                    <th>電話</th>
                    <th>註冊日期</th>
                    <th>信箱</th>
                    <th>性別</th>
                </tr>
            </thead>
            <tbody>
               
               
            </tbody>
        </table>
        </div>
        <script>

		$(function(){
		
			$('#tb').DataTable({
					"ajax":"CustomerALLServlet",
					"info":false
				});

		});

        </script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
        <script src="../js/docs.min.js"></script>
        <script type="text/javascript" src="https://cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js"></script>
   
</body>
</html>