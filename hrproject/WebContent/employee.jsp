<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="robots" content="noindex,nofollow" />
<title>Add New Employee</title>
<link rel="stylesheet" href="/resources/themes/master.css" type="text/css" />
<link
 href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css"
 rel="stylesheet" type="text/css" />
<style>  
 .myErrors {
  color:red;
 }
.bigbutton {
	width: 200px;
	height: 40px;
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
 // modify default settings for validation
 jQuery.validator.setDefaults({
  // where to display the error relative to the element
  errorPlacement: function(error, element) {
      error.appendTo(element.parent().find('div.myErrors'));
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
 
 jQuery.validator.addMethod("phoneUS", function(phone_number, element) {
    phone_number = phone_number.replace(/\s+/g, ""); 
	debugger;
    return this.optional(element) || phone_number.length > 8 &&
        phone_number.match(/^(1-?)?(\([2-9]\d{2}\)|[2-9]\d{2})-?[2-9]\d{2}-?\d{4}$/);
}, "Please specify a valid phone number"); 
  
 $("#frmAddEmployee").validate({
   rules: {
     
    // mandatory entry
    empLastName: {
    	required: true,
    	maxlength: 40
    },
    empFirstName: {
    	required: true,
    	maxlength: 40
    }, 
	empAddr1: {
    	required: true,
    	maxlength: 60
    },
    empAddr2: {    	
    	maxlength: 60
    },
	empCity: {
    	required: true,
    	maxlength: 30
    },
	
    // mandatory entry and valid email address
    
       
    // madatory date entry and valid date format  
    empStartDate : {
     required: true,
              usaDate : true
            },
    // mandatory drop down selection  
    empState: "required",
	empZIP:{
                    required: true,
                    minlength: 5,
                    maxlength: 5,
                    digits: true
                },
    empPhone: {
      required: true,
      maxlength: 10,
      digits: true
     // phoneUS: true
    },
	
	
  },
   
  //custom error messages
        messages: {
         empStartDate:{
          required: "Please choose a Date."
          },
		 empZIP : {
		  required: "Please Enter Five Digits."
		 },
        },
         
        // on page submit 
        submitHandler: function(){
          alert('Form validation was a success, please proceed!');
        }
 
 });
});
</script>
</head>
<body>
 <div id="allContent">
 
  <div id="myContent">
  <table>
     <tr>
			<td align="center" colspan="2">
				<form method="post" action="home.jsp">
					<input type="submit"  value="Home">
				</form>
			</td>
		</tr>
	</table>
   <form id="frmAddEmployee" name="frmAddEmployee" method="POST" action="addEmployee">
     
      <table>
      <tr>
       <td valign="top" colspan="2" align="center">
       <b> New Employee Registration Form</b>
       </td>
      </tr>
      <tr>
       <td colspan="2">
        &nbsp;
       </td>
      </tr>   
      
	  <tr>
       <td valign="top">
       <label for="empFirstName"> First Name  </label>
       </td>
       <td>
       <input id="empFirstName" type="text" name="empFirstName" size="50" value=""/>
       <div class="myErrors"></div>
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
       <label for="empAddr1"> Address 1  </label>
       </td>
       <td>
       <input id="empAddr1" type="text" name="empAddr1" size="50" value=""/>
       <div class="myErrors"></div>
       </td>
      </tr>
	  <tr>
       <td valign="top">
       <label for="empAddr2"> Address 2  </label>
       </td>
       <td>
       <input id="empAddr2" type="text" name="empAddr2" size="50" value=""/>
       <div class="myErrors"></div>
       </td>
      </tr>
	  <tr>
       <td valign="top">
       <label for="empCity"> City  </label>
       </td>
       <td>
       <input id="empCity" type="text" name="empCity" size="50" value=""/>
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
       <td valign="top">
       <label for="empState"> Drop down for car models  </label>
       </td>
       <td>
       <select id="empState" name="empState" title="Please select State">
       <option value="">Select a State</option> 
			<option value="AL">Alabama</option> 
			<option value="AK">Alaska</option> 
			<option value="AZ">Arizona</option> 
			<option value="AR">Arkansas</option> 
			<option value="CA">California</option> 
			<option value="CO">Colorado</option> 
			<option value="CT">Connecticut</option> 
			<option value="DE">Delaware</option> 
			<option value="DC">District Of Columbia</option> 
			<option value="FL">Florida</option> 
			<option value="GA">Georgia</option> 
			<option value="HI">Hawaii</option> 
			<option value="ID">Idaho</option> 
			<option value="IL">Illinois</option> 
			<option value="IN">Indiana</option> 
			<option value="IA">Iowa</option> 
			<option value="KS">Kansas</option> 
			<option value="KY">Kentucky</option> 
			<option value="LA">Louisiana</option> 
			<option value="ME">Maine</option> 
			<option value="MD">Maryland</option> 
			<option value="MA">Massachusetts</option> 
			<option value="MI">Michigan</option> 
			<option value="MN">Minnesota</option> 
			<option value="MS">Mississippi</option> 
			<option value="MO">Missouri</option> 
			<option value="MT">Montana</option> 
			<option value="NE">Nebraska</option> 
			<option value="NV">Nevada</option> 
			<option value="NH">New Hampshire</option> 
			<option value="NJ">New Jersey</option> 
			<option value="NM">New Mexico</option> 
			<option value="NY">New York</option> 
			<option value="NC">North Carolina</option> 
			<option value="ND">North Dakota</option> 
			<option value="OH">Ohio</option> 
			<option value="OK">Oklahoma</option> 
			<option value="OR">Oregon</option> 
			<option value="PA">Pennsylvania</option> 
			<option value="RI">Rhode Island</option> 
			<option value="SC">South Carolina</option> 
			<option value="SD">South Dakota</option> 
			<option value="TN">Tennessee</option> 
			<option value="TX">Texas</option> 
			<option value="UT">Utah</option> 
			<option value="VT">Vermont</option> 
			<option value="VA">Virginia</option> 
			<option value="WA">Washington</option> 
			<option value="WV">West Virginia</option> 
			<option value="WI">Wisconsin</option> 
			<option value="WY">Wyoming</option>
       </select>
       <div class="myErrors"></div>
       </td>
      </tr>
      <tr>
       <td valign="top">
       <label for="empZIP"> ZIP  </label>
       </td>
       <td>
       <input id="empZIP" type="text" name="empZIP" size="10" maxlength="5"  value=""/>
       <div class="myErrors"></div>
       </td>
      </tr>
	  <tr>
       <td valign="top">
       <label for="empPhone"> Phone  </label>
       </td>
       <td>
       <input id="empPhone" type="text" name="empPhone" size="12" value=""/>
       <div class="myErrors"></div>
       </td>
      </tr>    
      <tr>
       <td colspan="2">
        &nbsp;
       </td>
      </tr>
      <tr>
       
       <td colspan="2" align="center">
        <input id="processForm" type="submit" value="Add New Employee" />
       </td>
      </tr>
      </table>
   </form>
  </div>
 </div>
 <div></div>
</body>
</html>