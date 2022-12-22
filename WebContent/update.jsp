<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<!-- 新增頁-->
<html >
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta name="description" content="旅遊景點介紹,文章和評論" />
    <meta name="author" content="Tony hsu" />
    <title>旅遊景點網站 | 編輯文章</title>
    <!--font family-->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Noto+Sans+TC&display=swap"
      rel="stylesheet"
    />
    <!--css file-->
    <link rel="stylesheet" href="styles/newArticleStyle.css" />
    <script>
    function resetSearch(){
		document.getElementById(search).value="";
	}
    </script>
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
        <form action="attractions.jsp">
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
		ResultSet rs = null;
		String user = "root";
		String pass = "1234";
		String url = "jdbc:mysql://localhost:3306/projectdb?useUnicode=true&characterEncoding=UTF-8";
		Connection conn = DriverManager.getConnection(url, user, pass);
		Class.forName("com.mysql.cj.jdbc.Driver");
		Statement stmt = conn.createStatement();
		String searchArticle = request.getParameter("searchArticle");
		String sql = new String();
		sql = "select * from projectdb.addarticle where id="+searchArticle+"";
		rs = stmt.executeQuery(sql);
	%>
	<%rs.next(); %>
    <form action="updateconnect.jsp" method="post" >
    <!--標題-->
    <div class="tltleArea"><label for="title">輸入標題:</label>
    	<input type="text"maxlength="20" minlength="2" name="title" id="title" value="<% out.print(rs.getString(2)); %>">
    </div>
    <!--內容-->
    <label for="content">輸入文章內容:</label>
    <textarea  name="content" id="content" maxlength="5000"><% out.print(rs.getString(3));%></textarea>
    <input type="hidden" name="id" value="<% out.print(rs.getString(1));%>">
    <input type="submit" value="送出"  >
    
    </form>
    </main>
</body>
<script src="js/newArticleJs.js"></script>
</html>