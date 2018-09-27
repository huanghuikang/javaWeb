<%@page import="java.util.Date" %>
<%@ page language="java" contentType="text/html; charset=Utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="Utf-8">
<title>Insert title here</title>
</head>
<body>
	<%
		Date date = new Date();
		out.print(date);
	%>
</body>
</html>
