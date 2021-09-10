<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="Pack.User" %>
<%@ page import="java.sql.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="recv" class="Pack.User" scope="page"/>
	<jsp:setProperty name="recv" property="*" />
	
	<%
		String uId = recv.getuId();
			String pass = recv.getPass();
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet result = null;

			try {
				Class.forName("com.mysql.jdbc.Driver");
				String url = "jdbc:mysql://localhost/db01";
				conn = DriverManager.getConnection(url, "root", "1234");
				// 연결 끝
				out.print(1);
				String sql = "SELECT COUNT(*) AS CNT FROM USERINFO WHERE UID = ? AND PASS = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, uId);
				pstmt.setString(2, pass);
				
				result = pstmt.executeQuery(); 
				
				if (result.next()) {
					String match = result.getString("CNT");
					if (match.equals("1")) {
						//response.sendRedirect("success.jsp?uId=" + request.getParameter("uId"));
						response.sendRedirect("success.jsp?uId=" + uId);
					} else {
						//response.sendRedirect("index.jsp?uId=" + request.getParameter("uId"));
						response.sendRedirect("index.jsp?uId=" + uId);
					}
				}

			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				try {
			if (conn != null && !conn.isClosed()) {
				conn.close();
			}
			if (pstmt != null && !pstmt.isClosed()) {
				pstmt.close();
			}
			if (result != null && !result.isClosed()) {
				result.close();
			}
				} catch (SQLException e) {
			e.printStackTrace();
				}
			}
		%>
</body>
</html>