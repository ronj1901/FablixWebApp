package com.sam.user.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;

import com.sam.user.servlets.MoviesDao;
import com.sam.user.servlets.Movie;

@WebServlet("/Search")
public class Search extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html; charset= UTF-8");
		

		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection connection = DriverManager.getConnection("jdbc:mysql://localhost/moviedb", "mytestuser", "mypassword" );
			Statement statement = connection.createStatement();

			String searchtext = request.getParameter("searchtext").trim();
			String 	movie_year = request.getParameter("year");
			String movie_director = request.getParameter("director");
			String star_firstName = request.getParameter("starFirstName");
			String star_lastName = request.getParameter("starLastName");
			String limit = request.getParameter("limit");
			String genre = request.getParameter("genre");
			String title1 = request.getParameter("title1");

		// if searchtext is empty,  and  search are empty 
			
		// then dont do search
			
			
			if ((searchtext != null) ){
				if(searchtext.equals("null")){
					searchtext = ""; 		
				}		
			}else{
				searchtext = "";
				
			}
	        
			if ((movie_year != null)){
				if(movie_year.equals("null")){
					movie_year = ""; 		
				}
		    }else{
				movie_year = "";
				
			}
			
			
			if ((movie_director != null)){
				if(movie_director.equals("null")){
					movie_director = ""; 		
				}
		    }
			else{
				movie_director = "";
				
			}
			
			
			
			if (star_firstName != null){
	            if(star_firstName.equals("null")){
	            	star_firstName = "";
	            }
			}
			else{
				star_firstName = "";
				
			}
			if (star_lastName != null){
	            if(star_lastName.equals("null")){
	            	star_lastName = "";
	            }
			}else{
				star_lastName = "";
				
			}
			
			if(limit != null){
				if(limit.equals("null")){
					limit = "5";
				}
			}else{
				limit = "";
				
			}
			
			if(genre != null){
				if(genre.equals("null")){
					genre = "";
				}
			}
			else{
				genre = "";
				
			}
			if(title1 != null){
				if(title1.equals("null")){
					title1 = "";
				}
			}else{
				title1 = "";
				
			}
			
			
	        String test = " Test";
	        if(!(searchtext.isEmpty() && title1.isEmpty() && genre.isEmpty() && movie_year.isEmpty() && movie_director.isEmpty() && star_firstName.isEmpty() && star_lastName.isEmpty())){
	        		test = "test 2;";
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
					String limitQuery = "";
					if(limit != ""){
						if(limit.equals("5")){
							limitQuery= " LIMIT 5 ";
						}
						else if(limit.equals("10")){
							limitQuery = " LIMIT  10 ";
						}
						else if(limit.equals("20")){
							limitQuery = " LIMIT 20 ";
						}
						
					}else{
						limitQuery = " Limit 5 ";
						limit = "5";
						}
					String OffsetQuery = "";
					String page1 = request.getParameter("page");
					if(page1 != null){
					int page = Integer.parseInt(page1);
					if(page > 1){
						int pages;
						pages = (page-1)*Integer.parseInt(limit);
						OffsetQuery = " OFFSET "+ String.valueOf(pages) + " "; 
					}
					}else{
						page1 = "1";
					}
					int page = Integer.parseInt(page1);
//					int page = 1;
				    int recordsPerPage = Integer.parseInt(limit);//limit String.valueOf(limit)
				    if(request.getParameter("page") != null)
				        page = Integer.parseInt(request.getParameter("page"));
				    MoviesDao dao = new MoviesDao();
				    List<Movie> list = dao.viewAllEmployees((page-1)*recordsPerPage,
				                                 recordsPerPage);
				    int noOfRecords = dao.getNoOfRecords();
				    int noOfPages = (int) Math.ceil(noOfRecords * 1.0 / recordsPerPage);
				    request.setAttribute("movieList", list);
				    request.setAttribute("noOfPages", noOfPages);
				    request.setAttribute("currentPage", page);
					
					String baseQuery = "SELECT * FROM movies WHERE 1 = 1";
					System.out.println(baseQuery);
					
					if(  !star_firstName.isEmpty() ||  !star_lastName.isEmpty()  ){
						baseQuery = "select m.id, title, year, director, banner_url, trailer_url from movies m, stars s, stars_in_movies sim WHERE m.id=sim.movie_id AND s.id=sim.star_id";
					}
					if(!searchtext.isEmpty())
						baseQuery = baseQuery +  " AND upper(title) like '%" + searchtext.toUpperCase() + "%'" ;
					if(!movie_year.isEmpty())
						baseQuery = baseQuery +  " AND year=" + movie_year;
					if(!movie_director.isEmpty())
						baseQuery = baseQuery +  " AND upper(director) like '%" + movie_director.toUpperCase() + "%'";
					if( !star_firstName.isEmpty())
						baseQuery = baseQuery +  " AND upper(first_name) like '%" + star_firstName.toUpperCase() + "%'" ;
					if( !star_lastName.isEmpty())
						baseQuery = baseQuery +  " AND upper(last_name) like '%" + star_lastName.toUpperCase() + "%'" ;
				
					if(!title1.isEmpty() ){
						baseQuery =  "SELECT m.id, title, year, director, banner_url, trailer_url FROM movies m where m.title like '" + title1 + "%" +  "'";

					}
					if(  !genre.isEmpty()){
						baseQuery =  "SELECT m.id, title, year, director, banner_url, trailer_url FROM movies m, genres g, genres_in_movies gim where g.id=gim.genre_id and  m.id = gim.movie_id and g.name='" + genre + "'";
					}
				
					baseQuery = baseQuery + sortQuery + limitQuery + OffsetQuery;
					
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
					request.setAttribute("searchtext",searchtext);
					request.setAttribute("year", movie_year);
					request.setAttribute("director", movie_director);
					request.setAttribute("starFirstName",star_firstName);
					request.setAttribute("starLastName",star_lastName);
					request.setAttribute("movies", movies);
					request.setAttribute("genre", genre);
					request.setAttribute("title1", title1);
					request.setAttribute("limit", limit);
					request.setAttribute("baseQuery", baseQuery);
					request.setAttribute("test", test);
	        }
			request.getRequestDispatcher("welcome.jsp").forward(request, response);

		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
		}


	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
