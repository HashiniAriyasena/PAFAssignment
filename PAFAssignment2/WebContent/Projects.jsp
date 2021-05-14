<%@page import="com.Projects"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
String projectId = Projects.generateProjectId();
%>    
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
    <div>
        <nav class="navbar navbar-light navbar-expand-md">
            <div class="container-fluid"><a class="navbar-brand" href="#"><img src="assets/img/gg.png" width="150px" height="auto"></a><button data-toggle="collapse" class="navbar-toggler" data-target="#navcol-1"><span class="sr-only">Toggle navigation</span><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navcol-1">
                    <ul class="navbar-nav ml-auto" style="width: 310px;">
                        <li class="nav-item" style="width: auto;"><a class="nav-link active" href="#">Home</a></li>
                        <li class="nav-item" style="width: auto;"><a class="nav-link" href="cart.html">Cart</a></li>
                        <li class="nav-item" style="width: auto;"><a class="nav-link" href="#">Selling</a></li>
                        <li class="nav-item dropdown" style="width: auto;"><a class="dropdown-toggle nav-link" aria-expanded="false" data-toggle="dropdown" href="#">My Account</a>
                            <div class="dropdown-menu"><a class="dropdown-item" href="#">Projects</a><a class="dropdown-item" href="#">Settings</a><a class="dropdown-item" href="#">Store</a><a class="dropdown-item" href="#">Logout</a></div>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
    </div>

<div class="container"><div class="col-6">	
<center><h3> Submit Your Project</h3></center><br>
	<form id="formItem" name="formItem">
		<div class="row">
			<div class="col-25">
	   			<label for="fname">Random Project ID :</label>
	   		</div>
	   		<div class="col-75">	
 				<input value="<%out.print(projectId); %>" id="randomProj_ID" name="randomProj_ID" type="text"
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