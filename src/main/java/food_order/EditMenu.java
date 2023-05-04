package food_order;


import java.io.IOException;
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
 * Servlet implementation class EditMenu
 */
@WebServlet("/EditMenu")
public class EditMenu extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditMenu() {
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
			stmt1.executeUpdate("TRUNCATE res_menu");
			PreparedStatement stmt;
			Enumeration<String> parameterNames = request.getParameterNames();
			int size = 0;
			while(parameterNames.hasMoreElements()) {
				size++;
				parameterNames.nextElement();
			}
			size/=4;
	        for(int i=0;i<size;i++){
	        	String sql = "insert into res_menu"	
						+ " values (?,?,?,?)";
				stmt=con.prepareStatement(sql);
				if( !request.getParameter("itemname"+(i+1)).equals("") && request.getParameter("itemname"+(i+1))!=null) {
					stmt.setString(1, request.getParameter("itemname"+(i+1)) );   
					stmt.setString(2, request.getParameter("price"+(i+1)) );
					stmt.setString(3, request.getParameter("type"+(i+1)) );
					stmt.setString(4, request.getParameter("description"+(i+1)) );
					stmt.executeUpdate();
				}
	        }
	         response.sendRedirect("admin.html");
			
	   		}
	   		catch(Exception e){ }  
		doGet(request, response);
	}

}
