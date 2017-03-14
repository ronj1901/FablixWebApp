package com.sam.user.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



@WebServlet("/Login")
public class Login extends HttpServlet {


	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		 PrintWriter out = response.getWriter();

		String gRecaptchaResponse = request.getParameter("g-recaptcha-response");
		System.out.println("gRecaptchaResponse=" + gRecaptchaResponse);
		//boolean valid = VerifyUtils.verify(gRecaptchaResponse);
		
		
		response.setContentType("text/html; charset= UTF-8");
		//request.setAttribute("valid", valid);
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection connection = DriverManager.getConnection("jdbc:mysql://localhost/moviedb", "mytestuser", "mypassword" );
			Statement statement = connection.createStatement();
			String uname = request.getParameter("uname");
			String pass = request.getParameter("pass");
			
			ResultSet resultSet = statement.executeQuery("SELECT * from customers where email = '" + uname + "' AND password = '" + pass + "'");
			
		
            
			if(  !resultSet.next() || (uname.equals("") || pass.equals(""))  ){
				request.setAttribute("loginError", "Sorry your password or email did not match our records");
				response.sendRedirect("login.jsp");
				
			}
			else{
				do{	
					HttpSession session = request.getSession(true);
					session.setAttribute( "uname",resultSet.getString(6));
					session.setAttribute("shoppingcart", new ShoppingCart());
		      		response.sendRedirect("welcome.jsp");  
						
				} while(resultSet.next());
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
