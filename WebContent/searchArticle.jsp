<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta name="description" content="旅遊景點介紹,文章和評論" />
    <meta name="author" content="Tony hsu" />
	<title>旅遊景點網站 | 查詢結果</title>
	<!--font family-->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Noto+Sans+TC&display=swap"
      rel="stylesheet"
    />
    <!--css file-->
    <link rel="stylesheet" href="styles/articleStyle.css" />
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
		String no = request.getParameter("no");
		String sql = "select * from projectdb.addarticle where id="+searchArticle+" and "+"ano="+no+";";
		rs = stmt.executeQuery(sql);
		
		if(rs.next())
			out.print("<h2>"+rs.getString(2)+"</h2><p>"+rs.getString(3)+"</p>");
		else
			out.print("<h1>找不到文章</h1>");
		%>
	</main>
	<!--top button-->
    <button onclick="topFunction()" id="myBtn" title="Go to top">Top</button>	
</body>
	<script src="js/articleJs.js"></script>
</html>