<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<script type="text/javascript">
$("#divId").hide();
$(function() {
	function abc(data){
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
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.2/css/bootstrap-select.min.css">
    <!-- Latest compiled and minified JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.2/js/bootstrap-select.min.js"></script>
    <!-- (Optional) Latest compiled and minified JavaScript translation files -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.2/js/i18n/defaults-*.min.js"></script>
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.15/css/jquery.dataTables.min.css" />
</head>

<body>


	    <div class="container" >
	        <ul class="nav nav-tabs">
	            <li>
	            	<a href="member-page.html">會員專區</a>
	            </li>
	            <li>
	            	<a href="member-case.html" >新增案件</a>
	            </li>
	            <li class="active">
	            	<a href="<c:url value='/controller/MemberCaseQuery'/>">查詢案件</a>
	            </li>
	            <li>
	                <a href="member-Manufacturers.html">廠商列表</a>
	            </li>
	        </ul>
	    </div>

<!--     <div> -->
<!--     	<iframe src="file:///C:/Users/liu/Desktop/%E5%B0%88%E9%A1%8C%E5%B0%88%E5%8D%80/web/casepage/casequery.html" frameborder="0" width="1550" height="900" scrolling="no"></iframe> -->
<!--     </div> -->
<c:if test="${not empty repaircase}">
		<table id="tb" border="1">
			<thead>
				<tr>
					<th>案件編號</th>
					<th>預算金額</th>
					<th>案件種類</th>
					<th>案件標題</th>
					<th>案件地址</th>
					<th>案件場所</th>
					<th>期望維修日期</th>
					<th>案件內容</th>
					<th>案件圖片</th>
					<th>案件狀態</th>
					<th>案件完成日期</th>
					<th>案件評分</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach var="repaircase" items="${repaircase}" varStatus="idStatus">
				<tr>
<%-- 					<td>${repaircase.repaircase_id}</td> --%>
					<td>${idStatus.count}</td>
					<td>${repaircase.repaircase_budget}</td>
					<td>${repaircase.repaircase_type}</td>
					<td>${repaircase.repaircase_title}</td>
<%-- 					<td>${repaircase.repaircase_area}</td> --%>
					<td>${repaircase.repaircase_address}</td>
					<td>${repaircase.repaircase_place}</td>
					<td>${repaircase.repaircase_repairdate}</td>
					<td>${repaircase.repaircase_context}</td>
					<td>
						<img width='100' height='100' src="${pageContext.request.contextPath}/controller/GetCaseImageServlet?id=${repaircase.repaircase_id}"/>
					</td>
<%-- 					<td>${repaircase.repaircase_createdate}</td> --%>
					<td>${repaircase.repaircase_status}</td>
					<td>${repaircase.repaircase_finday}</td>
					<td>${repaircase.repaircase_score}</td>
<%-- 					<td>${repaircase.biddingBean}</td> --%>
					<c:if test="${repaircase.repaircase_status=='招標中'}">
					<td>
<div class="modExample">
			<a href="#myModal1" role="button" onclick="abc(${repaircase})" data-target="#myModal${repaircase.repaircase_id}"
				class="btn btn-default" data-toggle="modal" id="${repaircase.repaircase_id}">查詢投標廠商</a>
		</div>
			<div id="myModal${repaircase.repaircase_id}" class="modal" data-easein="fadeIn" tabindex="-1"
				role="dialog" aria-labelledby="myModalLabel" aria-hidden="false">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<center>
								<button type="button" class="close" data-dismiss="modal"
									aria-hidden="true">×</button>
								<h4 class="title" id="myModalLabel">投標廠商</h4>
							</center>

							

						<div class="modal-body">
							<div>
								
								<div>
									<h4><font size="4">案件標題  :</font></h4>
									<h4><font size="4">${repaircase.repaircase_title}</font></h4>
								</div>
								<form action="<c:url value=''/>" method="post">
								<div>

									<h4><font size="4">投標廠商  :</font></h4>
								<table>
								<tr>
								<c:forEach var="biddingbean" items="${repaircase.biddingBean}">
									
									<img width=50 height=50 src="${pageContext.request.contextPath}/controller/GetCompanyImageServlet?id=${biddingbean.biddingPk.com_id}" />
									<input type="submit" name="com_id_detail" value="${biddingbean.biddingPk.com_id}">
								
								</c:forEach>
								</tr>
								
								
								</table>
								</div>
								</form>
							</div>
							
						</div>
</div></div></div></div>
					</td>
					</c:if>
				</tr>

				</c:forEach>
			</tbody>
		</table>
		</c:if>

		
		<script type="text/javascript" src="https://cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js"></script>
    	<script src="js/bootstrap.js"></script>
    	

</body>

</html>
