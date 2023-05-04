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
 * Servlet implementation class EditDetails
 */
@WebServlet("/EditDetails")
public class EditDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditDetails() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	
   		try{  
   		Class.forName("com.mysql.jdbc.Driver");  
   		Connection con=DriverManager.getConnection(  
   		"jdbc:mysql://localhost:3306/demo_schema1","root","Steve07@mysql");  
		Statement stmt1 = con.createStatement();
		 
		stmt1.executeUpdate("TRUNCATE res_info");
		PreparedStatement stmt;
		Enumeration<String> parameterNames = request.getParameterNames();
        while (parameterNames.hasMoreElements()) {
        	String paramName = parameterNames.nextElement();
        	String sql = "insert into res_info "	
					+ " values (?,?)";
			stmt=con.prepareStatement(sql);
			stmt.setString(1, paramName );   
			stmt.setString(2, request.getParameter( paramName ));
			stmt.executeUpdate();
        }
         response.sendRedirect("admin.html");
		
   		}
   		catch(Exception e){ }  
   		  
   	
		doGet(request, response);
	}

}
