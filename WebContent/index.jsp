<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="zh-Hant">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta name="robots" content="index,follow" />
<meta name="description" content="旅遊景點" />
<meta name="author" content="Tony hsu" />
<title>旅遊景點網站 | 景點</title>
<!--google fonts-->
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+TC&display=swap"
	rel="stylesheet" />
<link rel="stylesheet" href="./styles/style.css" />
</head>
<body>
	<%
				Statement stmt = null;
				ResultSet rs = null;
				String user = "root";
				String pass = "1234";
				String url = "jdbc:mysql://localhost:3306/projectdb?";
				request.setCharacterEncoding("utf-8"); 
				%>
	<header>
		<!--logo-->
		<div class="logo">
			<img src="imgs/icons8-double-decker-bus-96.png" alt="bus icon" />
			<h1>旅遊景點網站</h1>
		</div>
		<!--景點搜尋-->
		<div class="search">
			<form action="#">
				<label for="search">搜尋:</label> <input type="search" name="search"
					id="search" />
				<button type="submit">
					<img src="imgs/icons8-search-100.png" />
				</button>
			</form>
		</div>
		<!--navbar-->
		<nav>
			<ul>
				<li><a href="#">首頁</a></li>
				<li><a href="#" class="action">景點介紹</a></li>
				<li><a href="#">關於我們</a></li>
				<li><a href="#">聯絡方式</a></li>
			</ul>
		</nav>
	</header>
	<main>
		<table>
			<% 
      String name = request.getParameter("search");
				if (name == null) {
					name = "";
				}
				try {
					Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
					Connection conn = DriverManager.getConnection(url, user, pass);
					stmt = conn.createStatement();
					String sql = "select * from projectdb.attractions where title like '%" + name + "%';";
					rs = stmt.executeQuery(sql);
					out.print("<tr>");
					while (rs.next()) {
						out.print("<td><img src=\"" + rs.getString(3)+ "\"><a href=\"attractions.jsp?no="+rs.getInt(1)+ "&locationName="+rs.getString(2)+"\" class=\"attractions\">" + rs.getString(4) + "</a><a href=\""+ rs.getString(6) + "\" class=\"location\" target=\"_blank\" >" + rs.getString(7)
						+ "</a></td>");
					}
					out.print("</tr>");
				} catch (SQLException e) {
					out.println("Connection is NOT OK");
				}
			%>
		</table>
	</main>
	<!--top button-->
	<button onclick="topFunction()" id="myBtn" title="Go to top">Top</button>
</body>
<script src="js/indexJs.js"></script>
</html>
