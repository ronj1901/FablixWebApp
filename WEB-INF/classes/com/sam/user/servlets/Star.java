package com.sam.user.servlets;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class Star {
	private int id;
	private String first_name;
	private String last_name;
	private Date dob;
	private String photo_url;
	
	private ArrayList<Movie> movies;
	public Star(){
		this.movies = new ArrayList<Movie>();
	}
	
	public Star(int id, String first_name, String last_name, Date dob, String photo_url) {
		super();
		this.id = id;
		this.first_name = first_name;
		this.last_name = last_name;
		this.dob = dob;
		this.movies = new ArrayList<Movie>();
		
		setPhoto_url(photo_url);
	}
	
	public void addMovie(Movie movie)
	{
		movies.add(movie);
	}
	
	public void clearMovies()
	{
		movies.clear();
	}
	
	/**
	 * @return the id
	 */
	public int getId() {
		return id;
	}
	/**
	 * @param id the id to set
	 */
	public void setId(int id) {
		this.id = id;
	}
	/**
	 * @return the first_name
	 */
	public String getFirst_name() {
		return first_name;
	}
	/**
	 * @param first_name the first_name to set
	 */
	public void setFirst_name(String first_name) {
		this.first_name = first_name;
	}
	/**
	 * @return the last_name
	 */
	public String getLast_name() {
		return last_name;
	}
	/**
	 * @param last_name the last_name to set
	 */
	public void setLast_name(String last_name) {
		this.last_name = last_name;
	}
	/**
	 * @return the dob
	 */
	public Date getDob() {
		return dob;
	}
	/**
	 * @param dob the dob to set
	 */
	public void setDob(Date dob) {
		this.dob = dob;
	}
	/**
	 * @return the photo_url
	 */
	public String getPhoto_url() {
		return photo_url;
	}
	/**
	 * @param photo_url the photo_url to set
	 */
	public void setPhoto_url(String photo_url) {
		if (!photo_url.toLowerCase().matches("^\\w+://.*")) {
			photo_url = "http://" + photo_url;
		}
		this.photo_url = photo_url;
	}
	
	public ArrayList<Movie> getMovies() {
		return movies;
	}
	
	public void setListofMovies() {

		Connection connection;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			connection = DriverManager.getConnection("jdbc:mysql://localhost/moviedb", "mytestuser", "mypassword" );
			Statement statement = connection.createStatement();
			ResultSet rs = statement.executeQuery("select id, title, year from movies m, stars_in_movies sim where m.id=sim.movie_id and star_id=" + id);
			while(rs.next()){
				Movie m  = new Movie();
				m.setMovieID(rs.getInt(1));
				m.setTitle(rs.getString(2));
				m.setYear(rs.getInt(3));
				this.movies.add(m);
			}
			rs.close();
			statement.close();
			connection.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
	}
}