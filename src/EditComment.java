

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class EditComment
 */
@WebServlet("/doEditComment")
public class EditComment extends HttpServlet {
	private Connection conn;
	private PreparedStatement sm;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		System.out.println();
		String getnumber = request.getParameter("number");
		String getcomm = request.getParameter("comm");
		System.out.println(getnumber);
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
			sm = conn.prepareStatement("Update projectdb.comments SET content=? WHERE no=?;");
			sm.setString(1, getcomm);
			sm.setString(2, getnumber);
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
