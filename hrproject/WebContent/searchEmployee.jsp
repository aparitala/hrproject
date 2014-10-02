<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link
 href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css"
 rel="stylesheet" type="text/css" />
 <style>
 .myErrors {
  color:red;
 }
 </style>
<script
 src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.js"
 type="text/javascript"></script>
<script
 src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"
 type="text/javascript"></script>
<script
 src="http://ajax.microsoft.com/ajax/jquery.validate/1.7/jquery.validate.js"
 type="text/javascript"></script>
 
<script type="text/javascript">
  $(document).ready(function() {  
	// attach datepicker to the input field
	  // an interactive calendar appears as soon as you focus on the field
	  // for more information read http://jqueryui.com/demos/datepicker/
	  $("#empStartDate").datepicker({
	     onClose: function() {
	         $('#empStartDate').valid();
	     }
	 });
	  // custom validation method to make sure the date is in mm/dd/yyyy format 
	  jQuery.validator.addMethod(
	      "usaDate",
	      function(value, element) {
	       console.log(value);
	       var date = getDateFromFormat(value,'MM/dd/yyyy');
	       console.log(date);
	       if (date == 0) { 
	        return false; 
	       }
	       return true;
	      },
	      "Please enter a date in the format mm/dd/yyyy"
	  );
	  jQuery.validator.setDefaults({
		  // where to display the error relative to the element
		  errorPlacement: function(error, element) {
		      error.appendTo(element.parent().find('div.myErrors'));
		     }
		 });
	  
	  $("#emplSearch").validate({
		   rules: {
			   empId:{   
		                    maxlength: 6,
		                    digits: true
		             },
			
		  },
		 });
	  
    $('#searchEmployee').click(function() { 
    	
    	var id=$('#empId').val();
    	if (isNaN(id)) {
    		alert('Please Enter Valid Didgits');
    		$('#empId').text="";
    		$('#empId').focus();
    		return false;
    	}
    	
    	var firstName=$('#empFirstName').val();
    	var lastName=$('#empLastName').val();
    	var startDate=$('#empStartDate').val();
    	var action = 'emplSearch';
    	if (!(id.trim().length > 0 || firstName.trim().length > 0 || 
    			lastName.trim().length > 0 || startDate.length > 0)) {
    		alert('Please Enter Data At Least In One Field');
    		$('#empId').focus();
    		return false;
    	}
    	$.ajaxSetup ({
    		cache: false
    	});
      $.get('/hrproject/searchEmployee',{action:action ,id: id,firstName:firstName,lastName:lastName,startDate:startDate}, function(responseText) {    
          //alert(responseText);
          if (responseText != 'No Records Found')
    	  	 	$('#message').load("ListOfEmployees.jsp");   
          else 
        	  $('#message').text(responseText);
      });
    });
  });
</script>

</head>
<body>
<table>
     <tr>
			<td align="center" colspan="2">
				<form method="post" action="home.jsp">
					<input type="submit"  value="Home">
				</form>
			</td>
		</tr>
	</table>
<form id="emplSearch"> 
<table>
      <tr>
       <td valign="top" colspan="2" align="center">
       <b> Employee Search Form</b>
       </td>
      </tr>
      <tr>
       <td colspan="2">
        &nbsp;
       </td>
      </tr>
       <tr>
       <td valign="top">
       <label for="empId"> Employee Id  </label>
       </td>
       <td>
       <input id="empId" type="text" name="empId" size="12" value=""/>
        <div class="myErrors"></div>     
       </td>
      </tr>     
	  <tr>
       <td valign="top">
       <label for="empFirstName"> First Name  </label>
       </td>
       <td>
       <input id="empFirstName" type="text" name="empFirstName" size="50" value=""/>       
       </td>
      </tr>
      <tr>
       <td valign="top">
       <label for="empLastName"> Last Name  </label>
       </td>
       <td>
       <input id="empLastName" type="text" name="empLastName" size="50" value=""/>
       <div class="myErrors"></div>
       </td>
      </tr>
      <tr>       
       <td valign="top">
       <label for="empStartDate"> Start Date  </label>
       </td>
       <td>
       <input id="empStartDate" type="text" name="empStartDate" size="10" value=""/>&nbsp;(mm/dd/yyyy)
       
       </td>
      </tr>
      <tr> 
       <td colspan="2" align="center">
       &nbsp;     
       </td>
      </tr>
      <tr> 
       <td colspan="2" align="center">
       <input type="button" id="searchEmployee" value="Search"/>       
       </td>
      </tr>
      </table>
  <div id="message"></div>  
  </form>                         
</body>
</html>