package com.project.news;


import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//import com.project.connection.DatabaseConnection;
//import com.project.info.ClientInformationManager;
//import com.project.info.NewsInformationManager;

/**
 * Servlet implementation class NewsServlet
 */
public class NewsServlet extends HttpServlet {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
		      throws ServletException, IOException {
		
		System.out.println("Getttt");
		String searchquery;
		try {
			
			//System.out.println(Integer.parseInt(request.getParameter("source")));
			if(!request.getParameter("client").equals("") && !request.getParameter("law_firm").equals("")) {
				request.setAttribute("errorMessage", "Select either client or law_firm");
				request.getRequestDispatcher("/index.jsp").forward(request, response);
			}
			else {
			
			if(request.getParameter("client").equals("") )
				searchquery = request.getParameter("law_firm");
			else searchquery = request.getParameter("client");
			
			String keyword[] = null;
			if(searchquery.equalsIgnoreCase("ALL")) {
				searchquery="";
			}
			
			if(request.getParameter("addkey") !="") {
				if(request.getParameterValues("keyword") != null) {
					keyword = new String[request.getParameterValues("keyword").length + request.getParameter("addkey").split(" ").length];
					int j=0;
					for(int i=0;i<request.getParameterValues("keyword").length; i++) {
						keyword[j++]=request.getParameterValues("keyword")[i];
					}
					for(int i=0;i<request.getParameter("addkey").split(" ").length;i++) {
						keyword[j++]=request.getParameter("addkey").split(" ")[i];
					}
				}
				else {
					keyword = new String[request.getParameter("addkey").split(" ").length];
					int j=0;
					for(int i=0;i<request.getParameter("addkey").split(" ").length;i++) {
						keyword[j++]=request.getParameter("addkey").split(" ")[i];
					}
				}
			}
			else if(request.getParameterValues("keyword") != null) {
				keyword = new String[request.getParameterValues("keyword").length];
				int j=0;
				for(int i=0;i<request.getParameterValues("keyword").length; i++) {
					keyword[j++]=request.getParameterValues("keyword")[i];
				}
			}
			
			if(searchquery.equals("") ) {
				if(keyword==null) {
					request.setAttribute("errorMessage", "Invalid Selection");
					request.getRequestDispatcher("/index.jsp").forward(request, response);
				}
				else if(keyword.length > 3) {
					request.setAttribute("errorMessage", "Too many keywords");
					request.getRequestDispatcher("/index.jsp").forward(request, response);
				}
				else {
//					Connection conn = DatabaseConnection.getConnection();
					
					String date = request.getParameter("theDate");
					
					NewsInformationManager.fetchData(request,searchquery,keyword, date);
					request.setAttribute("cname", request.getParameter("client"));
					request.setAttribute("lname", request.getParameter("law_firm"));
					request.getRequestDispatcher("/index.jsp").forward(request, response);
//					conn.close();
				}
			}
			else {
//				Connection conn = DatabaseConnection.getConnection();
				
				String date = request.getParameter("theDate");
				
				NewsInformationManager.fetchData(request,searchquery,keyword, date);
				request.setAttribute("cname", request.getParameter("client"));
				request.setAttribute("lname", request.getParameter("law_firm"));
				request.getRequestDispatcher("/index.jsp").forward(request, response);
				//response.sendRedirect(request.getContextPath() + "/index.jsp");
				      
				//  response.sendRedirect(request.getHeader("referer") + "?success=true");
				  
				//response.sendRedirect("index.jsp");
//				conn.close();
			}
		  }
		} /*catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			request.setAttribute("errorMessage", "Error processing request");
		}*/
		catch(Exception e) {
			e.printStackTrace();
			request.setAttribute("errorMessage", "Error processing request");
		}
		finally {
			System.out.println("doneeee");
		}
		
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
		      throws ServletException, IOException {
		doGet(request,response);
	}
	
}
