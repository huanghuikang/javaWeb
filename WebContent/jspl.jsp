<%@page import="java.text.SimpleDateFormat"%>
<%@ import="java.util.Date" %>
<%@ import="java.text.SimpleDateFormat" %>
<%@ import="java.text.DateFormat" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%!
		int a = 12;//全局变量
		DateFormat df = null;
		{
			df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		}
	%>
	<%//局部变量
		int i = 10;
		int j = 11;
	%>
	<%--获取Servlet的上下文 --%>
	<%=i+j%>
	<br>
	<%=request.getServletContext().getRealPath("") %>
	<br>
	<!-- 显示日期 -->
	<%=df.format(new Date()) %>
</body>
</html>
