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
String baseQuery = (String) request.getAttribute("baseQuery");
String test = (String) request.getAttribute("test");
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
	<link rel ="stylesheet" href="style.css">
	<link rel ="stylesheet" href="w3.css">
 
	<title> Fablix.com</title>
	 <link href="css/jquery-ui.css" rel="stylesheet">
 
    <script src="js/jquery-ui.js"></script>
    <script src="js/custom.js"></script>
  <style> 
  .ui-widget{
  	background-color:#800000;
  }</style>
  <script language="javascript" type="text/javascript">
  
  function showData(value) {
	  $.ajax({
	  url:"Auto",
	  type:"GET",
	  dataType : 'json',
	  
	  data:$("form").serialize(),
	  success:function(data){
	   $( "#tags" ).autocomplete({   
	       source: data 
	     });
	  
	  },error:  function(data, status, er){
	           console.log(data+"_"+status+"_"+er);
	       },
	        
	 });
	 
	}

//Browser Support Code
function ajaxFunction(mid){
	
	var ajaxRequest;  // The variable that makes Ajax possible!

	try{
		// Opera 8.0+, Firefox, Safari
		ajaxRequest = new XMLHttpRequest();
	} catch (e){
		// Internet Explorer Browsers
		try{
			ajaxRequest = new ActiveXObject("Msxml2.XMLHTTP");
		} catch (e) {
			try{
				ajaxRequest = new ActiveXObject("Microsoft.XMLHTTP");
			} catch (e){
				// Something went wrong
				alert("Your browser broke!");
				return false;
			}
		}
	}
	// Create a function that will receive data sent from the server
	
	// need to do AJAX GET REQUEST TO SERVLET
	ajaxRequest.open("GET", "/nweWar1/moviePopUp?MovieId=" + mid, true);
	ajaxRequest.send(null);
	ajaxRequest.onreadystatechange = function(){
		if(ajaxRequest.readyState == 4){
			
		
			$("#myModalContent").html(ajaxRequest.responseText);
			$("#myModal").modal();
			 
		}
	}

}

</script>
  
</head>
<body>

<div class="container">
<form class="navbar-form navbar-left" action="Search" method="get">
	<div class="row">
           <div id="custom-search-input">
                            <div class="input-group col-md-12">
                                <input type="text" id="tags" name="searchtext"  onkeyup="showData(this.value);" class=" ui-widget search-query form-control" placeholder="Search for movies" required />
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
			<li><a class="w3-hover-red w3-padding-16" href="login.jsp">Log Out</a></li>
			<li class="w3-dropdown-hover w3-hover-orange">
				<a class="w3-hover-blue" href="#"> Browse Movie  <i class="fa fa-caret-down"></i></a>
				<div class="w3-dropdown-content w3-white w3-card-4">
					<a href="genres.jsp">By Genre</a>
					<a href="titles.jsp">By Title</a>
				</div>
		  </li>
			
		</ul>
		
		<div class="w3-row w3-container">
  
  
		<div class="jumbotron">
		  <h1>Recommended Movies </h1>      
		 
		</div>
		
		<br><a class="w3-btn w3-teal" href="checkOut.jsp">Check Out</a> <br><br><br></hr>
		
	  		
		<div class="card" style="width: 40rem;">
			<img class="card-img-top" src="http://ia.imdb.com/media/imdb/01/I/25/16/28m.jpg" alt="No image found" style="width:20%"> 
			<div class="card-block">
				<br>
				<h4 class="card-text"> Title: <em> The Lord of the Rings: The Two Towers </em></h4><br>
				<h4 class="card-title"> Year: <em> 2002</em> </h4><br>
				
				
				<h4 class="card-title"> Director: <em> Peter Jackson</em></h4><br>
				<h4 class="card-title"> Movie id: <em> 634005</em></h4><br>
				<h4 class="card-title"> Stars: <em> 
					<a class="starLink" href="StarInfo?id=634003">Orlando Bloom</a> &nbsp; &nbsp;
					
					<a class="starLink" href="StarInfo?id=634004">Liv Tyler</a> &nbsp; &nbsp;
					
					<a class="starLink" href="StarInfo?id=634005">Hugo Weaving</a> &nbsp; &nbsp;
					
					<a class="starLink" href="StarInfo?id=634006">Viggo Mortensen</a> &nbsp; &nbsp;
					
					<a class="starLink" href="StarInfo?id=634007">Ian McKellen</a> &nbsp; &nbsp;
					
					<a class="starLink" href="StarInfo?id=634008">Elijah Wood</a> &nbsp; &nbsp;
					 </em></h4><br><br>
					
					
		<h4 class="card-title"> Genres: <em> 
  		 		
				  <a href="GenreServlet?genre=Action&sort=1" >Action</a> &nbsp; &nbsp;
				  	
				  <a href="GenreServlet?genre=Adventure&sort=1" >Adventure</a> &nbsp; &nbsp;
				  	
				  <a href="GenreServlet?genre=Fantasy&sort=1" >Fantasy</a> &nbsp; &nbsp;
				   </em></h4><br><br>
					<a href="ShoppingCartServlet?title=The Lord of the Rings: The Two Towers&year=2002" class="btn btn-success">  Add to Cart </a>
					<h4 class="card-title"> Price: &nbsp; &nbsp; $11.99 </h4>
					
				</div>
			</div>
			<br><br><hr>
			
				<div class="card" style="width: 40rem;">
			<img class="card-img-top" src="http://images.amazon.com/images/P/B00005LKHW.01.LZZZZZZZ.jpg" alt="No image found" style="width:20%"> 
			<div class="card-block">
				<br>
				<h4 class="card-text"> Title: <em> Barbershop </em></h4><br>
				<h4 class="card-title"> Year: <em> 2002</em> </h4><br>
				
				
				<h4 class="card-title"> Director: <em> Tim Story</em></h4><br>
				<h4 class="card-title"> Movie id: <em> 683008</em></h4><br>
				<h4 class="card-title"> Stars: <em> 
					<a class="starLink" href="StarInfo?id=872002">Ice Cube</a> &nbsp; &nbsp;
					 </em></h4><br><br>
					
					
		<h4 class="card-title"> Genres: <em> 
  		 		
				  <a href="GenreServlet?genre=Comedy&sort=1" >Comedy</a> &nbsp; &nbsp;
				   </em></h4><br><br>
					<a href="ShoppingCartServlet?title=Barbershop&year=2002" class="btn btn-success">  Add to Cart </a>
					<h4 class="card-title"> Price: &nbsp; &nbsp; $11.99 </h4>
					
				</div>
			</div>
			<br><br><hr>

			
			  
		
		<div class="card" style="width: 40rem;">
			<img class="card-img-top" src="http://images.amazon.com/images/P/B000065U1N.01.LZZZZZZZ.jpg" alt="No image found" style="width:20%"> 
			<div class="card-block">
				<br>
				<h4 class="card-text"> Title: <em> Black Hawk Down </em></h4><br>
				<h4 class="card-title"> Year: <em> 2002</em> </h4><br>
				
				
				<h4 class="card-title"> Director: <em> Ridley Scott</em></h4><br>
				<h4 class="card-title"> Movie id: <em> 683009</em></h4><br>
				<h4 class="card-title"> Stars: <em> 
					<a class="starLink" href="StarInfo?id=683010">Josh Hartnett</a> &nbsp; &nbsp;
					 </em></h4><br><br>
					
					
		<h4 class="card-title"> Genres: <em> 
  		 		
				  <a href="GenreServlet?genre=Action&sort=1" >Action</a> &nbsp; &nbsp;
				  	
				  <a href="GenreServlet?genre=Adventure&sort=1" >Adventure</a> &nbsp; &nbsp;
				  	
				  <a href="GenreServlet?genre=Drama&sort=1" >Drama</a> &nbsp; &nbsp;
				   </em></h4><br><br>
					<a href="ShoppingCartServlet?title=Black Hawk Down&year=2002" class="btn btn-success">  Add to Cart </a>
					<h4 class="card-title"> Price: &nbsp; &nbsp; $11.99 </h4>
					
				</div>
			</div>
			<br><br><hr>


</body>
</html>