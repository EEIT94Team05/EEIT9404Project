<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript">

$(function() {
	$("#divId").hide();
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
function bid(com_id,repaircase_Id){
	console.log(com_id,repaircase_Id);
		$.get('SearchBidding.controller',{'repaircase_Id':repaircase_Id,'com_id':com_id},function(data){
			$('#searchbidding > tbody > tr:nth-child(2) > td').text(data.bidding_amount);
			$('#searchbidding > tbody > tr:nth-child(4) > td').text(data.bidding_date);
			$('#searchbidding > tbody > tr:nth-child(6) > td').text(data.bidding_context);
				console.log(data.bidding_context)			
		})
}

</script>
<head>
    <title>案件查詢</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
    
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.2/css/bootstrap-select.min.css">
    <!-- Latest compiled and minified JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.2/js/bootstrap-select.min.js"></script>

    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.15/css/jquery.dataTables.min.css" />
</head>

<body>


	    <div class="container" >
	        <ul class="nav nav-tabs">
	            <li>
	            	<a href="bootstarptest.jsp">會員專區</a>
	            </li>
	            <li>
	            	<a href="member-case.jsp" >新增案件</a>
	            </li>
	            <li class="active">
	            	<a href="member-casequery.jsp">查詢案件</a>
	            </li>
	        </ul>
	    </div>
                <iframe src="casepage/casequery.jsp" frameborder="0" width="1700" height="600"></iframe>

		<script type="text/javascript" src="https://cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js"></script>

    	

</body>

</html>
