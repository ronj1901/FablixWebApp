

<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"
prefix="fn" %> 
<%@ page import="java.util.ArrayList,java.util.HashMap, com.sam.user.servlets.Star,com.sam.user.servlets.Movie,com.sam.user.servlets.Genre,com.sam.user.servlets.ShoppingCart"  %>
 
<% 

String total = (String) request.getAttribute("total");
String numOfMovies = (String) request.getAttribute("numOfMovies");
HttpSession sessionn = request.getSession(true);
String username = (String) sessionn.getAttribute("uname"); 

if(username == null){
	request.setAttribute( "errorMessage","Please login first");
	request.getRequestDispatcher("login.jsp").forward(request, response);
}
%> 

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
  <link rel ="stylesheet" href="checkout.css">
  <script src="js/jquery-1.11.2.js"></script>
  <script src="js/jquery-ui.js"></script>
  <script src="js/custom.js"></script>
<title>Check Out</title>
</head>
<html>

<body>
	
	<div class="w3-container">
		<div class="alert alert-success">
	 	 <strong>Congratulations!</strong> You have successfully checked out.
		</div>
		
		<h1> Total Price: $<%= total  %></h1>
		<h1> Number of Movies Purchased : <%= numOfMovies  %></h1>
		<br><br><a class="w3-btn" href="index.jsp">Back to home</a>
		
	<div class="w3-container">	
	
</body>
</html>