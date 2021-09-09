<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="Pack.User" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>아이디 찾기</title>
</head>
<body>
	<jsp:useBean id="recv" class="Pack.User" scope="page"></jsp:useBean>
	<jsp:setProperty property="uId" name="recv"/>
	
	<h1>아이디 찾기</h1>
	<div>
		<fieldset >
			<form method = "POST" action = "findidSQL.jsp">
				<label>이름    : </label>
				<input type = "text" name = "uName" required><br>
				<label>전화번호 : </label>
				<input type = "text" name ="uTel" required>
				<input type = "submit" value = "찾기">
				<% String uId = recv.getuId();
					if(uId != null){
					out.print("아이디 또는 비밀번호가 틀렸습니다.");
				} %>
			</form>
		</fieldset>
	</div>
</body>
</html>