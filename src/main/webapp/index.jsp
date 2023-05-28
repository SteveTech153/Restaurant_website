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

    <!-- Customized Bootstrap Stylesheet -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="css/style.css" rel="stylesheet">
</head>

<body>
<%@page import="java.sql.*,java.util.*, food_order.*" %>
	<%! public static HashMap<String, Integer> sortByValue(HashMap<String, Integer> hm)
    {
        // Create a list from elements of HashMap
        List<Map.Entry<String, Integer> > list =
               new LinkedList<Map.Entry<String, Integer> >(hm.entrySet());
 
        // Sort the list
        Collections.sort(list, new Comparator<Map.Entry<String, Integer> >() {
            public int compare(Map.Entry<String, Integer> o1,
                               Map.Entry<String, Integer> o2)
            {
                return (o1.getValue()).compareTo(o2.getValue());
            }
        });
         
        // put data from sorted list to hashmap
        HashMap<String, Integer> temp = new LinkedHashMap<String, Integer>();
        for (Map.Entry<String, Integer> aa : list) {
            temp.put(aa.getKey(), aa.getValue());
        }
        return temp;
    } %>
	<%	
		Connection con = new ConnectionClass().getConnection();
		Statement stmt = con.createStatement(); 
		String sql = "SELECT *" +
            "FROM res_menu";
    	ResultSet rs = stmt.executeQuery(sql);
    	HashMap<String,Integer> breakfast = new HashMap<>();
    	HashMap<String,Integer> lunch = new HashMap<>();
    	HashMap<String,Integer> dinner = new HashMap<>();
    	HashMap<String,String> desc = new HashMap<>();
    	String itemname = "";
    	while(rs.next()){
    		if(rs.getString("type").equals("breakfast")){
    			itemname = rs.getString("itemname");
    			breakfast.put(itemname, rs.getInt("price"));
    			desc.put(itemname, rs.getString("description"));
    		}
    		if(rs.getString("type").equals("lunch")){
    			itemname = rs.getString("itemname");
    			lunch.put(itemname, rs.getInt("price"));
    			desc.put(itemname, rs.getString("description"));
    		}
    		if(rs.getString("type").equals("dinner")){
    			itemname = rs.getString("itemname");
    			dinner.put(itemname, rs.getInt("price"));
    			desc.put(itemname, rs.getString("description"));
    		}	
    	}	
    	breakfast = sortByValue(breakfast);
    	lunch = sortByValue(lunch);
    	dinner = sortByValue(dinner);
    	stmt = con.createStatement(); 
    	sql = "SELECT *" +
                "FROM res_info";
         rs = stmt.executeQuery(sql);
		HashMap<String, String> info = new HashMap<>();
		while(rs.next()){
			info.put(rs.getString("name"), rs.getString("value"));
		}
		session.setAttribute("name", info.get("restaurant_name"));
		
	
	%>
    <div class="container-xxl bg-white p-0">
        <!-- Spinner Start -->
        <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
            <div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">
                <span class="sr-only">Loading...</span>
            </div>
        </div>
        <!-- Spinner End -->


        <!-- Navbar & Hero Start -->
        <div class="container-xxl position-relative p-0">
            <nav class="navbar navbar-expand-lg navbar-dark bg-dark px-4 px-lg-5 py-3 py-lg-0">
                <a href="" class="navbar-brand p-0">
                    <h1 class="text-primary m-0"><i class="fa fa-utensils me-3"></i><%= info.get("restaurant_name") %></h1>
                    <!-- <img src="img/logo.png" alt="Logo"> -->
                </a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
                    <span class="fa fa-bars"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarCollapse">
                    <div class="navbar-nav ms-auto py-0 pe-4">
                        <a href="#about" class="nav-item nav-link">About</a>
                        <a href="#menu" class="nav-item nav-link">Menu</a>
                        <a href="#reservation" class="nav-item nav-link">Reserve a table</a>
						<a href="#testimonial" class="nav-item nav-link">Testimonials</a>
						                        
                    </div>
                </div>
            </nav>

            <div class="container-xxl py-5 bg-dark hero-header mb-5">
                <div class="container my-5 py-5">
                    <div class="row align-items-center g-5">
                        <div class="col-lg-6 text-center text-lg-start">
                            <h1 class="display-3 text-white animated slideInLeft"><%= info.get("slogan") %></h1>
                            <p class="text-white animated slideInLeft mb-4 pb-2"> <%= info.get("homepage_display_msg") %> </p>
                            <a href="#reservation" class="btn btn-primary py-sm-3 px-sm-5 me-3 animated slideInLeft">Book A Table</a>
                        </div>
                        <div class="col-lg-6 text-center text-lg-end overflow-hidden">
                            <img class="img-fluid" src="img/hero.png" alt="">
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Navbar & Hero End -->


        


        <!-- About Start -->
        <div class="container-xxl py-5" id="about">
            <div class="container">
                <div class="row g-5 align-items-center">
                    <div class="col-lg-6">
                        <div class="row g-3">
                            <div class="col-6 text-start">
                                <img class="img-fluid rounded w-100 wow zoomIn" data-wow-delay="0.1s" src="img/about-1.jpg">
                            </div>
                            <div class="col-6 text-start">
                                <img class="img-fluid rounded w-75 wow zoomIn" data-wow-delay="0.3s" src="img/about-2.jpg" style="margin-top: 25%;">
                            </div>
                            <div class="col-6 text-end">
                                <img class="img-fluid rounded w-75 wow zoomIn" data-wow-delay="0.5s" src="img/about-3.jpg">
                            </div>
                            <div class="col-6 text-end">
                                <img class="img-fluid rounded w-100 wow zoomIn" data-wow-delay="0.7s" src="img/about-4.jpg">
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <h5 class="section-title ff-secondary text-start text-primary fw-normal">About Us</h5>
                        <h1 class="mb-4">Welcome to <i class="fa fa-utensils text-primary me-2"></i>restaurant</h1>
                        <p class="mb-4"> <%= info.get("about_us") %> </p>
                        <p class="mb-4"></p>
                        <div class="row g-4 mb-4">
                            <div class="col-sm-6">
                                <div class="d-flex align-items-center border-start border-5 border-primary px-3">
                                    <h1 class="flex-shrink-0 display-5 text-primary mb-0" data-toggle="counter-up"> <%= info.get("experience") %> </h1>
                                    <div class="ps-4">
                                        <p class="mb-0">Years of</p>
                                        <h6 class="text-uppercase mb-0">Experience</h6>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="d-flex align-items-center border-start border-5 border-primary px-3">
                                    <h1 class="flex-shrink-0 display-5 text-primary mb-0" data-toggle="counter-up"> <%=info.get("chefs") %> </h1>
                                    <div class="ps-4">
                                        <p class="mb-0">Popular</p>
                                        <h6 class="text-uppercase mb-0">Master Chefs</h6>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <a class="btn btn-primary py-3 px-5 mt-2" href="">Read More</a>
                    </div>
                </div>
            </div>
        </div>
        <!-- About End -->


        <!-- Menu Start -->
        <div class="container-xxl py-5" id="menu">
            <div class="container">
                <div class="text-center wow fadeInUp" data-wow-delay="0.1s">
                    <h5 class="section-title ff-secondary text-center text-primary fw-normal">Food Menu</h5>
                    <h1 class="mb-5">Menu Items</h1>
                </div>
                <div class="tab-class text-center wow fadeInUp" data-wow-delay="0.1s">
                    <ul class="nav nav-pills d-inline-flex justify-content-center border-bottom mb-5">
                        <li class="nav-item">
                            <a class="d-flex align-items-center text-start mx-3 ms-0 pb-3 active" data-bs-toggle="pill" href="#tab-1">
                                <i class="fa fa-coffee fa-2x text-primary"></i>
                                <div class="ps-3">
                                    <small class="text-body">Popular</small>
                                    <h6 class="mt-n1 mb-0">Breakfast</h6>
                                </div>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="d-flex align-items-center text-start mx-3 pb-3" data-bs-toggle="pill" href="#tab-2">
                                <i class="fa fa-hamburger fa-2x text-primary"></i>
                                <div class="ps-3">
                                    <small class="text-body">Special</small>
                                    <h6 class="mt-n1 mb-0">Launch</h6>
                                </div>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="d-flex align-items-center text-start mx-3 me-0 pb-3" data-bs-toggle="pill" href="#tab-3">
                                <i class="fa fa-utensils fa-2x text-primary"></i>
                                <div class="ps-3">
                                    <small class="text-body">Lovely</small>
                                    <h6 class="mt-n1 mb-0">Dinner</h6>
                                </div>
                            </a>
                        </li>
                    </ul>
                    <div class="tab-content">
                        <div id="tab-1" class="tab-pane fade show p-0 active">
                            <div class="row g-4">
                            	<%for(Map.Entry<String,Integer> e : breakfast.entrySet()){
                            		out.print(" <div class=\"col-lg-6\"> ");
                            		out.print(" <div class=\"d-flex align-items-center\"> ");
                            		//out.print(" <img class=\"flex-shrink-0 img-fluid rounded\" src=\"img/menu-1.jpg\" alt=\"\" style=\"width: 80px;\"> ");
                                    out.print("   <div class=\"w-100 d-flex flex-column text-start ps-4\"> ");
                                    out.print("   <h4 class=\"d-flex justify-content-between border-bottom pb-2\"> ");
                                    out.print("   <span>"+ e.getKey() +"</span> ");
                                    out.print("   <span class=\"text-primary\"><i class=\"fa fa-inr\"></i>"+ e.getValue() +"</span> ");
		                            out.print("   </h4> ");
		                            out.print("   <div class=\"desc\"> ");
		                           	out.print("    <small class=\"fst-italic\">"+ desc.get(e.getKey()) +"</small> ");
		                            out.print("   </div> ");
		                            out.print("  </div> ");
		                            out.print(" </div> ");
		                            out.print(" </div> ");
		                            	} %>
                               
                            </div>
                        </div>
                        <div id="tab-2" class="tab-pane fade show p-0">
                            <div class="row g-4">
                               
                               <%for(Map.Entry<String,Integer> e : lunch.entrySet()){
                            		out.print(" <div class=\"col-lg-6\"> ");
                            		out.print(" <div class=\"d-flex align-items-center\"> ");
                            		//out.print(" <img class=\"flex-shrink-0 img-fluid rounded\" src=\"img/menu-1.jpg\" alt=\"\" style=\"width: 80px;\"> ");
                                    out.print("   <div class=\"w-100 d-flex flex-column text-start ps-4\"> ");
                                    out.print("   <h4 class=\"d-flex justify-content-between border-bottom pb-2\"> ");
                                    out.print("   <span>"+ e.getKey() +"</span> ");
                                    out.print("   <span class=\"text-primary\"><i class=\"fa fa-inr\"></i>"+ e.getValue() +"</span> ");
		                            out.print("   </h4> ");
		                            out.print("   <div class=\"desc\"> ");
		                           	out.print("    <small class=\"fst-italic\">"+ desc.get(e.getKey()) +"</small> ");
		                            out.print("   </div> ");
		                            out.print("  </div> ");
		                            out.print(" </div> ");
		                            out.print(" </div> ");
		                            	} %>
                               
                            </div>
                        </div>
                        <div id="tab-3" class="tab-pane fade show p-0">
                            <div class="row g-4">
                               
                                <%for(Map.Entry<String,Integer> e : dinner.entrySet()){
                            		out.print(" <div class=\"col-lg-6\"> ");
                            		out.print(" <div class=\"d-flex align-items-center\"> ");
                            		//out.print(" <img class=\"flex-shrink-0 img-fluid rounded\" src=\"img/menu-1.jpg\" alt=\"\" style=\"width: 80px;\"> ");
                                    out.print("   <div class=\"w-100 d-flex flex-column text-start ps-4\"> ");
                                    out.print("   <h4 class=\"d-flex justify-content-between border-bottom pb-2\"> ");
                                    out.print("   <span>"+ e.getKey() +"</span> ");
                                    out.print("   <span class=\"text-primary\"><i class=\"fa fa-inr\"></i>"+ e.getValue() +"</span> ");
		                            out.print("   </h4> ");
		                            out.print("   <div class=\"desc\"> ");
		                           	out.print("    <small class=\"fst-italic\">"+ desc.get(e.getKey()) +"</small> ");
		                            out.print("   </div> ");
		                            out.print("  </div> ");
		                            out.print(" </div> ");
		                            out.print(" </div> ");
		                            	} %>
                                
                            </div>
                        </div>
                    </div>
                </div>
            </div>	
        </div>
        <!-- Menu End -->


        <!-- Reservation Start -->
        <div class="container-xxl py-5 px-0 wow fadeInUp" data-wow-delay="0.1s" id="reservation">
            <div class="row g-0">
                <div class="col-md-6">
                    <div class="video">
                       
                    </div>
                </div>
                <div class="col-md-6 bg-dark d-flex align-items-center">
                    <div class="p-5 wow fadeInUp" data-wow-delay="0.2s">
                        <h5 class="section-title ff-secondary text-start text-primary fw-normal">Reservation</h5>
                        <h1 class="text-white mb-4">Book A Table Online</h1>
                        <form action="Reservation" method="post">
                            <div class="row g-3">
                                <div class="col-md-6">
                                    <div class="form-floating">
                                        <input type="text" class="form-control" id="name" name="name" placeholder="Your Name">
                                        <label for="name">Your Name</label>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-floating">
                                        <input type="email" class="form-control" id="email" name="email" placeholder="Your Email">
                                        <label for="email">Your Email</label>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-floating date" id="date3" data-target-input="nearest">
                                        <input type="text" class="form-control datetimepicker-input" name="dateAndTime" id="datetime" placeholder="Date & Time" data-target="#date3" data-toggle="datetimepicker" />
                                        <label for="datetime">Date & Time</label>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-floating">
                                        <select class="form-select" id="select1" name="people">
                                          <option value="1">People 1</option>
                                          <option value="2">People 2</option>
                                          <option value="3">People 3</option>
                                        </select>
                                        <label for="select1">No Of People</label>
                                      </div>
                                </div>
                                <div class="col-12">
                                    <div class="form-floating">
                                        <textarea class="form-control" name="specialRequest" placeholder="Special Request" id="message" style="height: 100px"></textarea>
                                        <label for="message">Special Request</label>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <button class="btn btn-primary w-100 py-3" type="submit">Book Now</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <div class="modal fade" id="videoModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content rounded-0">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Youtube Video</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <!-- 16:9 aspect ratio -->
                        <div class="ratio ratio-16x9">
                            <iframe class="embed-responsive-item" src="" id="video" allowfullscreen allowscriptaccess="always"
                                allow="autoplay"></iframe>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Reservation Start -->



        <!-- Testimonial Start -->
        <div class="container-xxl py-5 wow fadeInUp" data-wow-delay="0.1s" id="testimonial">
            <div class="container">
                <div class="text-center">
                    <h5 class="section-title ff-secondary text-center text-primary fw-normal">Testimonial</h5>
                    <h1 class="mb-5">Our Clients Say!!!</h1>
                </div>
                <div class="owl-carousel testimonial-carousel">
                    <div class="testimonial-item bg-transparent border rounded p-4">
                        <i class="fa fa-quote-left fa-2x text-primary mb-3"></i>
                        <p> <%= info.get("testimonial1") %> </p>
                        <div class="d-flex align-items-center">
                            
                        </div>
                    </div>
                    <div class="testimonial-item bg-transparent border rounded p-4">
                        <i class="fa fa-quote-left fa-2x text-primary mb-3"></i>
                        <p> <%= info.get("testimonial2") %> </p>
                        <div class="d-flex align-items-center">
                            
                        </div>
                    </div>
                    <div class="testimonial-item bg-transparent border rounded p-4">
                        <i class="fa fa-quote-left fa-2x text-primary mb-3"></i>
                        <p> <%= info.get("testimonial3") %> </p>
                        <div class="d-flex align-items-center">
                            
                        </div>
                    </div>
                    <div class="testimonial-item bg-transparent border rounded p-4">
                        <i class="fa fa-quote-left fa-2x text-primary mb-3"></i>
                        <p> <%= info.get("testimonial4") %> </p>
                        <div class="d-flex align-items-center">
                           	
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Testimonial End -->
        

        <!-- Footer Start -->
       
        <!-- Footer End -->


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