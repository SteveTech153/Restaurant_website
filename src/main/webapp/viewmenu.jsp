<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="style.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
</head>
<body>
	<%@page import="java.sql.*,java.util.*" %>
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
	<%Class.forName("com.mysql.jdbc.Driver");  
		Connection con=DriverManager.getConnection(  
		"jdbc:mysql://localhost:3306/demo_schema1","root","Steve07@mysql");  
	Statement stmt = con.createStatement(); 
	String sql = "SELECT *" +
            "FROM menu";
    	ResultSet rs = stmt.executeQuery(sql);
    	HashMap<String,Integer> hm = new HashMap<>();
    	while(rs.next()){
    	 hm.put(rs.getString("name"),rs.getInt("price"));
    }
    	hm = sortByValue(hm);
    	List<String> names = new ArrayList<>(hm.keySet());
	
	
	%>
     <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <a class="navbar-brand" href="index.html">Home</a>
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
        <form action="edititem1.jsp">
            <table class="table">
			  <thead class="thead-dark">
			    <tr>
			      <th scope="col">S.No</th>
			      <th scope="col">Item Name</th>
			      <th scope="col">price</th>
			      
			    </tr>
			  </thead>
			  <tbody>
			    <%
			    	
			    	for(int i1=0;i1<hm.size();i1++){
			    		out.println("<tr><th scope=\"row\">"+(i1+1)+" </th>");
			    		out.println("<td>"+names.get(i1)+"</td>");
			    		out.println("<td>"+hm.get(names.get(i1))+"</td>");
			    	}
			    	out.println("<input type=\"hidden\" name=\"size\" value=\""+names.size()+"\"></tr>");
			    %>
			    
			
			  </tbody>
			</table>
        </form>
    </div>

</body>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js" integrity="sha384-mQ93GR66B00ZXjt0YO5KlohRA5SY2XofN4zfuZxLkoj1gXtW8ANNCe9d5Y3eG5eD" crossorigin="anonymous"></script>
</html>