<%@ page import="java.sql.*" %>
<%
	Connection conn=null;
	
	String url="jdbc:mysql://127.0.0.1:3306/JSPBookDB";
	String user = "root";
	String password="1234";
	
	Class.forName("com.mysql.jdbc.Driver");
    conn = DriverManager.getConnection(url, user, password);
 %>