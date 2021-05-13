<%@page import="com.Projects"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<script src="Components/jquery-3.2.1.min.js"></script>
<script src="Components/main.js"></script>
</head>
<body>

<div class="container"><div class="row"><div class="col-6">
	<h1>Items Management V10.1</h1>
	
	<form id="formItem" name="formItem">
	   Random Project ID:
 		<input id="randomProj_ID" name="randomProj_ID" type="text"
 			class="form-control form-control-sm"><br>
	
 		Project Title:
 		<input id="Project_Title" name="Project_Title" type="text"
 			class="form-control form-control-sm">
 			
 		<br> Short Description:
 		<input id="Project_ShortDes" name="Project_ShortDes" type="text"
			 class="form-control form-control-sm">
			 
 		<br> Long Description:
 		<input id="Project_LongDes" name="Project_LongDes" type="text"
 			class="form-control form-control-sm">
 			
 		<br> Source Link:
 		<input id="Project_Srclink" name="Project_Srclink" type="text"
 			class="form-control form-control-sm">
 			
 		<br> Video Link:
 		<input id="Project_Videolink" name="Project_Videolink" type="text"
 			class="form-control form-control-sm">
 			
		<br>
 		<input id="btnSave" name="btnSave" type="button" value="Save"
 				class="btn btn-primary">
 		
</form>

<div id="alertSuccess" class="alert alert-success"></div>
<div id="alertError" class="alert alert-danger"></div>

<br>
<div id="divItemsGrid">
 	<%
 		Projects projObj = new Projects();
 		out.print(projObj.readItems());
 	%>
</div>
</div> </div> </div>

</body>
</html>