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
			<h1 id="heading"><strong>FABLIX &nbsp; </strong> </h1>
		</div>
		
		<div class="w3-panel w3-red">
    		<h2 class="w3-text-shadow">Browse By Title</h4>
  		</div>
		
		<div class="card-block">
		    <a href="TitleServlet?title1=0&sort=1" class="titleHyperlink">0</a>  | 
		    <a href="TitleServlet?title1=1&sort=1" class="titleHyperlink"> 1</a> | 
		    <a href="TitleServlet?title1=2&sort=1" class="titleHyperlink">2</a>  | 
		    <a href="TitleServlet?title1=3&sort=1" class="titleHyperlink"> 3</a> | 
		    <a href="TitleServlet?title1=4&sort=1" class="titleHyperlink">4</a>  | 
		    <a href="TitleServlet?title1=5&sort=1" class="titleHyperlink"> 5</a> | 
		    <a href="TitleServlet?title1=6&sort=1" class="titleHyperlink">6</a>  | 
		    <a href="TitleServlet?title1=7&sort=1" class="titleHyperlink">7</a>  | 
		    <a href="TitleServlet?title1=8&sort=1" class="titleHyperlink">8</a>  | 
		    <a href="TitleServlet?title1=9&sort=1" class="titleHyperlink">9</a>  | 
		    		
 	    </div>
 	    
 	    <div class="card-block">
		    <a href="TitleServlet?title1=A&sort=1" class="titleHyperlink">A</a>  | 
		    <a href="TitleServlet?title1=B&sort=1" class="titleHyperlink"> B</a> | 
		    <a href="TitleServlet?title1=C&sort=1" class="titleHyperlink">C</a>  | 
		    <a href="TitleServlet?title1=D&sort=1" class="titleHyperlink"> D</a> | 
		    <a href="TitleServlet?title1=E&sort=1" class="titleHyperlink">E</a>  | 
		    <a href="TitleServlet?title1=F&sort=1" class="titleHyperlink"> F</a> | 
		    <a href="TitleServlet?title1=G&sort=1" class="titleHyperlink">G</a>  | 
		    <a href="TitleServlet?title1=H&sort=1" class="titleHyperlink">H</a>  | 
		    <a href="TitleServlet?title1=I&sort=1" class="titleHyperlink">I</a>  | 
		    <a href="TitleServlet?title1=J&sort=1" class="titleHyperlink">J</a>  | 
		    		
 	    </div>
		
 	    
 	    <div class="card-block">
		    <a href="TitleServlet?title1=K&sort=1" class="titleHyperlink">k</a>  | 
		    <a href="TitleServlet?title1=L&sort=1" class="titleHyperlink"> L</a> | 
		    <a href="TitleServlet?title1=M&sort=1" class="titleHyperlink">M</a>  | 
		    <a href="TitleServlet?title1=N&sort=1" class="titleHyperlink"> N</a> | 
		    <a href="TitleServlet?title1=O&sort=1" class="titleHyperlink">0</a>  | 
		    <a href="TitleServlet?title1=P&sort=1" class="titleHyperlink"> P</a> | 
		    <a href="TitleServlet?title1=Q&sort=1" class="titleHyperlink">Q</a>  | 
		    <a href="TitleServlet?title1=R&sort=1" class="titleHyperlink">R</a>  | 
		    <a href="TitleServlet?title1=S&sort=1" class="titleHyperlink">S</a>  | 
		    <a href="TitleServlet?title1=T&sort=1" class="titleHyperlink">T</a>  | 
		    		
 	    </div>
 	     	    
 	    <div class="card-block">
		    <a href="TitleServlet?title1=U&sort=1" class="titleHyperlink">U</a>  | 
		    <a href="TitleServlet?title1=V&sort=1" class="titleHyperlink">V</a> | 
		    <a href="TitleServlet?title1=W&sort=1" class="titleHyperlink">W</a>  | 
		    <a href="TitleServlet?title1=X&sort=1" class="titleHyperlink">X</a> | 
		    <a href="TitleServlet?title1=Y&sort=1" class="titleHyperlink">Y</a>  | 
		    <a href="TitleServlet?title1=Z&sort=1" class="titleHyperlink"> Z</a> | 

		    		
 	    </div>		
 	    
 	    <br><br><a class="w3-btn w3-teal" href="checkOut.jsp">Check Out</a> <br><br><br></hr>	

</body>
</html>