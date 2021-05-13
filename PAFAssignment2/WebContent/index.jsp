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
	<div class="container">
 		<div class="row">
 			<div class="col-8">
 				<h1 class="m-3">Student details</h1>
				 <form id="formStudent">
				 		<!-- Project Title -->
						<div class="input-group input-group-sm mb-3">
							<div class="input-group-prepend">
								 <span class="input-group-text" id="lbltitle">ProjectTitle </span>
							</div>
							<input type="text" id="txtName" name="txtName">
						</div>
										 		<!-- Short Description -->
						<div class="input-group input-group-sm mb-3">
							<div class="input-group-prepend">
								 <span class="input-group-text" id="lblShortDes">Short Description : </span>
							</div>
							<input type="text" id="txtName" name="txtName">
						</div>
										 		<!-- Long Description -->
						<div class="input-group input-group-sm mb-3">
							<div class="input-group-prepend">
								 <span class="input-group-text" id="lblLongDesc">Long Description: </span>
							</div>
							<input type="text" id="txtName" name="txtName">
						</div>
										 		<!-- Source Link -->
						<div class="input-group input-group-sm mb-3">
							<div class="input-group-prepend">
								 <span class="input-group-text" id="lblSourceLink">Source Link : </span>
							</div>
							<input type="text" id="txtName" name="txtName">
						</div>
										 		<!-- Video Link -->
						<div class="input-group input-group-sm mb-3">
							<div class="input-group-prepend">
								 <span class="input-group-text" id="lblVideoLink">Video Link : </span>
							</div>
							<input type="text" id="txtName" name="txtName">
						</div>
				 
				 		<div id="alertSuccess" class="alert alert-success"></div><br>
						<div id="alertError" class="alert alert-danger"></div><br>
				 		
				 		<input type="button" id="btnSave" value="Save" class="btn btn-primary">
				 		
				 </form>
			 </div>
 		</div>

	 	<br>
	 	<div class="row">
			 <div class="col-12" id="colStudents">

 			</div>
 		</div>
	</div>
	

</body>
</html>