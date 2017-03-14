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
  .ui-widget{background-color:#800000;}</style>
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
			<li><a class="w3-hover-red w3-padding-16" href="logout.jsp">Log Out</a></li>
			<li class="w3-dropdown-hover w3-hover-orange">
				<a class="w3-hover-blue" href="#"> Browse Movie  <i class="fa fa-caret-down"></i></a>
				<div class="w3-dropdown-content w3-white w3-card-4">
					<a href="genres.jsp">By Genre</a>
					<a href="titles.jsp">By Title</a>
				</div>
		  </li>
		 

			<li class="w3-dropdown-hover w3-hover-orange">
				<a class="w3-hover-blue" href="#"> Results per page  <i class="fa fa-caret-down"></i></a>
				 
				<div class="w3-dropdown-content w3-white w3-card-4">
					<a href="Search?sort=1&genre=<%= genre %>&title1=<%= title1 %>&limit=5&searchtext=<%= searchtext %>&year=<%= year %>&director=<%= movie_director %>&starFirstName=<%= star_firstName %>&starLastName=<%= star_lastName %>"&limit=10>5</a>
					<a href="Search?sort=1&genre=<%= genre %>&title1=<%= title1 %>&limit=10&searchtext=<%= searchtext %>&year=<%= year %>&director=<%= movie_director %>&starFirstName=<%= star_firstName %>&starLastName=<%= star_lastName %>&limit=10">10</a>
					<a href="Search?sort=1&genre=<%= genre %>&title1=<%= title1 %>&limit=20&searchtext=<%= searchtext %>&year=<%= year %>&director=<%= movie_director %>&starFirstName=<%= star_firstName %>&starLastName=<%= star_lastName %>&limit=20">20</a>
				</div>
			</li>
		</ul>
		
		<% if(username != null){ 
		
		%>
			 <h4> Welcome ! &nbsp; &nbsp;<em><%= username %></em></h4>	 
	 	<%} %>
		
				
		<table>
			<% if(movies != null){
				if(movies.size() == 0 ){
			%>
				<div class="alert alert-info">
				  <strong>Oops!</strong> Movies not found.
				</div>
			<%
				}else {
		%>
				<!-- SORT BY  -->
			<h3>SORT BY &nbsp; </h3> 
			
			
			<a class="w3-hover-red w3-green"  href="Search?genre=<%= genre %>&title1=<%= title1 %>&sort=1&searchtext=<%= searchtext %>&year=<%= year %>&director=<%= movie_director %>&starFirstName=<%= star_firstName %>&starLastName=<%= star_lastName %>"> +Title</a> &nbsp;
			<a class="w3-hover-red  w3-blue" href="Search?genre=<%= genre %>&title1=<%= title1 %>&sort=2&searchtext=<%= searchtext %>&year=<%= year %>&director=<%= movie_director %>&starFirstName=<%= star_firstName %>&starLastName=<%= star_lastName %>">-Title </a> &nbsp;
			<a class="w3-hover-red w3-green" href="Search?genre=<%= genre %>&title1=<%= title1 %>&sort=3&searchtext=<%= searchtext %>&year=<%= year %>&director=<%= movie_director %>&starFirstName=<%= star_firstName %>&starLastName=<%= star_lastName %>">+Year </a>  &nbsp;
			<a  class="w3-hover-red w3-blue" href="Search?genre=<%= genre %>&title1=<%= title1 %>&sort=4&searchtext=<%= searchtext %>&year=<%= year %>&director=<%= movie_director %>&starFirstName=<%= star_firstName %>&starLastName=<%= star_lastName %>">-Year </a> &nbsp;
			<br> <br> <br>
			<a class="w3-btn w3-teal" href="checkOut.jsp">Check Out</a> <br><br><br></hr>
			
			</div align="right">
			<%--For displaying Previous link except for the 1st page --%>
			
    		<c:if test="${currentPage != 1}">
    			<c:if test="${limit == 5}">
        			<td><a href="Search?sort=1&genre=<%= genre %>&title1=<%= title1 %>&limit=5&searchtext=<%= searchtext %>&year=<%= year %>&director=<%= movie_director %>&starFirstName=<%= star_firstName %>&starLastName=<%= star_lastName%>&page=${currentPage - 1}"><button class="w3-btn w3-ripple w3-red">Previous</button></a></td>
   	 			</c:if>
   	 			<c:if test="${limit == 10}">
        			<td><a href="Search?sort=1&genre=<%= genre %>&title1=<%= title1 %>&limit=10&searchtext=<%= searchtext %>&year=<%= year %>&director=<%= movie_director %>&starFirstName=<%= star_firstName %>&starLastName=<%= star_lastName%>&page=${currentPage - 1}"><button class="w3-btn w3-ripple w3-red">Previous</button></a></td>
   	 			</c:if>
   	 			<c:if test="${limit == 20}">
        			<td><a href="Search?sort=1&genre=<%= genre %>&title1=<%= title1 %>&limit=20&searchtext=<%= searchtext %>&year=<%= year %>&director=<%= movie_director %>&starFirstName=<%= star_firstName %>&starLastName=<%= star_lastName%>&page=${currentPage - 1}"><button class="w3-btn w3-ripple w3-red">Previous</button></a></td>
   	 			</c:if>
 			</c:if>

     
    		<%--For displaying Next link --%>
    		<c:if test="${currentPage < noOfPages}">
    		    <c:if test="${limit == 5}">
        				<td><a href="Search?sort=1&genre=<%= genre %>&title1=<%= title1 %>&limit=5&searchtext=<%= searchtext %>&year=<%= year %>&director=<%= movie_director %>&starFirstName=<%= star_firstName %>&starLastName=<%= star_lastName%>&page=${currentPage + 1}"><button class="w3-btn w3-ripple w3-teal">Next</button></a></td>
    			</c:if>
    			<c:if test="${limit == 10}">
        				<td><a href="Search?sort=1&genre=<%= genre %>&title1=<%= title1 %>&limit=10&searchtext=<%= searchtext %>&year=<%= year %>&director=<%= movie_director %>&starFirstName=<%= star_firstName %>&starLastName=<%= star_lastName%>&page=${currentPage + 1}"><button class="w3-btn w3-ripple w3-purple">Next</button></a></td>
    			</c:if>
    			<c:if test="${limit == 20}">
        				<td><a href="Search?sort=1&genre=<%= genre %>&title1=<%= title1 %>&limit=20&searchtext=<%= searchtext %>&year=<%= year %>&director=<%= movie_director %>&starFirstName=<%= star_firstName %>&starLastName=<%= star_lastName%>&page=${currentPage + 1}"><button class="w3-btn w3-ripple w3-teal">Next</button></a></td>
    			</c:if>
    		</c:if>
			
		
		<% for (int i=0; i< movies.size(); i++)
		{
		Movie m = movies.get(i);
		ArrayList<Star> stars = m.getStars(); 
		ArrayList<Genre> genres =  m.getGenres();
		%>  
		
		<div  style="width: 40rem;">
			<img class="card-img-top" src="<%= m.getBannerUrl() %>" alt="No image found" style="width:20%"> 
			<div class="card-block">
				<br>
				<h4 class="card-text" > Title: 
				<a class="starLink"  href="MovieInfo?MovieId=<%= m.getMovieID() %>"  onmouseover="ajaxFunction(<%= m.getMovieID() %>);" data-placement="right" title="Title: <%= m.getTitle()%>&#013;Year: <%= m.getYear() %>" > <%= m.getTitle()%></a> &nbsp; &nbsp;</h4><br>
			<div class="modal fade" id="myModal" role="dialog">
			          <div class="modal-dialog">
    
				     
				      	<div class="modal-content" id="myModalContent">
				      			        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>

				      	</div>
				     </div>
			</div>
				<h4> Year: <em> <%= m.getYear() %></em> </h4><br>
				<h4 class="card-title"> Director: <em> <%= m.getDirector() %></em></h4><br>
				<h4 class="card-title"> Movie id: <em> <%= m.getMovieID() %></em></h4><br>
				<h4 class="card-title"> Stars: <em> <% 
					for (int j=0; j< stars.size(); j++){
					Star s = stars.get(j);
					%>
					<a class="starLink" href="StarInfo?id=<%= s.getId() %>"><%= s.getFirst_name() %> <%= s.getLast_name()  %></a> &nbsp; &nbsp;
					<% } %> </em></h4><br><br>
					
				<!--<div id="movieTitle">foo means foo</div>
				-->
		<h4 class="card-title"> Genres: <em> 
  		 	<%
					for (int k =0; k < genres.size() ; k++){ 
 					Genre g = genres.get(k); 
 			%>	
				  <a href="GenreServlet?genre=<%= g.getName() %>&sort=1" ><%= g.getName() %></a> &nbsp; &nbsp;
				  <% } %> </em></h4><br><br>
					
					<h4 class="card-title"> Price: &nbsp; &nbsp; $11.99 </h4><br>
					<a href="ShoppingCartServlet?title=<%= m.getTitle() %>&year=<%= m.getYear() %>" class="btn btn-success">  Add to Cart </a>
	
				</div>
			</div>
			<br><br><hr>
			
			<% }
		}
	} 
	%>
	
</table>




</body>
</html>