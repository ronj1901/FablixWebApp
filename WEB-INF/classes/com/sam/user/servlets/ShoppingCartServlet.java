package com.sam.user.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class ShoppingCartServlet
 */
@WebServlet("/ShoppingCartServlet")
public class ShoppingCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset= UTF-8");
		
		String title = request.getParameter("title");
		String year = request.getParameter("year");
		
		//these variables are passed when we click button 
		
		HttpSession session = request.getSession();
		
		ShoppingCart currentShoppingCart =  (ShoppingCart) session.getAttribute("shoppingcart");   // return an object
		
		
		if(currentShoppingCart == null){
			currentShoppingCart = new ShoppingCart();
		}
		
		Movie m = new Movie();
		m.setTitle(title);
		
		
		m.setYear(Integer.parseInt(year));
		
		
		
		currentShoppingCart.addItem(m);

		

		// this is saving whatever shoppingcart object has
		
		session.setAttribute("shoppingcart", currentShoppingCart); 
		
	    response.sendRedirect("cart.jsp");  // redirect to cart.jsp
	    

	}
		
	


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
