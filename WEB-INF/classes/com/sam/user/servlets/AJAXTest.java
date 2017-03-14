//package com.sam.user.servlets;
//
//import java.io.IOException;
//import java.util.ArrayList;
//import java.util.LinkedHashMap;
//import java.util.List;
//import java.util.Map;
//
//import com.google.gson.Gson;
//import com.google.gson.GsonBuilder;
//
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
//
//@WebServlet("/someservlet")
//public class AJAXTest extends HttpServlet {
//	private static final long serialVersionUID = 1L;
//
//	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		
//		 List<String> list = new ArrayList<>();
//		    list.add("Hero");
//		    list.add("Sam Thapa");
//		    list.add("Arnold");
//		    list.add("Salman Khan");
//		    list.add("Paman kaman");
//		    list.add("Getter Set");
//		    list.add("SOiler Inny");
//		    list.add("Quanty ofof");
//		    list.add("pakort");
//		    
//		    Map<String, String> options = new LinkedHashMap<>();
//		    options.put("value1", "label1");
//		    options.put("value2", "label2");
//		    options.put("value3", "label3");
//		    String  resultMap = new Gson().toJson(options);
//		    
//		    
//		    //String json = new Gson().toJson(list);
//		    
//		    response.setContentType("application/json");
//		    response.setCharacterEncoding("UTF-8");
//		    response.getWriter().write(resultMap);
//		    //response.getWriter().write(resultMap);
//		    
//	}
//	
//
//	/**
//	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
//	 */
//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		// TODO Auto-generated method stub
//		doGet(request, response);
//	}
//
//}
