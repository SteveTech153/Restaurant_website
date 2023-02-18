<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="style.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
</head>
<body>
	<%@page import="java.sql.*,java.util.*" %>
	<%Class.forName("com.mysql.jdbc.Driver");  
		Connection con=DriverManager.getConnection(  
		"jdbc:mysql://localhost:3306/demo_schema1","root","Steve07@mysql");  
	Statement stmt = con.createStatement(); 
	String sql = "SELECT *" +
            "FROM menu";
    	ResultSet rs = stmt.executeQuery(sql);
    	LinkedHashMap<String,Integer> hm = new LinkedHashMap<>();
    	while(rs.next()){
    	 hm.put(rs.getString("name"),rs.getInt("price"));
    }
    	List<String> names = new ArrayList<>();
    	for(Map.Entry<String,Integer> e : hm.entrySet()){
    		names.add(e.getKey());
    	}
	%>
     <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <a class="navbar-brand" href="admin.html">Home</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
              <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
              <ul class="navbar-nav">
                <li class="nav-item">
                  <a class="nav-link" href="additem.html">Add Item</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="edititem.jsp">Edit Item</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link " href="removeitem.jsp">Remove Item</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link " href="viewmenu.jsp">View Menu</a>
                </li>
              </ul>
            </div>
          </nav>
    <div class="container">
       <div class="result">
       		<% 
       		try{    
			//Statement stmt1 = con.createStatement();
			PreparedStatement stmt1;
			String[] indexes = request.getParameter("indexes").split(" "); //Integer.parseInt(request.getParameter("size"))
			//out.println(Arrays.toString(indexes));
			for(int i1=0;i1<indexes.length;i1++){
				 String sql1 = "DELETE FROM menu where name = ?";
				 PreparedStatement prest = con.prepareStatement(sql1);
				 prest.setString(1, names.get(Integer.parseInt(indexes[i1])-1));
				 prest.executeUpdate();
			}
			out.println("<h1 align=\"center\" style=\"padding-top:10%\">Item removed from Menu !</h1> ");
       		}
       		catch(Exception e){ }  
       		  
       		%>
       </div>
    </div>
		
</body>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js" integrity="sha384-mQ93GR66B00ZXjt0YO5KlohRA5SY2XofN4zfuZxLkoj1gXtW8ANNCe9d5Y3eG5eD" crossorigin="anonymous"></script>
</html>