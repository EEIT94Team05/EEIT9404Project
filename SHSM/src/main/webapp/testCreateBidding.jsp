<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="<c:url value='/CreateBiddingServlet' />" enctype="multipart/form-data" method="post">
													 
    <table border='1'>
    <tr>
	<td>案件id</td>
	<td><input type="text" name="repaircaseid" /></td>
	</tr>
	<tr>
	<td>廠商id</td>
	<td><input type="text" name="comid" /></td>
	</tr>
	<tr>
	<td>提報金額</td>
	<td><input type="text" name="amount" /></td>
	</tr>
<!-- 	<tr> -->
<!-- 	<td>日期</td> -->
<!-- 	<td><input type="text" name="date" /></td> -->
<!-- 	</tr> -->
	<tr>
	<td>內文</td>
	<td><input type="textaria" name="context" /></td>
	</tr>
	<tr>
	<td>圖片</td>
	<td><input type="file" name="img" /></td>
	</tr>
	<tr>
	<td></td>
	<td><input type="submit" name="submit" value="確定送出" /></td>
	</tr>
	</table>
</form>
</body>
</html>