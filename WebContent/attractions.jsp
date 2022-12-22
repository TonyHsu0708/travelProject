<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<%@page import="mydata.CmtSql"%>
<%@page import="mydata.Data"%>
<!DOCTYPE html>
<html lang="zh-Hant">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta name="description" content="旅遊景點介紹,文章和評論" />
    <meta name="author" content="Tony hsu" />
    <!-- use Bean -->
    <jsp:useBean id="cmt" class="mydata.CmtSql" />
    <title>旅遊景點網站 | 景點介紹</title>
    <!--font family-->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Noto+Sans+TC&display=swap"
      rel="stylesheet"
    />
    <!--css file-->
    <link rel="stylesheet" href="./styles/attractionsStyle.css" />
    
    <script>
	var edasset=true;
	var comm
	var xmlHTTP; 
	if(window.ActiveXObject)
	{
	    xmlHTTP=new ActiveXObject("Microsoft.XMLHTTP");
	}
	else if(window.XMLHttpRequest)
	{
	    xmlHTTP=new XMLHttpRequest();
	}
	xmlHTTP.onreadystatechange=function check_status()
	{
	    if(xmlHTTP.readyState == 4)
	    {
	        if(xmlHTTP.status == 200)
	        {
	        	window.location.reload();
	        }
	    }
	}
	function setcomment(id,locationName){
		comm = document.write_comment.comment.value;
		if(comm==""){
			alert("評論不能為空");
		}else{
			xmlHTTP.open("GET","http://localhost:8080/TravelWebsitProject/doComment?comm="+comm+"&no="+id+"&locationName="+locationName, true);          
		    xmlHTTP.send();
		    document.write_comment.comment.value="";
		    
		}
	}
	function edcomm(id){
		if(edasset){
			comm=document.getElementById("c"+id).innerText;
	    	document.getElementById("c"+id).innerHTML = "<textarea id=\"t"+id+"\"style=\"border: 1.5px solid #d6f3cc;background-color: white;height: 15vw;width: 100%;font-size: 0.75rem;padding: 15px;\">"+comm+"</textarea>";
	    	document.getElementById("b"+id).outerHTML = "<input type=\"button\" id=\"b"+id+"\" style=\"margin-bottom: 10px;border: none;cursor: pointer;width: 3vw;height: 2vw;border-radius: 5px;\" value=\"確定\" onClick=\"edit("+id+")\">"
		}
		edasset=false;
	}
	function edit(id){
		comm=document.getElementById("t"+id).value;
		if(comm==""){
			alert("評論不能為空");
		}else{
			xmlHTTP.open("GET","http://localhost:8080/Topic/doEditComment?number="+id+"&comm="+comm, true);          
		    xmlHTTP.send();
		    edasset=true;
		}
	}
	function delcomment(number){
		xmlHTTP.open("GET","http://localhost:8080/Topic/doDelComment?number="+number, true);          
	    xmlHTTP.send();
	}
	function sch(){
		var sea = document.getElementById("serch").value;
		if(sea==""){
			alert("請輸入查詢文章id");
		}else{
			document.sform.submit();
		}
	}
	
	function delArticle(id){
		xmlHTTP.open("GET","delete.jsp?search="+id,true);
		xmlHTTP.send();
	
	}
	function resetSearch(){
		document.getElementById(search).value="";
	}
	</script>
  </head>
  <%
  	String searchAttractions=request.getParameter("search");
  	Statement stmt = null;
	ResultSet rs = null;
	String user = "root";
	String pass = "1234";
	String url = "jdbc:mysql://localhost:3306/projectdb?";
	try {
		Class.forName("com.mysql.cj.jdbc.Driver").newInstance();

		Connection conn = DriverManager.getConnection(url, user, pass);
		stmt = conn.createStatement();
		String sql = "select * from projectdb.attractions where title=\"" + searchAttractions + "\";";
		rs = stmt.executeQuery(sql);
	} catch (SQLException e) {
		System.out.println("Connection is NOT OK");
	}
  	
  %>
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
          <button type="submit" onClick="resetSearch()">
            <img src="./imgs/icons8-search-100.png" />
          </button>
        </form>
      </div>
      <!--navbar-->
      <nav>
        <ul>
          <li><a href="index.jsp">首頁</a></li>
          <li><a href="index.jsp" class="action">景點介紹</a></li>
          <li><a href="#">關於我們</a></li>
          <li><a href="#">聯絡方式</a></li>
        </ul>
      </nav>
    </header>
    <%	
    	String no = request.getParameter("no");
    	if(no==null){
    		rs.next();
    		 no=rs.getString(1);
    		 System.out.println(no);
    		 
    	}
    	String locationName=request.getParameter("locationName");
			String sql = "select * from projectdb.attractions where id=" + no + ";";
			rs = stmt.executeQuery(sql);
		
	%>

    <main>
      <!--景點介紹-->
      <section class="left">
        <div>
          <h2>
			<%	
				while (rs.next()) {
				out.print(rs.getString(4));
			%>
		  </h2>
          <p>
            <%
				out.print(rs.getString(5));
			%>
          </p>
        </div>
        	<%
        		out.print("<img src=\"" + rs.getString(3) + "\" alt=\""+rs.getString(4)+"\" >");
        		}
	        	sql = "select * from projectdb.addarticle where ano=" + no + ";";
				rs = stmt.executeQuery(sql);
        	%>
      </section>
      <!--景點評論-->
      <section class="right">
        <h3>評論區</h3>
        <!--景點評論表頭-->
        <table class="commentAreaHead">
          <tr>
            <th style="width: 15%">編號</th>
            <th style="width: 65%">評論</th>
            <th style="width: 20%"></th>
          </tr>
        </table>
        <!--景點評論內容-->
        <div style="overflow: auto">
          <table>
            <tr>
              <td style="width: 15%"></td>
              <td style="width: 100%; display: block; overflow: auto"></td>
              <td style="width: 20%"></td>
            </tr>
            <tr>
              <td></td>
              <td style="display: block; overflow: auto"></td>
              <td></td>
            </tr>
            <tr>
              <%
				for (Data d : cmt.getData(no)) {
					int id = d.getId();
					String context = d.getContext();
					try {
						out.println("<tr><td>" + id + "</td><td id=\"c" + id + "\"style=\"display: block; overflow: auto\">" + context+"</td>");
						out.println("<td><button class=\"edit\" id=\"b" + id + "\"  onClick=\"edcomm("
								+ id + ")\">編輯</button><button  class=\"del\" onClick=\"delcomment(" + id+ ")\">刪除</button></td></tr>");
					} catch (Exception e) {
						e.printStackTrace();
					}
				}
			%>
            </tr>
          </table>
        </div>
        <!--新增評論區塊-->
        <form name=write_comment action="">
          <h4>請輸入評論:</h4>
          <textarea name="comment" id="comment" maxlength="500"></textarea>
          <input type="button" value="傳送" onClick="setcomment(<%=no%>,'<%=locationName%>')" />
          <input type="reset" class="reset" value="清空" />
        </form>
      </section>

      <section class="bottom">
        <!--文章區-->
        <div class="head">
          <h3>文章區</h3>
          <!--文章搜尋-->
          <form name="sform" action="searchArticle.jsp?no=<%=no%>" method="post">
            <label for="searchArticle">查詢文章:</label>
            <input type="number" name="searchArticle" id="searchArticle" />
            <input type="submit" value="送出" onClick="sch()"/>
          </form>
        </div>
        <!--文章區表頭-->
        <table class="articleAreaHead">
          <tr>
            <th style="width: 7%">編號</th>
            <th style="width: 75%">標題</th>
            <th style="width: 15%"></th>
          </tr>
        </table>
        <!--文章區內容-->
        <div style="overflow: auto">
          <table>
            <tr>
              <td style="width: 7%"></td>
              <td style="width: 75%"></td>
              <td style="width: 15%"></td>
            </tr>
            <tr>
              <td style="width: 7%"></td>
              <td style="width: 75%"></td>
              <td style="width: 15%"></td>
            </tr>
            <%
				while (rs.next()) {
			%>
            <tr>
              <td style="width: 7%">
              <%
						out.print(rs.getString(1));
			  %>
			  </td>
              <td style="width: 75%"><a href="searchArticle.jsp?searchArticle=<%out.print(rs.getString(1) + "&no=" + no);%>"><% out.print(rs.getString(2));%></a></td>
              <td style="width: 15%">
                <a href="update.jsp?searchArticle=<%out.print(rs.getString(1));%>"><button class="edit">編輯</button></a>
                <button class="del" onClick="delArticle(<%out.print(rs.getString(1));%>)">刪除</button>
              </td>
            </tr>
            <%
				}
			%>
          </table>
        </div>
        <!--新增文章按鈕-->
        <div class="addArticle">
          <button
            class="addArticleButton"
            onclick="window.location.href='newArticle.html'"
          >
            新增文章
          </button>
        </div>
        <%
			session.setAttribute("sn", no);
		%>
      </section>
    </main>
    <!--top button-->
    <button onclick="topFunction()" id="myBtn" title="Go to top">Top</button>
  </body>
  <script src="js/attractionsJs.js"></script>
</html>