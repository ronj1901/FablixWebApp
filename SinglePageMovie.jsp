<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"
prefix="fn" %> 
<%@ page import="java.util.ArrayList,com.sam.user.servlets.Star,com.sam.user.servlets.Movie,com.sam.user.servlets.Genre"  %> 
<% ArrayList<Movie> movies = (ArrayList)request.getAttribute("movies"); 
String searchtext = (String)request.getAttribute("searchtext");
String year = (String) request.getAttribute("year");
String movie_director = (String) request.getAttribute("director");
String star_firstName = (String) request.getAttribute("starFirstName");
String star_lastName = (String) request.getAttribute("starLastName");
Movie m = (Movie) request.getAttribute("movie");  // need to get info from
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

	    <br><br>
		<div class="w3-row ">
		
			<br><a class="w3-btn w3-teal" href="checkOut.jsp">Check Out</a> <br><br><br></hr>
			
		  <div class="w3-container w3-half-red">
			<h1>Movie Information</h1> <hr> <br>
			 <div class="w3-container w3-half">
		     <img class="card-img-top" src="<%= m.getBannerUrl() %>" alt="No image found" style="width:30%" /><br><br><br>
		  
		    <h4>Title :&nbsp; &nbsp; &nbsp;<a class="starLink" href="MovieInfo?MovieId=<%= m.getMovieID() %>"> <%= m.getTitle()%> </a> &nbsp; &nbsp;</h4><br><br>
		    <h4>Year : &nbsp; &nbsp; &nbsp; <%= m.getYear() %></h4> <br>
		    <h4> Director:&nbsp; &nbsp; &nbsp; <em> <%= m.getDirector() %></em></h4><br>
			<h4 > Movie id: &nbsp; &nbsp; &nbsp;<em> <%= m.getMovieID() %></em></h4><br>
				    
		    <h4> Stars:  &nbsp; &nbsp; &nbsp;	   

 	<%		
			ArrayList<Star> Stars= m.getStars(); 
 			ArrayList<Genre> genres =  m.getGenres();
			for (int j=0; j< Stars.size(); j++){
					Star S = Stars.get(j);
	%>
	           
				<a class="starLink" href="StarInfo?id=<%= S.getId() %>"><%= S.getFirst_name() %> <%= S.getLast_name()  %></a> &nbsp; &nbsp;
 			<%} %>
 			<br>
 			
		  
		  <h4 class="card-title"> Genres: &nbsp; &nbsp; &nbsp; <em> 
  		 	<%
					for (int k =0; k < genres.size() ; k++){ 
 					Genre g = genres.get(k); 
 			%>	
 			
		  <a href="GenreServlet?genre=<%= g.getName() %>&sort=1" ><%= g.getName() %></a> &nbsp; &nbsp;
		  <% } %> 
		  </em></h4><br><br>
		  <h4 class="card-title"> Trailer: &nbsp; &nbsp; <a href="<%= m.getTrailerUrl() %>">Click here </a> to watch the trailer.</h4><br>
		  <h4 class="card-title"> Price: &nbsp; &nbsp; $11.99 </h4><br>
		  <a href="ShoppingCartServlet?title=<%= m.getTitle() %>&year=<%= m.getYear() %>" class="btn btn-success">  Add to Cart </a> <br>
			
     
		 
	</div>

</body>