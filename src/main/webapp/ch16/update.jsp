<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Database SQL:Update</title>
</head>
<body>
	<%@ include file="connect.jsp" %>
	<%
	request.setCharacterEncoding("utf-8");
	
	String id= null;
	String pw = null;
	String name = null;
	
	ResultSet rs = null;
	PreparedStatement pstmt = null;
	
	try {
		String sql= "SELECT id, passwd, name FROM Member WHERE id=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, request.getParameter("id"));
		rs = pstmt.executeQuery();
		
		if(rs.next()) {
			id = rs.getString("id");
			pw = rs.getString("passwd");
		}
	} catch (SQLException e) {
		out.println("Member 테이블에서 id를 찾을 수 없음");
		out.println("SQLException: " + e.getMessage());
	} finally {
		if (rs!=null) rs.close();
		if (pstmt!=null) pstmt.close();
		if (conn!=null) conn.close();
	}
	%>
	<form method="post" action="update_process.jsp">
		<p>아이디: <input type="text" name="id" value="<%= id %>" /></p>
		<p>비밀번호: <input type="password" name="passwd" value="<%= pw %>" /></p>
		<p>이름: <input type="text" name="name" value="<%= name %>"/></p>
		<p> <input type="submit" value="전송"></p>
	</form>
</body>
</html>