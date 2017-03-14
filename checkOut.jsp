

<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"
prefix="fn" %> 
<%@ page import="java.util.ArrayList,java.util.HashMap, com.sam.user.servlets.Star,com.sam.user.servlets.Movie,com.sam.user.servlets.Genre,com.sam.user.servlets.ShoppingCart"  %>
 
<% 

String errorMessage = (String) request.getAttribute("errorMessage");
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

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
  <link rel ="stylesheet" href="checkout.css">
<title>Check Out</title>
</head>
<html>

<body>
	<div id="bg">
	  <img src="http://img.skitch.com/20120905-fccfjyqxpxbkrhs6wct3xuyrjf.png" alt="">
	</div>
	<h1> Check Out</h1>
	<form action="CheckOut" method="POST">
	  <div class="title"> Customer Billing Information</div>
	  <input type="text"  name="cFirstName" placeholder="Enter First Name">
	  <input type="text" name="cLastName" placeholder="Enter Last Name">
	  <input type="text" name="cCardNumber" placeholder="Enter Credit Card number">
	  <input type="text" name="cExpireDate" placeholder="Expiry Date(yyyy/mm/dd)">
	  <input type="submit"  value="Checkout ">
	</form>
	<% 
	if(errorMessage != null){
		if(errorMessage.equals("Authorization Failed")){
	%>
		<div class="alert alert-danger">
		
		<h4><%= errorMessage %> Please make sure the credit card information is valid</h4> 
		</div>
	<%}
	}%>
</body>
</html>