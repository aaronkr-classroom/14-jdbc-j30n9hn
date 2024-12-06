<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Database SQL</title>
    </head>
    <body>
        <%
            Connection conn=null;
            try {
                String url="jdbc:mysql://127.0.0.1:3306/JSPBookDB";
                String user = "root";
                String password="1234";

                Class.forName("com.mysql.jdbc.Driver");
                conn = DriverManager.getConnection(url, user, password);
                out.println("DB 연결 성공");
            } catch (SQLException ex) {
                out.println("DB 연결 실패<br>");
                out.println("SQLExecption: " + ex.getMessage());
            } finally {
                if (conn != null)
                    conn.close();
            }
        %>
    </body>
</html>