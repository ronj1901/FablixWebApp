//package com.sam.user.servlets;
//
//import java.io.IOException;
//import java.sql.Connection;
//import java.sql.ResultSet;
//import java.sql.Statement;
//import java.util.ArrayList;
//
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
//import org.json.JSONArray;
//
//
///**
// * Servlet implementation class AutoComplete
// */
//
//@WebServlet("/Auto")
//public class AutoComplete extends HttpServlet {
//	private static final long serialVersionUID = 1L;
//
//    public AutoComplete() {
//        super();
//
//    }
//	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		ArrayList<String> al=new ArrayList<String>();
//		try{
//		DataSource ds=DataSource.getInstace();
//	     Connection conn=ds.getConnection();
//	     Statement stmt=conn.createStatement();
//	     String sql="select title from movies";
//	     String input = request.getParameter("searchtext");
//	     System.out.println("searchText ->" + input);
//	     if(input != null && input.isEmpty()){
//	    	 String [] params = input.split(" ");
//	    	 String fullSearch = "";
//	    	 for (String p : params){
//	    		 fullSearch +=  "+" + p + "* ";
//	    	 }
//	    	 
//	    	 sql += " where match(title)"  + " against('" + fullSearch + "' + in boolean mode ) order by title";
//	     }
//	     
//	     System.out.println("autoQuery " +sql);
//	     ResultSet rs = stmt.executeQuery(sql);
//	     while(rs.next()){
//	    	 al.add(rs.getString("title"));
//	     }
//	     rs.close();
//	     stmt.close();
//	     conn.close();
//		}catch(Exception e){
//			e.printStackTrace();
//		}
//		 JSONArray json=new JSONArray(al);
//		 response.setContentType("application/json");
//	     response.getWriter().print(json);
//	}   
//}s


package com.sam.user.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
//import com.google.gson.*;

/**
 * Servlet implementation class AutoComplete
 */

@WebServlet("/Auto")
public class AutoComplete extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public AutoComplete() {
        super();

    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<String> al=new ArrayList<String>();
		try{
		DataSource ds=DataSource.getInstace();
	     Connection conn=ds.getConnection();
	     Statement stmt=conn.createStatement();
	     String sql="select title from movies";
	     String input = request.getParameter("searchtext");
	     System.out.println("searchText ->" + input);
	     
	     if(input != null && !input.isEmpty()){
	    	 String [] params = input.split(" ");
	    	 String fullSearch = "";
	    	 for (String p : params){
	    		 fullSearch +=  "+" + p + "* ";
	    	 }
	    	 
	    	 sql += " where match(title)"  + " against('" + fullSearch + "' in boolean mode ) order by title";
	     }
	     
	     System.out.println("autoQuery " +sql);
	     ResultSet rs = stmt.executeQuery(sql);
	     while(rs.next()){
	    	 al.add(rs.getString("title").trim());
	     }
    	 System.out.println("resultset ->" + al);
	     rs.close();
	     stmt.close();
	     conn.close();
		}catch(Exception e){
			e.printStackTrace();
		}
//		String json = new Gson().toJson(al);
		 JSONArray json=new JSONArray(al);
		 response.setContentType("application/json");
	     response.getWriter().print(json);
	}   
}




