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
@WebServlet("/StarInfo")
public class StarInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StarInfo() {
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
			String id = request.getParameter("id");
			
			Star s = new Star();
			s.setId(Integer.parseInt(id));
			s.setListofMovies();
			ResultSet resultSet = statement.executeQuery("SELECT first_name, last_name, dob, photo_url from stars where id=" + id);
			if(resultSet.next()){
				s.setFirst_name(resultSet.getString(1));
				s.setLast_name(resultSet.getString(2));
				s.setDob(resultSet.getDate(3));	
				s.setPhoto_url(resultSet.getString(4));
			}
			resultSet.close();
			statement.close();
			connection.close();
			request.setAttribute("star", s);
			request.getRequestDispatcher("SinglePageStar.jsp").forward(request, response);
			
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
