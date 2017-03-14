package com.sam.user.servlets;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class Movie {

	private int id;
	private String title;
	private int year;
	private String director;
	private ArrayList<Star> stars;
	private ArrayList<Genre> genres;
	private String banner_url;
	private  String trailer_url;
	

	public Movie(){
		stars = new ArrayList<>();
		genres = new ArrayList<>();
		setListofStars();
	}
	
	public int getMovieID(){
		return id;
	}
	public void setMovieID(int id){
		this.id = id;
	}
	
	public int getYear(){
		return year;
	}
	public void setYear(int year){
		this.year = year;
	}
	
	public String getTitle(){
		return title;
	}
	public void setTitle(String title){
		this.title = title;
	}
	
	public String getDirector(){
		return director;
	}
	public void setDirector(String director){
		this.director = director;
	}
	
	public ArrayList<Star> getStars(){
		return stars;
	}
	
	public void setListofStars() {

		Connection connection;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			connection = DriverManager.getConnection("jdbc:mysql://localhost/moviedb", "mytestuser", "mypassword" );
			Statement statement = connection.createStatement();
			ResultSet rs = statement.executeQuery("select id, first_name, last_name from stars s, stars_in_movies sim where s.id=sim.star_id and movie_id=" + id);
			while(rs.next()){
				Star s  = new Star();
				s.setId(rs.getInt(1));
				s.setFirst_name(rs.getString(2));
				s.setLast_name(rs.getString(3));
				this.stars.add(s);
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
	
	
	public ArrayList<Genre> getGenres(){
		return genres;
	}
	
	public void setListofGenres() {

		Connection connection;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			connection = DriverManager.getConnection("jdbc:mysql://localhost/moviedb", "mytestuser", "mypassword" );
			Statement statement = connection.createStatement();
			ResultSet rs = statement.executeQuery("select id, name  from genres g, genres_in_movies gim where g.id=gim.genre_id and movie_id=" + id);
			while(rs.next()){
				Genre g  = new Genre();
				g.setId(rs.getInt(1));
				g.setName(rs.getString(2));
				this.genres.add(g);
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
	
	
	public String getBannerUrl(){
		return banner_url;
	}
	public void setBannerUrl(String bannerUrl){
		this.banner_url = bannerUrl ;
	}
	
	public String  getTrailerUrl(){
		return trailer_url;
	}
	public void setTrailerUrl(String trailerUrl){
		this.trailer_url = trailerUrl;
	}
	
	@Override 
	public boolean equals(Object o){
		Movie other = (Movie) o;
		if( this.title.equals(other.title) && this.year == other.year){
			return true;
		}
		return false;
	}
	public int hashCode(){
		return year;
	}
	
	
	
	

}
