package com;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Random;

public class Projects {
	
private Connection connect(){
		
		Connection conn = null;
		try{
			Class.forName("com.mysql.cj.jdbc.Driver"); 
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/projectservice", "root", "hashini");
		}catch (Exception e){
			e.printStackTrace();
		}
			return conn;
}
public String readItems()
{
			String output = "";
		
	try
	 {
			Connection con = connect();
			
	 if (con == null)
	 {
		 	return "Error while connecting to the database for reading.";
	 }
	 
	 // Prepare the html table to be displayed
	 output = "<table border='1'><tr><th>randomProj_ID</th>"
			 		+ "<th>Project_Title</th><th>Project_ShortDes</th>"
			 		+ "<th>Project_LongDes</th><th>Project_Srclink</th>"
			 		+ "<th>Project_Videolink</th>"
			 		+ "<th>Update</th><th>Remove</th></tr>";
	 
	 String query = "select * from projects";
	 Statement stmt = con.createStatement();
	 ResultSet rs = stmt.executeQuery(query);
	 
	 // iterate through the rows in the result set
	 while (rs.next())
	 {
		 String Project_Id = rs.getString("Project_Id");
		 String randomProj_ID = rs.getString("randomProj_ID");
		 String Project_Title = rs.getString("Project_Title");
		 String Project_ShortDes = rs.getString("Project_ShortDes");
		 String Project_LongDes = rs.getString("Project_LongDes");
		 String Project_Srclink = rs.getString("Project_Srclink");
		 String Project_Videolink = rs.getString("Project_Videolink");

		// Add into the html table
		 output  +="<tr><td>"+ randomProj_ID + "</td>";
		 output += "<td>" + Project_Title + "</td>";
		 output += "<td>" + Project_ShortDes + "</td>";
		 output += "<td>" + Project_LongDes + "</td>";
		 output += "<td>" + Project_Srclink + "</td>";
		 output += "<td>" + Project_Videolink + "</td>";
		 
		// buttons
		 output += "<td><input name='btnUpdate' type='button' value='Update' "
		 + "class='btnUpdate btn btn-secondary' data-projectid='" + Project_Id + "'></td>"
		 + "<td><input name='btnRemove' id = 'test' type='button' value='Remove' "
		 + "class='btnRemove btn btn-danger' data-projectid='"+Project_Id+"'></td></tr>";
		  }
		  con.close();
		  // Complete the html table
		  output += "</table><br><br>";
	}
	catch (Exception e)
	{
		  output = "Error while reading the items.";
		  System.err.println(e.getMessage());
	}
		 return output;
	}

//method to generate random project ID:
public static String generateProjectId() {
	
    String SALTCHARS = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
    StringBuilder salt = new StringBuilder();
    Random rnd = new Random();
    
    while (salt.length() < 6) { // length of the random string.
        int index = (int) (rnd.nextFloat() * SALTCHARS.length());
        salt.append(SALTCHARS.charAt(index));
    }
    
    String saltStr = salt.toString();
    
    return  "PROJ-" + saltStr;

}

public String insertItem(String randomProj_ID, String Project_Title, String Project_ShortDes, String Project_LongDes, String Project_Srclink, String Project_Videolink)
		{
		 	String output = "";
		 	
		 	try
		 	{
		 		Connection con = connect();
		 		
		 		if (con == null)
		 		{
		 				return "Error while connecting to the database for inserting.";
		 
		 		}
		 		
		 // create a prepared statement
		 String query = "insert into projects(Project_Id,randomProj_ID, Project_Title, Project_ShortDes, Project_LongDes, Project_Srclink, Project_Videolink)values(?,?,?,?,?,?,?)";
		 
				 PreparedStatement preparedStmt = con.prepareStatement(query);
				 
				 // binding values
				 preparedStmt.setInt(1, 0);
				 preparedStmt.setString(2, randomProj_ID);
				 preparedStmt.setString(3, Project_Title);
				 preparedStmt.setString(4, Project_ShortDes);
				 preparedStmt.setString(5, Project_LongDes);
				 preparedStmt.setString(6, Project_Srclink);
				 preparedStmt.setString(7, Project_Videolink);
				 
				 // execute the statement
				 preparedStmt.execute();
				 con.close();
				 
				 String newItems = readItems();
				 output = "{\"status\":\"success\", \"data\": \"" + newItems + "\"}";
						 	
				 }
				 catch (Exception e)
				 {
					 output = "{\"status\":\"error\", \"data\": \"Error while inserting the item.\"}";
							
					 System.err.println(e.getMessage());
				 }
				 return output;
			}
public String updateProjects(String Project_Id ,String randomProj_ID,String Project_Title,String Project_ShortDes,String Project_LongDes,String Project_Srclink,String Project_Videolink) 
		 
		 {
		 	String output = "";
		 	
		 try
		 {
			 	Connection con = connect();
			 	
			 	if (con == null)
			 	{
			 		return "Error while connecting to the database for updating.";
		
			 	}
			 	
			 	// create a prepared statement
			 	String query = "UPDATE projects SET randomProj_ID=?,Project_Title=?, Project_ShortDes=?, Project_LongDes =?, Project_Srclink=?,Project_Videolink=? WHERE Project_Id =? ";
		 
			 	PreparedStatement preparedStmt = con.prepareStatement(query);
			 	
			 	// binding values
			 	preparedStmt.setString(1, randomProj_ID);
			 	preparedStmt.setString(2, Project_Title);
			 	preparedStmt.setString(3, Project_ShortDes);
			 	preparedStmt.setString(4, Project_LongDes);
			 	preparedStmt.setString(5, Project_Srclink);
			 	preparedStmt.setString(6, Project_Videolink);
			 	preparedStmt.setInt(7, Integer.parseInt(Project_Id));
			
			 	// execute the statement
			 	preparedStmt.executeUpdate();
			 	con.close();
			 	
			 	String newItems = readItems();
			 	output = "{\"status\":\"success\", \"data\": \"" + newItems + "\"}";
			 				
		 }
		 catch (Exception e)
		 {
			 output = "{\"status\":\"error\", \"data\":\"Error while updating the item.\"}";
				 		
			 System.err.println(e.getMessage());
		 }
		 return output;
	}

public String deleteItem(String Project_Id)
{
			String output = "";
			
		 try
		 {
			 
			 Connection con = connect();
			 
		 if (con == null)
		 {
			 return "Error while connecting to the database for deleting.";
		 
		 }
		 // create a prepared statement
		 String query = "delete from projects where Project_Id=?";
		 System.out.println(Project_Id);
		 
		 PreparedStatement preparedStmt = con.prepareStatement(query);
		 
		 // binding values
		 preparedStmt.setString(1,Project_Id);
		 
		 // execute the statement
		 preparedStmt.execute();
		 con.close();
		 
		 String newItems = readItems();
		 output = "{\"status\":\"success\", \"data\": \"" + newItems + "\"}";
				
	 }
	catch (Exception e)
	{
		 output = "{\"status\":\"error\", \"data\":\"Error while deleting the item.\"}";
				
		 System.err.println(e.getMessage());
	}
		 return output;
 } 
}
	 	 
