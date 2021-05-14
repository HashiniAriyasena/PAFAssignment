package com;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;
/**
 * Servlet implementation class ProjectAPI
 */
@WebServlet("/ProjectAPI")
public class ProjectAPI extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	Projects projects = new Projects();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProjectAPI() {
    	super();
    	
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String output = projects.insertItem(request.getParameter("randomProj_ID"),
				request.getParameter("Project_Title"),
				request.getParameter("Project_ShortDes"),
				request.getParameter("Project_LongDes"),
				request.getParameter("Project_Srclink"),
				request.getParameter("Project_Videolink"));
		
				response.getWriter().write(output);
			
	}

	/**
	 * @see HttpServlet#doPut(HttpServletRequest, HttpServletResponse)
	 */
	protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		

		 Map paras = getParasMap(request);
		 
		 
		 String output = projects.updateProjects(paras.get("hidItemIDSave").toString(),		 
		 paras.get("randomProj_ID").toString(),
		 paras.get("Project_Title").toString(),
		 paras.get("Project_ShortDes").toString(),
		 paras.get("Project_LongDes").toString(),
		 paras.get("Project_Srclink").toString(),
		 paras.get("Project_Videolink").toString());
		 
		 response.getWriter().write(output);
		
	}

	/**
	 * @see HttpServlet#doDelete(HttpServletRequest, HttpServletResponse)
	 */
	protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Map paras = getParasMap(request);
		
		String output = projects.deleteItem(paras.get("Projectid").toString());
		
		response.getWriter().write(output); 
		
	}
	private static Map getParasMap(HttpServletRequest request)
	{
		Map<String, String> map = new HashMap<String, String>();
			try
			{
				Scanner scanner = new Scanner(request.getInputStream(), "UTF-8");
				String queryString = scanner.hasNext() ?
						scanner.useDelimiter("\\A").next() : "";
				scanner.close();
				
				String[] params = queryString.split("&");
				for (String param : params)
				{ 
	
					String[] p = param.split("=");
					map.put(p[0], p[1]);
				}
			}
			catch (Exception e)
			{
				
			}
			return map;
	}


}
