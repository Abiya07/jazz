
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<title>Login</title>
<div align="center">
<font color="green"><h3>LOGIN FORM</h3></font>
</div>
<style type="text/css">
.error{
color:red;
}
</style>
<script type="text/javascript">
function nullcheck(){
	 var Name=document.regForm.username.value;
	 var Password=document.regForm.password.value;
	 var name=/^[A-Za-z0-9]+$/;
	 if(Name==""||Name==null){
		  alert("name cannot be blank");
		 return false;
	 }
    else if (name.test(Name) == false) {
	 alert("name is invalid");
	 return false;
	  }
    else if(Password==""||Password==null){
		 alert("Password cannot be blank");
		 return false;
	 }else if(Password.length<=5){
		 alert("Password is weak");
		 return false;
	 }
}
function validate(){
	 var retvalue;
	 retvalue=nullcheck();
	 if(retvalue==false){
	 return retvalue;
}
	 } 

	  </script>
</head>
<body>
	<form:form id="loginForm" modelAttribute="login" action="loginProcess"
		method="post" onsubmit="return validate()">
		<table align="center">
			<tr>
				<td><form:label path="username">Username: </form:label></td>
				<td><form:input path="username" name="username" id="username" />
				<td><form:errors path="username" cssClass="error"/></td>
				</td>
			</tr>
			<tr>
				<td><form:label path="password">Password:</form:label></td>
				<td><form:password path="password" name="password"
						id="password" /></td>
						<td><form:errors path="password" cssClass="error"/></td>
			</tr>
			<tr>
				<td></td>
				<td align="left"><form:button id="login" name="login" class="btn btn-primary">Login</form:button>
				<td><a href="home.jsp" class="btn btn-primary"  aria-pressed="true">Home</a></td>
			</tr>
		</table>
	</form:form>
	<table align="center">
		<tr>
			<td style="font-style: italic; color: red;">${message}</td>
		</tr>
	</table>
</body>
</html>