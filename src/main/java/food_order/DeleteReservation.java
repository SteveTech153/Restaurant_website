package food_order;


import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class DeleteReservation
 */
@WebServlet("/DeleteReservation")
public class DeleteReservation extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteReservation() {
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
		try {
			Class.forName("com.mysql.jdbc.Driver");  
			Connection con=DriverManager.getConnection(  
					"jdbc:mysql://localhost:3306/demo_schema1","root","Steve07@mysql");  
			Statement stmt = con.createStatement(); 
			String sql = "SELECT *" +
		            "FROM res_reservations";
		    ResultSet rs = stmt.executeQuery(sql);
		    int ind = Integer.parseInt(request.getParameter("ind")), index=1;
		    while(rs.next()) {
		    	if(ind==index) {
			    	String sql1 = "DELETE FROM res_reservations WHERE email=?";
			    	PreparedStatement psmt = con.prepareStatement(sql1);
			    	psmt.setString(1, rs.getString("email"));
			    	psmt.executeUpdate();
			    	break;
		    	}
		    	index++;
		    }
		    response.sendRedirect("viewReservations.jsp");
		}catch (Exception e) {
			// TODO: handle exception
		}
		doGet(request, response);
	}

}
