<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
</head>
<body>
	<form action="/javaWeb/WebContent/login.jsp">
		<table border="1">
			<tr>
				<td>用户名：</td>
				<td><input id = "username" type = "text" name = "username"></td>
			</tr>
			<tr>
				<td>密码：</td>
				<td><input id = "pass" type = "password" name = "pass"></td>
			</tr>
			<tr>
				<td><input type = "submit" value = "登录"></td>
				<td><input type="reset" value = "重置" /></td>
			</tr>
		</table>
	</form>
