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

@WebServlet("/CheckOut")
public class CheckOut extends HttpServlet {


	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		
		response.setContentType("text/html; charset= UTF-8");
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection connection = DriverManager.getConnection("jdbc:mysql://localhost/moviedb", "mytestuser", "mypassword" );
			Statement statement = connection.createStatement();
			
			String cFirstName =  request.getParameter("cFirstName");
			String  cLastName =  request.getParameter("cLastName");
			String cCardNumber =  request.getParameter("cCardNumber");
			String cExpireDate =  request.getParameter("cExpireDate");
			
			ResultSet resultSet = statement.executeQuery("SELECT * from  creditcards where id = '" + cCardNumber + "' AND first_name = '" + cFirstName  +  "' AND last_name  = '"  + cLastName + "'  AND expiration  = '"  + cExpireDate + "'");
			
			
           
			if( !resultSet.next() ){
				 request.setAttribute("errorMessage", "Authorization Failed"); 
				request.getRequestDispatcher("checkOut.jsp").forward(request, response);

			}
			else{
				//calculate how many movies  
				
			
					HttpSession session = request.getSession(true);
					ShoppingCart sc = (ShoppingCart) session.getAttribute("shoppingcart");
					Integer numOfMovies   = 0;
					HashMap<Movie,Integer> items = sc.getItems();
					for (Movie key : items.keySet()) {
				  		
					    Integer quantity =  items.get(key);  
						numOfMovies += quantity;
					}
					sc.remove_all();
					String total =  Double.toString( 11.99 * numOfMovies);
					
				    request.setAttribute("numOfMovies", Integer.toString(numOfMovies));
				    request.setAttribute("total", total);
				    request.getRequestDispatcher("success.jsp").forward(request, response);
		    }
		  resultSet.close();
		  statement.close();
		  connection.close();
			
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
