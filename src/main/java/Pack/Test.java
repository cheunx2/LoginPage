package Pack;

import java.sql.*;

public class Test {
    private static Test Test = new Test();
    private Test() {}
    public static Test Test() {}
	private Connection getConnection() throws Exception {
		String url = "jdbc:mysql://localhost/db01";
		String user= "root";
		String passwd = "1234";
		Connection conn = null;

		// 1) JDBC 드라이버 로딩
		Class.forName("oracle.jdbc.OracleDriver");
		// 2) DB연결
		conn = DriverManager.getConnection(url, user, passwd);
		return conn;
	};

	private void closeJDBC(Connection conn, PreparedStatement pstmt, ResultSet rs) {
		if (rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (pstmt != null) {
			try {
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	} // closeJDBC()

		if (rs.next()) {
			String match = rs.getString("CNT");
			if (match.equals("1")) {
				rs.sendRedirect("success.jsp?uId=" + request.getParameter("uId"));
			} else {
				rs.sendRedirect("index.jsp?uId=" + request.getParameter("uId"));
			}
		}

String sql = "SELECT COUNT(*) AS CNT FROM USERINFO WHERE UID = ? AND PASS = ?";
pstmt = conn.prepareStatement(sql);
pstmt.setString(1, uId);
pstmt.setString(2, pass);