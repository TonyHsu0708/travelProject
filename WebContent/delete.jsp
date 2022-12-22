<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<!DOCTYPE html>
<html>
<head>
<title></title>
</head>
<body>
	<%
			String user = "root";
			String pass = "1234";
			String url = "jdbc:mysql://localhost:3306/projectdb?";
			String no = String.valueOf(session.getAttribute("sn"));

			Connection conn = null;
			PreparedStatement pstmt = null;

			String search = request.getParameter("search");
			try {
			Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
			conn = DriverManager.getConnection(url, user, pass);

			String sql = "delete from projectdb.addarticle where id=" + search + "";
			Statement st = conn.createStatement();
			int i = st.executeUpdate(sql);

			System.out.println("");
			System.out.println("Data is successfully delete");
	%>
	<%
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	%>