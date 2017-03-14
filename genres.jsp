<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"
prefix="fn" %> 
<%@ page import="java.util.ArrayList,com.sam.user.servlets.Star,com.sam.user.servlets.Movie, com.sam.user.servlets.Genre"  %> 
<% ArrayList<Movie> movies = (ArrayList)request.getAttribute("movies"); 
String searchtext = (String)request.getAttribute("searchtext");
String year = (String) request.getAttribute("year");
String movie_director = (String) request.getAttribute("director");
String star_firstName = (String) request.getAttribute("starFirstName");
String star_lastName = (String) request.getAttribute("starLastName");
String limit = (String) request.getAttribute("limit");
String genre = (String) request.getAttribute("genre");
String title1 = (String) request.getAttribute("title1");
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
		
		<div class="w3-panel w3-red">
    		<h2 class="w3-text-shadow">List of Genres</h4>
  		</div>
		
		<div class="w3-row">
		 <div class="w3-col s4  w3-center">
		   	 
		   	 <ul class="inline">
		   	  	
		         <li> <a href="GenreServlet?genre=Action&sort=1">Action</a> </li>
		         <li> <a href="GenreServlet?genre=Adventure&sort=1">Adventure</a> </li>
		         <li> <a href="GenreServlet?genre=Animation&sort=1">Animation</a> </li>
		         <li> <a href="GenreServlet?genre=Biography&sort=1">Biography</a> </li>
		         <li> <a href="GenreServlet?genre=Comedy&sort=1">Comedy</a> </li>
		         <li> <a href="GenreServlet?genre=Crime&sort=1">Crime</a> </li>
		         <li> <a href="GenreServlet?genre=Documentary&sort=1">Documentary</a> </li>
		         <li> <a href="GenreServlet?genre=Drama&sort=1">Drama</a> </li>
   
		   	   </ul>
		  </div>
		  <div class="w3-col s4  w3-center">
		   	 
		   	 <ul class="inline">
		   	 	   <li> <a href="GenreServlet?genre=Family&sort=1" >Family</a> </li>
		   	 	   <li> <a href="GenreServlet?genre=Fantasy&sort=1">Fantasy</a> </li>
		           <li> <a href="GenreServlet?genre=Filmy-Noir&sort=1">Film-Noir</a> </li>
		           <li> <a href="GenreServlet?genre=History&sort=1">History</a> </li>
		           <li> <a href="GenreServlet?genre=Horror&sort=1">Horror</a> </li>
		           <li> <a href="GenreServlet?genre=Music&sort=1">Music</a> </li>
		           <li> <a href="GenreServlet?genre=Musical&sort=1">Musical</a> </li>
		           <li> <a href="GenreServlet?genre=Sci-Fi&sort=1">Mystery</a> </li>
		           
		    </ul>
	
		  <div class="w3-col s4  w3-center">
		   	 <ul class="inline">
		   	 	 <li> <a href="GenreServlet?genre=Romance&sort=1">Romance</a> </li>
		         <li> <a href="GenreServlet?genre=Sci-Fi&sort=1">Sci-Fi</a> </li>
		         <li> <a href="GenreServlet?genre=Sport&sort=1">Sport</a> </li>
		         <li> <a href="GenreServlet?genre=Thriller&sort=1">Thriller</a> </li>
		         <li> <a href="GenreServlet?genre=War&sort=1">War</a> </li>
		         <li> <a href="GenreServlet?genre=Western&sort=1">Western</a> </li>
			</ul>
		   	   
		  </div>

		  <br><a class="w3-btn w3-teal" href="checkOut.jsp">Check Out</a> <br><br><br></hr>
 
		</div>
				

</body>
</html>