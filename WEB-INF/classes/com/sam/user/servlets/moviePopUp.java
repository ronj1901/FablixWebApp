package com.sam.user.servlets;

import java.io.IOException;
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

/**
 * Servlet implementation class moviePopUp
 */
@WebServlet("/moviePopUp")
public class moviePopUp extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		response.setContentType("text/html; charset= UTF-8");

		try {
			Class.forName("com.mysql.jdbc.Driver");
//			Connection connection = DriverManager.getConnection("jdbc:mysql://localhost/moviedb", "root", "Uber4rch3rs" );
			Connection connection = DriverManager.getConnection("jdbc:mysql://localhost/moviedb", "mytestuser", "mypassword" );

			Statement statement = connection.createStatement();
			
			int MovieId = Integer.parseInt(request.getParameter("MovieId"));  
			Movie m = new Movie();
			m.setMovieID(MovieId);
			m.setListofStars();
			m.setListofGenres();
			
			ResultSet resultSet = statement.executeQuery("SELECT title, year, director, banner_url, trailer_url from movies where id=" + MovieId);
			if(resultSet.next()){
				m.setTitle(resultSet.getString(1));
				m.setYear(resultSet.getInt(2));
				m.setDirector(resultSet.getString(3));	
				m.setBannerUrl(resultSet.getString(4));
				m.setTrailerUrl(resultSet.getString(5));
				//m.setListofStars();
	
			}
			resultSet.close();
			statement.close();
			connection.close();
			request.setAttribute("movie", m);
			request.setAttribute("stars", m.getStars());
			request.setAttribute("genres", m.getGenres());
			request.getRequestDispatcher("MovieCard.jsp").forward(request, response);
			
		    response.setContentType("text/plain");
		    response.setCharacterEncoding("UTF-8");
		    response.getWriter().write(response.toString());
		
			
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
