<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="robots" content="noindex,nofollow" />
<title>Edit or Update Employee</title>
<link rel="stylesheet" href="/resources/themes/master.css" type="text/css" />
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
 $("#empStartDate").datepicker({
    onClose: function() {
        $('#empStartDate').valid();
    }
});
 
 jQuery.validator.setDefaults({
  errorPlacement: function(error, element) {
      error.appendTo(element.parent().find('div.myErrors'));
     }
 });
  
 
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
  
 $("#frmUpdateEmployee").validate({
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
	     
    empStartDate : {
     required: true,
              usaDate : true
            },
     
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
   <form id="frmUpdateEmployee" name="frmUpdateEmployee" method="POST" action="updateEmployee">
     
      <table>
      <tr>
       <td valign="top" colspan="2" align="center">
       <b> Employee Edit Form</b>
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
       <input type="text"  readonly="readonly" name="empId"  id="empId" size="15"
            value="<c:out value="${employee.empId}"/>" />
       <div class="myErrors"></div>
       </td>
      </tr>
	  <tr>
       <td valign="top">
       <label for="empFirstName"> First Name  </label>
       </td>
       <td>
       <input id="empFirstName" type="text" name="empFirstName" size="50" value="<c:out value="${employee.empFirstName}"/>" />
       <div class="myErrors"></div>
       </td>
      </tr>
      <tr>
       <td valign="top">
       <label for="empLastName"> Last Name  </label>
       </td>
       <td>
       <input id="empLastName" type="text" name="empLastName" size="50" value="<c:out value="${employee.empLastName}"/>" />
       <div class="myErrors"></div>
       </td>
      </tr>
	  
	  <tr>
       <td valign="top">
       <label for="empAddr1"> Address 1  </label>
       </td>
       <td>
       <input id="empAddr1" type="text" name="empAddr1" size="50" value="<c:out value="${employee.empAdd1}"/>" />
       <div class="myErrors"></div>
       </td>
      </tr>
	  <tr>
       <td valign="top">
       <label for="empAddr2"> Address 2  </label>
       </td>
       <td>
       <input id="empAddr2" type="text" name="empAddr2" size="50" value="<c:out value="${employee.empAdd2}"/>" />
       <div class="myErrors"></div>
       </td>
      </tr>
	  <tr>
       <td valign="top">
       <label for="empCity"> City  </label>
       </td>
       <td>
       <input id="empCity" type="text" name="empCity" size="50" value="<c:out value="${employee.empCity}"/>" />
       <div class="myErrors"></div>
       </td>
      </tr>
      
      <tr>
       <td valign="top">
       <label for="empStartDate"> Start Date  </label>
       </td>
       <td align="left">
       <input id="empStartDate" type="text" name="empStartDate" size="10" value="<fmt:formatDate value="${employee.empStartDate}" pattern="MM/dd/yyyy" />"
          />&nbsp;(mm/dd/yyyy)
       
       </td>
      </tr>
      
      
      <tr>
       <td valign="top">
       <label for="empState"> Drop down for car models  </label>
       </td>
       <td>
       <select id="empState" name="empState" title="Please select State">
       <option value="">Select a State</option> 
				<option value="AL" ${employee.empState == 'AL' ? 'selected="selected"' : ''}>Alabama</option> 
				<option value="AK" ${employee.empState == 'AK' ? 'selected="selected"' : ''}>Alaska</option> 
				<option value="AZ" ${employee.empState == 'AZ' ? 'selected="selected"' : ''}>Arizona</option> 
				<option value="AR" ${employee.empState == 'AR' ? 'selected="selected"' : ''}>Arkansas</option> 
				<option value="CA" ${employee.empState == 'CA' ? 'selected="selected"' : ''}>Colorado</option> 
				<option value="CT" ${employee.empState == 'CT' ? 'selected="selected"' : ''}>Connecticut</option> 
				<option value="DE" ${employee.empState == 'DE' ? 'selected="selected"' : ''}>Delaware</option> 
				<option value="DC" ${employee.empState == 'DC' ? 'selected="selected"' : ''}>District Of Columbia</option> 
				<option value="FL" ${employee.empState == 'FL' ? 'selected="selected"' : ''}>Florida</option> 
				<option value="GA" ${employee.empState == 'GA' ? 'selected="selected"' : ''}>Georgia</option> 
				<option value="HI" ${employee.empState == 'HI' ? 'selected="selected"' : ''}>Hawaii</option> 
				<option value="ID" ${employee.empState == 'ID' ? 'selected="selected"' : ''}>Idaho</option> 
				<option value="IL" ${employee.empState == 'IL' ? 'selected="selected"' : ''}>Illinois</option> 
				<option value="IN" ${employee.empState == 'IN' ? 'selected="selected"' : ''}>Indiana</option> 
				<option value="IA" ${employee.empState == 'IA' ? 'selected="selected"' : ''}>Iowa</option> 
				<option value="KS" ${employee.empState == 'KS' ? 'selected="selected"' : ''}>Kansas</option> 
				<option value="KY" ${employee.empState == 'KY' ? 'selected="selected"' : ''}>Kentucky</option> 
				<option value="LA" ${employee.empState == 'LA' ? 'selected="selected"' : ''}>Louisiana</option> 
				<option value="ME" ${employee.empState == 'ME' ? 'selected="selected"' : ''}>Maine</option> 
				<option value="MD" ${employee.empState == 'MD' ? 'selected="selected"' : ''}>Maryland</option> 
				<option value="MA" ${employee.empState == 'MA' ? 'selected="selected"' : ''}>Massachusetts</option> 
				<option value="MI" ${employee.empState == 'MI' ? 'selected="selected"' : ''}>Michigan</option> 
				<option value="MN" ${employee.empState == 'MN' ? 'selected="selected"' : ''}>Minnesota</option> 
				<option value="MS" ${employee.empState == 'MS' ? 'selected="selected"' : ''}>Mississippi</option> 
				<option value="MO" ${employee.empState == 'MO' ? 'selected="selected"' : ''}>Missouri</option> 
				<option value="MT" ${employee.empState == 'MT' ? 'selected="selected"' : ''}>Montana</option> 
				<option value="NE" ${employee.empState == 'NE' ? 'selected="selected"' : ''}>Nebraska</option> 
				<option value="NV" ${employee.empState == 'NV' ? 'selected="selected"' : ''}>Nevada</option> 
				<option value="NH" ${employee.empState == 'NH' ? 'selected="selected"' : ''}>New Hampshire</option> 
				<option value="NJ" ${employee.empState == 'NJ' ? 'selected="selected"' : ''}>New Jersey</option> 
				<option value="NM" ${employee.empState == 'NM' ? 'selected="selected"' : ''}>New Mexico</option> 
				<option value="NY" ${employee.empState == 'NY' ? 'selected="selected"' : ''}>New York</option> 
				<option value="NC" ${employee.empState == 'NC' ? 'selected="selected"' : ''}>North Carolina</option> 
				<option value="ND" ${employee.empState == 'ND' ? 'selected="selected"' : ''}>North Dakota</option> 
				<option value="OH" ${employee.empState == 'OH' ? 'selected="selected"' : ''}>Ohio</option> 
				<option value="OK" ${employee.empState == 'OK' ? 'selected="selected"' : ''}>Oklahoma</option> 
				<option value="OR" ${employee.empState == 'OR' ? 'selected="selected"' : ''}>Oregon</option> 
				<option value="PA" ${employee.empState == 'PA' ? 'selected="selected"' : ''}>Pennsylvania</option> 
				<option value="RI" ${employee.empState == 'RI' ? 'selected="selected"' : ''}>Rhode Island</option> 
				<option value="SC" ${employee.empState == 'SC' ? 'selected="selected"' : ''}>South Carolina</option> 
				<option value="SD" ${employee.empState == 'SD' ? 'selected="selected"' : ''}>South Dakota</option> 
				<option value="TN" ${employee.empState == 'TN' ? 'selected="selected"' : ''}>Tennessee</option> 
				<option value="TX" ${employee.empState == 'TX' ? 'selected="selected"' : ''}>Texas</option> 
				<option value="UT" ${employee.empState == 'UT' ? 'selected="selected"' : ''}>Utah</option> 
				<option value="VT" ${employee.empState == 'VT' ? 'selected="selected"' : ''}>Vermont</option> 
				<option value="VA" ${employee.empState == 'VA' ? 'selected="selected"' : ''}>Virginia</option> 
				<option value="WA" ${employee.empState == 'WA' ? 'selected="selected"' : ''}>Washington</option> 
				<option value="WV" ${employee.empState == 'WV' ? 'selected="selected"' : ''}>West Virginia</option> 
				<option value="WI" ${employee.empState == 'WI' ? 'selected="selected"' : ''}>Wisconsin</option> 
				<option value="WY" ${employee.empState == 'WY' ? 'selected="selected"' : ''}>Wyoming</option>
       </select>
       <div class="myErrors"></div>
       </td>
      </tr>
  <tr>
       <td valign="top">
       <label for="empZIP"> ZIP  </label>
       </td>
       <td>
       <input id="empZIP" type="text" name="empZIP" size="10" maxlength="5"  value="<c:out value="${employee.empZIP}"/>" />
       <div class="myErrors"></div>
       </td>
      </tr>
	  <tr>
       <td valign="top">
       <label for="empPhone"> Phone  </label>
       </td>
       <td>
       <input id="empPhone" type="text" name="empPhone" size="12" value="<c:out value="${employee.empPhone}"/>" />
       <div class="myErrors"></div>
       </td>
      </tr>    
      <tr>
       <td colspan="2">
       <input type="hidden" id="actionType" name="actionType" value="employeeEdit">
        &nbsp;
       </td>
      </tr>
      <tr>
       <td>
        &nbsp;
       </td>
       <td>
        <input id="processForm" type="submit" value="Update Employee" />
       </td>
      </tr>
      </table>
     
   </form>
  </div>
 </div>
 
 
 <div></div>
</body>
</html>