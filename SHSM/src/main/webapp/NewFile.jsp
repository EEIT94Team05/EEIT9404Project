<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<body>

<%   int  n = 0 ;
session.invalidate();
response.setHeader("Refresh",  n +";URL=http://eeit9419demo.southeastasia.cloudapp.azure.com:8080/SHSM/indexEEit.jsp"); 
%> 


</body>
</html>