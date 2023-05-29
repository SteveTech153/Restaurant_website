package food_order;


import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Reservation
 */
@WebServlet("/Reservation")
public class Reservation extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try{   
	   		Connection con= new ConnectionClass().getConnection();
			Statement stmt1 = con.createStatement();
			PreparedStatement stmt;
			PrintWriter out = response.getWriter();
			
	        	String sql = "insert into res_reservations"	
						+ " values (?,?,?,?,?)";
				stmt=con.prepareStatement(sql);
				stmt.setString(1, request.getParameter("name") );   
				stmt.setString(2, request.getParameter("email") );
				stmt.setString(3, request.getParameter("dateAndTime") );
				stmt.setString(4, request.getParameter("people") );
				stmt.setString(5, request.getParameter("specialRequest") );
				stmt.executeUpdate();
	    
	         response.sendRedirect("index.jsp");
			
	   		}
	   		catch(Exception e){ }  
		doGet(request, response);
	}

}
