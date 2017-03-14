package com.sam.user.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Enumeration;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class CreateUserServlet
 */
@WebServlet(urlPatterns = "/UpdateCartServlet")
public class UpdateCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset= UTF-8");
		
		String title = request.getParameter("title");
		String year = request.getParameter("year");
		Integer quantity = null;
		String quantitys = request.getParameter("quantity");
		if(quantitys == null){
			quantitys ="";
		}
		if(!quantitys.equals("")){
			quantity = Integer.parseInt(quantitys);
		}
		
		//these variables are passed when we click button 
		
		HttpSession session = request.getSession();
		
		ShoppingCart currentShoppingCart =  (ShoppingCart) session.getAttribute("shoppingcart");   // return an object
		
		
		if(currentShoppingCart != null && quantity != null){
			
			Movie m = new Movie();
			m.setTitle(title);
			m.setYear(Integer.parseInt(year));
//			if(quantity == null)
//				currentShoppingCart.changeQuantity(m, 1);
//			else{
				currentShoppingCart.changeQuantity(m, quantity);
			//}
		}
		
		

		session.setAttribute("shoppingcart", currentShoppingCart); 

		
		response.sendRedirect("cart.jsp");  // redirect to cart.jsp
	    

	}
		
	


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
