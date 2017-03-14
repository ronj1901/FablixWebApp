package com.sam.user.servlets;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import com.sam.user.servlets.ConnectionFactory;
import com.sam.user.servlets.Movie;


	 
public class MoviesDao {
	    Connection connection;
	    Statement stmt;
	    private int noOfRecords;
	         
	    public MoviesDao() { }
	     
	    private static Connection getConnection() 
	            throws SQLException, 
	                ClassNotFoundException 
	    {
	        Connection con = ConnectionFactory.
	                getInstance().getConnection();
	        return con;
	    }
	     
	    public List<Movie> viewAllEmployees(
	                int offset, 
	                int noOfRecords)
	    {
	        String query = "select SQL_CALC_FOUND_ROWS * from movies limit "
	                 + offset + ", " + noOfRecords;
	        List<Movie> list = new ArrayList<Movie>();
	        Movie movie = null;
	        try {
	            connection = getConnection();
	            stmt = connection.createStatement();
	            ResultSet rs = stmt.executeQuery(query);
	            while (rs.next()) {
	                movie = new Movie();
	                movie.setMovieID(rs.getInt("movies.id"));
	                movie.setYear(rs.getInt("year"));
	                movie.setTitle(rs.getString("title"));
	                movie.setDirector(rs.getString("director"));
	                movie.setBannerUrl(rs.getString("banner_url"));
	                movie.setTrailerUrl(rs.getString("trailer_url"));
	                list.add(movie);
	            }
	            rs.close();
	              
	            rs = stmt.executeQuery("SELECT FOUND_ROWS()");
	            if(rs.next())
	                this.noOfRecords = rs.getInt(1);
	        } catch (SQLException e) {
	            e.printStackTrace();
	        } catch (ClassNotFoundException e) {
	            e.printStackTrace();
	        }finally
	        {
	            try {
	                if(stmt != null)
	                    stmt.close();
	                if(connection != null)
	                    connection.close();
	                } catch (SQLException e) {
	                e.printStackTrace();
	            }
	        }
	        return list;
	    }
	 
	    public int getNoOfRecords() {
	        return noOfRecords;
	    }
	}

