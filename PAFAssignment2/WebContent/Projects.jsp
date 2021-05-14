<%@page import="com.Projects"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="Views/bootstrap.min.css">
<script src="Components/jquery-3.2.1.min.js"></script>
<script src="Components/main.js"></script>
</head>
<body>


	<center><h3>- Submit Your Project -</h3></center><br>
<div class="container"><div class="col-6">	
	<form id="formItem" name="formItem">
		<div class="row">
			<div class="col-25">
	   			<label for="fname">Random Project ID :</label>
	   		</div>
	   		<div class="col-75">	
 				<input id="randomProj_ID" name="randomProj_ID" type="text"
 			class="form-control form-control-sm">
			</div>
		</div>	
			
		<div class="row">	
			<div class="col-25">
 				<label for="fname">Project Title :</label>
 			</div>
 			<div class="col-75">	
 				<input id="Project_Title" name="Project_Title" type="text"
 				class="form-control form-control-sm">
 			</div>
 		</div>	
 		
 		<div class="row">
 			<div class="col-25">	
 				<label for="fname">Short Description :</label>
 			</div>
 			<div class="col-75">	
 				<input id="Project_ShortDes" name="Project_ShortDes" type="text"
			 	class="form-control form-control-sm">
			</div>
		</div>
			
		<div class="row">	 
			<div class="col-25">
				<label for="fname">Long Description :</label>
			</div>
			<div class="col-75">	
 				<input id="Project_LongDes" name="Project_LongDes" type="text"
 				class="form-control form-control-sm">
 			</div>
 		</div>
 		
 		<div class="row">
 			<div class="col-25">	
 				<label for="fname">Source Link :</label>
 			</div>	
 			<div class="col-75">	
 				<input id="Project_Srclink" name="Project_Srclink" type="text"
 				class="form-control form-control-sm">
 			</div>
 		</div>
 			
 		<div class="row">
 			<div class="col-25">	
 				<label for="fname">Video Link :</label>
 			</div>		
 			<div class="col-75">
 				<input id="Project_Videolink" name="Project_Videolink" type="text"
 				class="form-control form-control-sm">
 			</div>
 		</div>	
		<center><br>
 		<input  id="btnSave" name="btnSave" type="button" value="Save" class="btn btn-primary"></center><br>
 			
 		<input type="hidden" id="hidItemIDSave" name="hidItemIDSave" value="">
</form>

<div id="alertSuccess" class="alert alert-success"></div>
<div id="alertError" class="alert alert-danger"></div>

<br>

</div> </div> <br>
<div id="divItemsGrid">
 	<%
 		Projects projObj = new Projects();
 		out.print(projObj.readItems());
 	%>
</div>

</body>
</html>