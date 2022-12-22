<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta name="description" content="旅遊景點介紹,文章和評論" />
    <meta name="author" content="Tony hsu" />
    <title>旅遊景點網站 | 新增文章</title>
    <!--font family-->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Noto+Sans+TC&display=swap"
      rel="stylesheet"
    />
    <!--css file-->
    <link rel="stylesheet" href="styles/newArticleStyle.css" />
	<% String no = String.valueOf(session.getAttribute("sn"));  %>
	<meta http-equiv="refresh" content="2;url= attractions.jsp?no=<%=no %> ">
</head>
<body>
	<header>
      <!--logo-->
      <div class="logo">
        <img src="./imgs/icons8-double-decker-bus-96.png" alt="bus icon" />
        <h1>旅遊景點網站</h1>
      </div>
      <!--景點搜尋-->
      <div class="search">
        <form action="#">
          <label for="search">搜尋:</label>
          <input type="text" name="search" id="search" />
          <button type="submit">
            <img src="./imgs/icons8-search-100.png" />
          </button>
        </form>
      </div>
      <!--navbar-->
      <nav>
        <ul>
          <li><a href="#">首頁</a></li>
          <li><a href="index.jsp" class="action">景點介紹</a></li>
          <li><a href="#">關於我們</a></li>
          <li><a href="#">聯絡方式</a></li>
        </ul>
      </nav>
    </header>
    <main>

<%
	String user = "root";
	String pass = "1234";
	String url = "jdbc:mysql://localhost:3306/projectdb";

	Connection conn = null;
	PreparedStatement pstmt = null;

	request.setCharacterEncoding("utf-8");
	String title = request.getParameter("title");
	String experience = request.getParameter("content");
	
	try {
		Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
		conn = DriverManager.getConnection(url, user, pass);
		
		String sql="insert into projectdb.addarticle(title,experience,ano)" + "values('"+title+"','"+experience+"','"+no+"')";
		Statement st=conn.createStatement();
		int i=st.executeUpdate(sql);
		%>
		<h1>Data is successfully insert</h1>
<%
	} catch (Exception ex) {
		ex.printStackTrace();
	}
%>
	</main>
</body>
<script src="js/newArticleJs.js"></script>
</html>