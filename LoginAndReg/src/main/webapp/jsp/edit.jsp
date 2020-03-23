<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
			<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
            <title>Registration</title>
  

</head>
<script type="text/javascript">

 function nullcheck(){
	 var Name=document.regForm.username.value;
	 var Password=document.regForm.password.value;
	 var Mobile=document.regForm.phone.value;
	 var Email=document.regForm.email.value;
	 var Firstname=document.regForm.firstname.value;
	 var Lastname=document.regForm.lastname.value;
	 var Address=document.regForm.address.value;
	 var reg = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
	 var name=/^[A-Za-z0-9]+$/;
	 var fname=/^[A-Za-z]+$/;
	 var lname=/^[A-Za-z]+$/;
      if(Name==""||Name==null){
		  alert("name cannot be blank");
		 return false;
	 }
     else if (name.test(Name) == false) {
	 alert("name is invalid");
	 return false;
	  }
     else if (fname.test(Firstname) == false) {
    	 alert("firstname is invalid");
    	 return false;
    	  }
     else if (lname.test(Lastname) == false) {
    	 alert("lastname is invalid");
    	 return false;
    	  }
     else if(Password==""||Password==null){
		 alert("Password cannot be blank");
		 return false;
	 }else if(Password.length<=5){
		 alert("Password is weak");
		 return false;
	 }
	else if(Firstname==""||Firstname==null){
		  alert("firstname cannot be blank");
		 return false;
	 }
	 else if(Lastname==""||Lastname==null){
		  alert("lastname cannot be blank");
		 return false;
	 }
	 else if(Email==""||Email==null){
		 alert("email cannot be blank");
		 return false;
	 }
     else if (reg.test(Email) == false) 
     {
         alert('Invalid Email Address');
         return false;
     }
    
     else if(Address==""||Address==null){
		 alert("Address cannot be blank");
		 return false;
	 }
     else if(Mobile==""||Mobile==null){
		 alert("mobile cannot be blank");
		 return false;
	 }else if(Mobile.length!=10){
		 alert("enter valid phonenumber preceeding zero ");
			return false;
		} else if (isNaN(Mobile)) {
			alert("Please enter a valid phone number");
			return false;
		}
	}
	function validate() {
		var retvalue;
		retvalue = nullcheck();
		if (retvalue == false) {
			return retvalue;
		}
	}
</script>
<body>
<form:form name="regForm" id="regForm" modelAttribute="user" action="editsave" method="get" onsubmit="return validate()">
 <table align="center">
 
                    <tr>
                        <td>
                            <form:label path="username">User name</form:label>
                        </td>
                        <td>
                            <form:input path="username" name="username" id="username" disabled="true" />
                           
                            
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <form:label path="password">Password</form:label>
                        </td>
                        <td>
                            <form:password path="password" name="password" id="password" maxlength="7" value="${user.password }"/>
                            
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <form:label path="firstname">FirstName</form:label>
                        </td>
                        <td>
                            <form:input path="firstname" name="firstname" id="firstname" />
                            
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <form:label path="lastname">LastName</form:label>
                        </td>
                        <td>
                            <form:input path="lastname" name="lastname" id="lastname"/>
                           
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <form:label path="email">Email</form:label>
                        </td>
                        <td>
                            <form:input path="email" name="email" id="email" />
                           
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <form:label path="address">Address</form:label>
                        </td>
                        <td>
                            <form:input path="address" name="address" id="address" />
                            
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <form:label path="phone">Phone</form:label>
                        </td>
                        <td>
                            <form:input path="phone" name="phone" id="phone" maxlength="10" />
                           
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>                   
                            <form:button id="edit" name="edit" >Edit</form:button>
                        </td>
                    </tr>
                    <tr></tr>
                    <tr>
                        <td></td>
                        <td><a href="home.jsp">Home</a>
                        </td>
                    </tr>
                </table>
</form:form>
</body>
</html>