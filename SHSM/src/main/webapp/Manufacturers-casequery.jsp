<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<script type="text/javascript">
	$("#divId").hide();
	$(function() {
		function abc(data) {
			var id = data.repaircase_id;
			console.log(id);

			$(id).show().css({
				position : "absolute",
				top : event.pageY,
				left : event.pageX

			});
			$(id).mouseleave(function() {
				$(id).hide();
			});
		}

	});
</script>
<head>
<title>案件查詢</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.2/css/bootstrap-select.min.css">
<!-- Latest compiled and minified JavaScript -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.2/js/bootstrap-select.min.js"></script>
<!-- (Optional) Latest compiled and minified JavaScript translation files -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.2/js/i18n/defaults-*.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.10.15/css/jquery.dataTables.min.css" />
</head>

<body>
	<div class="container">
		<ul class="nav nav-tabs">
			<li><a href="bootstarptest2.jsp">廠商專區</a></li>
			<li><a href="bootstarptest2.jsp">查詢案件</a></li>
			<li class="active"><a href="Manufacturers-casequery.jsp">追蹤案件</a></li>
		</ul>
	</div>
	<div>	
	<iframe src="casepage/services-forManufacturerscahck.jsp"
		frameborder="0" width="1400" height="600" scrolling="no" style="align:center;"></iframe>
	</div>

	<script type="text/javascript"
		src="https://cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js"></script>
	<script src="js/bootstrap.js"></script>


</body>

</html>
