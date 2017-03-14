<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"
prefix="fn" %> 
<%@ page import="java.util.ArrayList,com.sam.user.servlets.Star,com.sam.user.servlets.Movie, com.sam.user.servlets.Genre"  %> 
<% 
String loginError = (String) request.getAttribute("loginError");
 String username = (String) request.getAttribute("uname"); 
 String errorMessage =  (String) request.getAttribute("errorMessage");

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
  <link rel ="stylesheet" href="style.css">
<title>Login</title>
</head>
<body>

<div class="container">
<!-- Navigation Panel-->

<!-- Closing Navigation Panel -->
	  <div class="page-header heading">
	  <img src="http://www.iardm.com/assets/video-gallery.png" height ="100"  width ="100" style="float:right" />
  	  </div>
  	  <br>
  	  
  	  <% 
  	  if(errorMessage != null){
  	  	
  	  %>
  	  <div class="alert alert-danger">
  		  <strong><%= errorMessage %></strong>
	  </div>
  	  
  	  
  	  <%} %>

</div>
     <section class="container1">
    <form class="form-wrapper" action="Login" method="POST" >
      <h1> Sign in </h1> <br><br><br>
      <input type="email" placeholder="Email"  name="uname"  required />
      <input type="password" placeholder="Password" name="pass"  required/>
      <input type="submit" value="Login" class="btn-login"/>
           <a href="#">  Click here to register </a> <br> <br>
        <p> All rights reserved. &copy </p> <br> <br> 


	  <div class="alert alert-danger">
    	<strong>Login Error</strong> the email or password is incorrect.
  	  </div>

    </form>
  </section>
   
   
</body>
</html>