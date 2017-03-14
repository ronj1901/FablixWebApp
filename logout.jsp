<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"
prefix="fn" %> 
<%@ page import="java.util.ArrayList,com.sam.user.servlets.Star,com.sam.user.servlets.Movie,com.sam.user.servlets.Genre,com.sam.user.servlets.ShoppingCart"  %> 
<% 
HttpSession sessionn = request.getSession(true);
sessionn.invalidate();
request.getRequestDispatcher("login.jsp").forward(request, response);
%> 

	
</body>