<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>restaurant</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Favicon -->
    <link href="img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600&family=Nunito:wght@600;700;800&family=Pacifico&display=swap" rel="stylesheet">

    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="lib/animate/animate.min.css" rel="stylesheet">
    <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Customized Bootstrap Stylesheet -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="css/editstyle.css" rel="stylesheet">
</head>

<body>
	<%@page import="java.sql.*,java.util.*, food_order.*" %>

	<%
		Connection con = new ConnectionClass().getConnection();
		Statement stmt = con.createStatement(); 
		String sql = "SELECT *" +
	            "FROM res_reservations";
	    	ResultSet rs = stmt.executeQuery(sql);
	    		
    	
		
	
	%>
    <div class="container-xxl bg-white p-0" >
        <!-- Spinner Start -->
        <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
            <div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">
                <span class="sr-only">Loading...</span>
            </div>
        </div>
        <!-- Spinner End -->


        <!-- Navbar & Hero Start -->
        <div class="container-xxl position-relative p-0 ">
            <nav class="navbar navbar-expand-lg navbar-dark bg-dark px-4 px-lg-5 py-3 py-lg-0 mynav" >
                <a href="" class="navbar-brand p-0">
                    <h1 class="text-primary m-0"><i class="fa fa-utensils me-3"></i>Reservations</h1>
                    <!-- <img src="img/logo.png" alt="Logo"> -->
                </a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
                    <span class="fa fa-bars"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarCollapse">
                    <div class="navbar-nav ms-auto py-0 pe-4">
                        <a href="admin.html" class="nav-item nav-link ">Home</a>
                        <a href="editRestaurantInfo.jsp" class="nav-item nav-link ">Edit Restaurant Info</a>
                        <a href="editMenu.jsp" class="nav-item nav-link">Edit Menu</a>
                        <a href="viewOrders.jsp" class="nav-item nav-link">View Orders</a>
                        <a href="viewReservations.jsp" class="nav-item nav-link active">View Reservations</a>
                    
                    </div>
                </div>
            </nav>
				
        
        </div>
        <!-- Navbar & Hero End -->
        <div class="container1">
        <form action="DeleteReservation" method="post">
			<%
				int ind = 1;
				while(rs.next()){
					out.println("<div class=\"card\" style=\"width: 18rem;\">");
					out.println("<div class=\"card-header text-warning\">");
					out.println(rs.getString("date_and_time"));
					out.println("</div>");
					out.println("<ul class=\"list-group list-group-flush\">");
					out.println("<li class=\"list-group-item\">Name : "+rs.getString("name")+"</li>");
				    out.println("<li class=\"list-group-item\">Email : "+rs.getString("email")+"</li>");
				    out.println("<li class=\"list-group-item\">people : "+rs.getString("people")+"</li>");
				    out.println("<li class=\"list-group-item\">request : "+rs.getString("special_request")+"</li>");
				    out.println("</ul>");
				    out.println("<input type=\"hidden\" name=\"ind\" value=\""+ind+"\" >");
				    out.println("<button type=\"submit\" id=\"tick\"><img  src=\"img/check-mark.png\"></button>");
				  	out.println("</div>");
				  	ind++;
		    	}
				if(ind==1){
					out.println("<h2> No Reservations Yet !</h2>");
				}
			
			%>
	       </form>
			
          	
        </div>

        <!-- Back to Top -->
        <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
        
    </div>

    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="lib/wow/wow.min.js"></script>
    <script src="lib/easing/easing.min.js"></script>
    <script src="lib/waypoints/waypoints.min.js"></script>
    <script src="lib/counterup/counterup.min.js"></script>
    <script src="lib/owlcarousel/owl.carousel.min.js"></script>
    <script src="lib/tempusdominus/js/moment.min.js"></script>
    <script src="lib/tempusdominus/js/moment-timezone.min.js"></script>
    <script src="lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

    <!-- Template Javascript -->
    <script src="js/main.js"></script>
</body>

</html>