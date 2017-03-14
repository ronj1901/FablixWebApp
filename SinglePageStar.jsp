<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"
prefix="fn" %> 
<%@ page import="java.util.ArrayList,com.sam.user.servlets.Star,com.sam.user.servlets.Movie"  %> 
<% ArrayList<Movie> movies = (ArrayList)request.getAttribute("movies"); 
String searchtext = (String)request.getAttribute("searchtext");
String year = (String) request.getAttribute("year");
String movie_director = (String) request.getAttribute("director");
String star_firstName = (String) request.getAttribute("starFirstName");
String star_lastName = (String) request.getAttribute("starLastName");
Star s = (Star) request.getAttribute("star");  // need to get info from
HttpSession sessionn = request.getSession(true);
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
			<h1 id="heading"><strong>FABLIX &nbsp </strong> </h1>
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
	    <!-- Star inforamation -->
	    
	  <!-- Star inforamation -->
	    
	    <br><br>
		<div class="w3-row ">
		
		
		<br><a class="w3-btn w3-teal" href="checkOut.jsp">Check Out</a> <br><br><br></hr>
			
			
			
		  <div class="w3-container w3-half-red">
			<h1>Star Information</h1> <hr> <br>
		    <h4>Star Name: &nbsp; &nbsp; <a class="starLink" href="StarInfo?id=<%= s.getId() %>"><%= s.getFirst_name() %> <%= s.getLast_name()  %></a> &nbsp; &nbsp;<br>
		    <h4>Date of Birth: &nbsp; &nbsp; <%= s.getDob() %></h4> <br>
		    <h4>Star id : &nbsp; &nbsp; &nbsp; &nbsp;  <%= s.getId() %> </h4><br>		    
		    <h4>Starred in:  &nbsp; &nbsp; &nbsp;	   

	<%
			ArrayList<Movie> Movies= s.getMovies(); 
			for (int j=0; j< Movies.size(); j++){
					Movie M = Movies.get(j);
	%>
			<a class="starLink" href="MovieInfo?MovieId=<%= M.getMovieID() %>"> <%= M.getTitle()%> </a> &nbsp; &nbsp;</h4>
 			<%} %>
 			<br>
		  </div>

		  <div class="w3-container w3-half">
		     <img class="card-img-top" src="<%= s.getPhoto_url()%>" alt="No image found" style="width:30%" />
		  </div>
	</div>

</body>
</html>