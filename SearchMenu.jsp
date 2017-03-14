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
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel ="stylesheet" href="w3.css">
<link rel ="stylesheet" href="style.css">

<title>Search menu</title>
</head>
<body>
  <div class="w3-container w3-black">
  <h2> Advanced Search Menu</h2>
</div>

<form class="w3-container" action="Search">
  <p>
  <label>Title</label>
  <input class="w3-input"  name= "searchtext" type="text"></p>
  <p>
  <label>Year</label>
  <input class="w3-input"  name="year" type="text"></p>
  <p>
  <label>Director</label>
  <input class="w3-input" name="director" type="text"></p>
  <p>
  <label>Star's first name</label>
  <input class="w3-input"  name="starFirstName"type="text"></p>
  <p>
  <label>Start's last name</label>
  <input class="w3-input"  name="starLastName" type="text"></p>
  
  <p>
    <button class="w3-btn w3-green" type="submit">Search</button>
     <a href="welcome.jsp" class="w3-btn w3-red">Back To Home</a> </p>
     
</form>
  
</body>
</html>