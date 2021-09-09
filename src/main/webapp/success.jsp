<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="Pack.User" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>로그인 성공</title>
</head>
<body>
	<jsp:useBean id="recv" class="Pack.User" scope="page" />
	<jsp:setProperty name="recv" property="uId"/>
	
	<div><%= recv.getuId()%>님 로그인 성공하셨습니다.</div>
	<br/>
	
	<a href="index.jsp">로그인 화면으로 돌아가기</a>
</body>
</html>