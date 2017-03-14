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

/**
 * Servlet implementation class StarInfo
 */
@WebServlet("/MovieInfo")
public class MovieInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MovieInfo() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html; charset= UTF-8");
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection connection = DriverManager.getConnection("jdbc:mysql://localhost/moviedb", "mytestuser", "mypassword" );
			Statement statement = connection.createStatement();
			//String MovieId = request.getParameter("MovieId");
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
				
			}
			resultSet.close();
			statement.close();
			connection.close();
			request.setAttribute("movie", m);
			request.getRequestDispatcher("SinglePageMovie.jsp").forward(request, response);
			
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
