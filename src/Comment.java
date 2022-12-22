

import java.io.*;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mydata.CmtSql;
import mydata.Data;


@WebServlet("/doComment")
public class Comment extends HttpServlet {
	private Connection conn;
	private PreparedStatement sm;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		String getcomm = request.getParameter("comm");
		String no = request.getParameter("no");
		String locationName=request.getParameter("locationName");
	    response.setContentType("text/html;charset=utf-8");
	    PrintWriter out=response.getWriter();
	    
	    try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			//System.out.println("Driver is OK!");
		} catch (ClassNotFoundException e) {
			System.out.println("Driver is Not OK!");
		}
		try {
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/projectdb?"
					+ "serverTimezone=GMT&useSSL=false&" + "user=root&password=1234");
			sm = conn.prepareStatement("insert into projectdb.comments (content,name,ano) values (?,?,?)");
			sm.setString(1, getcomm);
			sm.setString(2, locationName);
			sm.setString(3, no);
			if(sm.executeUpdate()==1) {
				System.out.println("上傳成功");
			}else {
				System.out.println("上傳失敗");
			}
		} catch (SQLException e) {
			System.out.println("Connection is NOT OK");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
}
