$(document).ready(function()
{
if ($("#alertSuccess").text().trim() == "")
{
$("#alertSuccess").hide();
}
$("#alertError").hide();
});
$(document).on("click", "#btnSave", function(event)
{
	// Clear alerts---------------------
 	$("#alertSuccess").text("");
 	$("#alertSuccess").hide();
 	$("#alertError").text("");
 	$("#alertError").hide();

	// Form validation-------------------
	var status = validateItemForm();
	if (status != true)
 	{
 		$("#alertError").text(status);
 		$("#alertError").show();
		 return;
	 }

	// If valid------------------------
	var type = ($("#hidItemIDSave").val() == "") ? "POST" : "PUT";
	
 	$.ajax(
	 {
 		url : "ProjectAPI",
 		type : type,
 		data : $("#formItem").serialize(),
 		dataType : "text",
 		complete : function(response, status)
 		{
			 onItemSaveComplete(response.responseText, status);
	 	}
 	});
});
function onItemSaveComplete(response, status)
{
	if (status == "success")
 	{
 		var resultSet = JSON.parse(response);
	
 		if (resultSet.status.trim() == "success")
 		{
 				$("#alertSuccess").text("Successfully saved.");
 				$("#alertSuccess").show();
			
 				$("#divItemsGrid").html(resultSet.data);
 				} else if (resultSet.status.trim() == "error")
 		{
 				$("#alertError").text(resultSet.data);
 				$("#alertError").show();
 		}
 	} else if (status == "error")
 	{
 		$("#alertError").text("Error while saving.");
 		$("#alertError").show();
 	} else
 	{
 		$("#alertError").text("Unknown error while saving..");
 		$("#alertError").show();
 	} 

 		$("#hidItemIDSave").val("");
 		$("#formItem")[0].reset(); 
	
 
}
$(document).on("click", ".btnUpdate", function(event)
{
 $("#hidItemIDSave").val($(this).data("Project_Id"));	
 $("#randomProj_ID").val($(this).closest("tr").find('td:eq(0)').text());
 $("#Project_Title").val($(this).closest("tr").find('td:eq(1)').text());
 $("#Project_ShortDes").val($(this).closest("tr").find('td:eq(2)').text());
 $("#Project_LongDes").val($(this).closest("tr").find('td:eq(3)').text());
 $("#Project_Srclink").val($(this).closest("tr").find('td:eq(4)').text());
 $("#Project_Videolink").val($(this).closest("tr").find('td:eq(5)').text());
});

$(document).on("click", ".btnRemove", function(event)
{
 		$.ajax(
 		{
 			url : "ProjectAPI",
 			type : "DELETE",
 			data : "Project_Id=" + $(this).data("Project_Id"),
 			dataType : "text",
 			complete : function(response, status)
 			{
 				onItemDeleteComplete(response.responseText, status);
 			}
 		});
});
function onItemDeleteComplete(response, status)
{
	if (status == "success")
 		{
 			var resultSet = JSON.parse(response);
 			if (resultSet.status.trim() == "success")
				 {
 					$("#alertSuccess").text("Successfully deleted.");
 					$("#alertSuccess").show();
 					$("#divItemsGrid").html(resultSet.data);
 			} else if (resultSet.status.trim() == "error")
 			{
 					$("#alertError").text(resultSet.data);
 					$("#alertError").show();
			 }
 			 } else if (status == "error")
   			{
 				$("#alertError").text("Error while deleting.");
 				$("#alertError").show();
 			} else
 			{
 				$("#alertError").text("Unknown error while deleting..");
 				$("#alertError").show();
 		}
}
function validateItemForm() 
{ 
	// rabdom id
	if ($("#randomProj_ID").val().trim() == "") 
 	{ 
 		return "Please Insert Random Id."; 
 	} 

	// project title
	if ($("#Project_Title").val().trim() == "") 
	 { 
 		return "Please Insert Project Title."; 
 	}
 
	// short description
	if ($("#Project_ShortDes").val().trim() == "") 
 	{ 
 		return "Please Insert Short Description"; 
 	} 

	// long description
	if ($("#Project_LongDes").val().trim() == "") 
 	{ 
 		return "Please Insert Long Description"; 
 	} 
	//	project src link
	if ($("#Project_Srclink").val().trim() == "") 
 	{ 
 		return "Please Insert Project Source Link"; 
 	} 
     //	project video link
	if ($("#Project_Videolink").val().trim() == "") 
 	{ 
 		return "Please Insert Project Video Link"; 
 	}
		return true; 
}
