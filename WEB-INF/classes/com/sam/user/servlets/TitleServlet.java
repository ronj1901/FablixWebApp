package com.sam.user.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class GenreServlet
 */
@WebServlet("/TitleServlet")
public class TitleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TitleServlet() {
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

			String  title1 = request.getParameter("title1");
		
			
					
					String sort = request.getParameter("sort");
					String sortQuery =  "";
					if(sort != null){
						if(sort.equals("1")){
							sortQuery= " ORDER BY title ASC";
						}
						else if(sort.equals("2")){
							sortQuery= " ORDER BY title DESC";
						}
						else if(sort.equals("3")){
							sortQuery= " ORDER BY year ASC";
						}
						else if(sort.equals("4")){
							sortQuery = " ORDER BY year DESC";
						}
		
					}
					
					String baseQuery = "SELECT m.id, title, year, director, banner_url, trailer_url FROM movies m where m.title like '" + title1 + "%" + "'";
				
					baseQuery = baseQuery + sortQuery;
					
						System.out.println(baseQuery);
						ResultSet resultSet = statement.executeQuery(baseQuery);
						
					    // arraylist of movies
						ArrayList<Movie> movies  = new ArrayList<>();
						while(resultSet.next()){
							int id = resultSet.getInt(1);
							String title = resultSet.getString(2);
							int year  =  resultSet.getInt(3);
							String director = resultSet.getString(4);
							String banner_url = resultSet.getString(5);
							String trailer_url = resultSet.getString(6);
							
							Movie m = new Movie();
							m.setMovieID(id);
							m.setTitle(title);
							m.setYear(year);
							m.setDirector(director);
							m.setListofStars();
							m.setListofGenres();
							m.setBannerUrl(banner_url);
							m.setTrailerUrl(trailer_url);
							movies.add(m);
						}
					
				    resultSet.close();
				    statement.close();
				    connection.close();
			
					request.setAttribute("title1",title1);
					
					request.setAttribute("movies", movies);
					
	        
			request.getRequestDispatcher("welcome.jsp").forward(request, response);

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
