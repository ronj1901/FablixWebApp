<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"
prefix="fn" %> 
<%@ page import="java.util.ArrayList,java.util.HashMap, com.sam.user.servlets.Star,com.sam.user.servlets.Movie,com.sam.user.servlets.Genre,com.sam.user.servlets.ShoppingCart"  %>
 
<% 
Integer total = 0;
HttpSession sessionn = request.getSession(true);

ShoppingCart currentShoppingCart = (ShoppingCart) session.getAttribute("shoppingcart");
HashMap<Movie, Integer> items = null;

if(currentShoppingCart != null){
	items = currentShoppingCart.getItems();
}
String username = (String) sessionn.getAttribute("uname"); 
if(username == null){
	request.setAttribute( "errorMessage","Please login first");
	request.getRequestDispatcher("login.jsp").forward(request, response);
}
%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel ="stylesheet" href="style.css">
	<link rel ="stylesheet" href="w3.css">
	<script src="js/jquery-1.11.2.js"></script>
    <script src="js/jquery-ui.js"></script>
    <script src="js/custom.js"></script>
	<title> Fablix.com</title>
	
</head>
<body>
	<div class="container">
	<!-- Navigation Panel-->
	<form class="navbar-form navbar-left" action="Search" method="get">
	<div class="row">
           <div id="custom-search-input">
                            <div class="input-group col-md-12">
                                <input type="text" id="tags" name="searchtext" class=" ui-widget search-query form-control" placeholder="Search for movies" required />
                                <span class="input-group-btn">
                                    <button class="btn btn-danger" type="submit">
                                        <span class=" glyphicon glyphicon-search"></span>
                                    </button>
                                </span>
                            </div>
                        </div>
	</div>
</form>
	
		<!-- Closing Navigation Panel -->
		<div class="page-header heading">
			<img src="http://www.iardm.com/assets/video-gallery.png" height ="100"  width ="100" style="float:right" />
			<h1 id="heading"><strong>FABLIX &nbsp; </strong> </h1>
		</div>
		
		<ul class="w3-navbar  w3-black">
			<li><a class="w3-hover-red w3-padding-16" href="index.jsp">Home</a></li>
			<li><a class="w3-hover-red w3-padding-16" href="SearchMenu.jsp">Advanced Search</a></li>
			<li><a class="w3-hover-red w3-padding-16" href="cart.jsp">My Cart</a></li>
			<li><a class="w3-hover-red w3-padding-16" href="logout.jsp">Log Out</a></li>
			<li class="w3-dropdown-hover w3-hover-orange">
				<a class="w3-hover-blue" href="#"> Browse Movie  <i class="fa fa-caret-down"></i></a>
				<div class="w3-dropdown-content w3-white w3-card-4">
					<a href="genres.jsp">By Genre</a>
					<a href="titles.jsp">By Title</a>
				</div>
			</li>
		</ul>
	</div>
	
	
	<!-- Main Body  -->
	
<div class="w3-container"> 
		
	<!-- shopping cart Table --> 
	<h1 w3-pink> Your Cart </h1> < hr>
	<hr>
	
	<table class="w3-table-all">
	    <thead>
	      
	    </thead>
    
	<% 
	
		if(items != null){
			if(items.size() > 0){
				for (Movie key : items.keySet()) {
		  			String title = key.getTitle();
		  			int year = key.getYear();
			    	Integer quantity =  items.get(key);  
					total  += quantity;
		
			
				
	%>
		<tr>
      		<td> <%= title %>(<%=year %>)</td>
      		<td> <a href="#">
          			<span class="glyphicon glyphicon-refresh"></span>
       			 </a> 
       			 <input  maxlength="2" size="2" type="text" value="<%= quantity %>" id="quantity"  onChange = "var quantity = document.getElementById('quantity').value; document.location.href='UpdateCartServlet?title=<%= title %>&year=<%=year %>&quantity='+ quantity;" > </td>
      		
      		<td>
      			
      			<a href="UpdateCartServlet?title=<%= title %>&year=<%=year %>&quantity=0"> <span class="glyphicon glyphicon-trash"></span> </a> 
       		</td>
      	</tr>

		
	<%}
  } else{
		
	 %>
	 	<H2> No Shopping cart items </h2>
	<% } } else{
		
	%>
	  <h2> No Shopping cart items </h2>
	<% }

%> 
	
	
	</table>
	<br><br>
	 <h1> Total $ <%=  12 * total %> </h1>	
	
	<% if(items != null && items.size() >0){
		
	 %>
		<a class="w3-btn w3-teal" href="checkOut.jsp">Check Out Now</a> <br>
	<%} %>
	<br>
<div class="w3-container"> 


</body>