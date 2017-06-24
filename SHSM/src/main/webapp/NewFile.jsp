<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>testdata&photo</title>
</head>
<body>

<%   int  n = 0 ;
session.invalidate();
response.setHeader("Refresh",  n +";URL=http://localhost:8080/SHSM/index.jsp"); 
%> 

<form action="<c:url value="/controller/selectbidding.controller"/>">
	 <div >
         <input name="id" >
     </div>
	<button type="submit">CHECK</button>
	
	
</form>
<div>
		<c:if test="${not empty selectBidding}">
<table>
	<thead>
	<tr>
	<th>repaircase_id</th>
	<th>repaircase_budget</th>
	<th>repaircase_type</th>
	<th>repaircase_title</th>
	<th>repaircase_area</th>
	<th>repaircase_address</th>
	<th>repaircase_place</th>
	<th>repaircase_repairdate</th>
	<th>repaircase_context</th>
	<th>repaircase_img1</th>
<!-- 	<th>repaircase_img2</th> -->
<!-- 	<th>repaircase_img3</th> -->
	<th>repaircase_media</th>
	<th>repaircase_createdate</th>
	<th>repaircase_status</th>
	<th>repaircase_finday</th>
	<th>repaircase_score</th>
	<th>customerbean</th>
	<th>companybean</th>
	</tr>
	</thead>
	<tbody>
	<tr>
		<td>${selectBidding.repaircase_id}</td>
		<td>${selectBidding.repaircase_budget}</td>
		<td>${selectBidding.repaircase_type}</td>
		<td>${selectBidding.repaircase_title}</td>
		<td>${selectBidding.repaircase_area}</td>
		<td>${selectBidding.repaircase_address}</td>
		<td>${selectBidding.repaircase_place}</td>
		<td>${selectBidding.repaircase_repairdate}</td>
		<td>${selectBidding.repaircase_context}</td>
<%-- 		<td>${selectBidding.repaircase_img1}</td> --%>
		<td>
		<img width="100" height="100" src="${pageContext.request.contextPath}/controller/GetCaseImageServlet?id=${selectBidding.repaircase_id}"/>
		</td>
		
<%-- 		<td>${selectBidding.repaircase_img2}</td> --%>
<%-- 		<td>${selectBidding.repaircase_img3}</td> --%>
		<td>${selectBidding.repaircase_media}</td>
		<td>${selectBidding.repaircase_createdate}</td>
		<td>${selectBidding.repaircase_status}</td>
		<td>${selectBidding.repaircase_finday}</td>
		<td>${selectBidding.repaircase_score}</td>
		<td>${selectBidding.customerbean}</td>
		<td>${selectBidding.biddingBean}</td>
	</tr>
	</tbody>
</table>
</c:if>
	</div>
</body>
</html>