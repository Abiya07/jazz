<%@page import="com.spring.dao.UserDAO,com.spring.beans.*,java.util.*"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
   <title>View Page</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css">
 <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script> 
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.2/themes/smoothness/jquery-ui.css" />
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="http://code.jquery.com/ui/1.10.2/jquery-ui.js"></script>
 <style>
 .row{
 padding:50px;
 pading-left:50px;
 }
 .box{
 
 width:10%;
 length:30%;
 
  }
 .active-purple-4 input[type=text]:focus:not([readonly]) {
border: 1px solid #ce93d8;
box-shadow: 0 0 0 1px #ce93d8;
}
.dropbtn {
  background-color: #3498DB;
  color: white;
  padding: 16px;
  font-size: 16px;
  border: none;
  cursor: pointer;
}

.dropbtn:hover, .dropbtn:focus {
  background-color: #2980B9;
}

.dropdown {
  position: relative;
  display: inline-block;
}

.dropdown-content {
  display: none;
  position: absolute;
  background-color: #ebfaf9;
  min-width: 160px;
  overflow: auto;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 1;
}

.dropdown-content a {
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
}

.dropdown a:hover {background-color: #ddd;}

.show {display: block;}

 </style>
 
</head>

<body>

<h1>Data List</h1> 

<label>Search by</label>
	<select id="select">
		<option selected disabled="disabled">--select--</option>
		<option value="username">UserName</option>
		<option value="email">Email</option>
		<option value="phone">PhoneNumber</option>
	</select>
		
<input id="search">
 <!-- 
 <script>

$( "#search" ).autocomplete({
 source: [ ]
});

</script>
 -->

<script>
$(document).ready(function() {
    $(function() {
        $("#search").autocomplete({     
            source : function(request, response) {
              $.ajax({
                   url : "http://localhost:8080/LoginAndReg/viewpage/jdata",
                   type : "GET",
                   data : {
                          term : request.term
                   },
                   dataType : "json",
                   success : function(data) {
                         response(data);
                   }
            });
         }
     });
  });
});
</script>
	<button id="search" onclick="myFunction()" class="btn btn-primary">Search</button>
<button  onclick="myfunctions()" class="btn btn-info">deactivte</button><br>
 


	<div class="pagination-container" align="right">
		<nav>
			<ul class="pagination">
			</ul>
		</nav>
	</div>
 

<table id="mytable" class="table table-striped table-bordered table-sm">
    <thead>
   <tr>

      <th class="th-sm"><input type="checkbox" name="showhide" onchange="checkAll(this)">id</th>
      <th class="th-sm">Name

      </th>
      <th class="th-sm">Password

      </th>
      <th class="th-sm">Firstname

      </th>
      <th class="th-sm">Lastname

      </th>
      <th class="th-sm">Email

      </th>
       <th class="th-sm">Address

      </th>
       <th class="th-sm">Phone

      </th>
       <th class="th-sm">CreateDate

      </th>
      	<th class="th-sm">Status</th>
      	
      <th colspan="2" align="center">Action</th>
     
     
    </tr>
  </thead>
<tbody>
<c:forEach items="${list}" var="user">  
<tr id=" ${user.getId()}">
<td><input type="checkbox" name="check" value="${user.getId()}">${user.getId()}</td>
<td>${user.getUsername()}</td>
<td>${user.getPassword()}</td>  
<td>${user.getFirstname()}</td>
<td>${user.getLastname()}</td>
<td>${user.getEmail()}</td>
<td>${user.getAddress()}</td>
<td>${user.getPhone()}</td>
<td>${user.getCreateddate()}</td>
<td id="status_${user.getId()}">Active</td>
<td><a class="btn btn-info border" href="edit/${user.id}/">Edit</a></td>  
<td><a class="btn btn-info border" href="delete/${user.id}" onclick="return confirm('Are you sure you want to delete this item?');">Delete</a></td>

</tr> 
</c:forEach>
 </tbody>
 
</table> 
<a class="btn btn-primary loc" href="home.jsp">Home</a>
	<div class="pagination-container" align="right">
		<nav>
			<ul class="pagination">
			</ul>
		</nav>
	</div>

	<span class="row" id="demo"></span>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

	<script>

var table='#mytable'
	
	$('.pagination').html('')
	
	var totalRow=$(table+' tbody tr').length
	document.getElementById("demo").innerHTML="Total entries "+totalRow
	var trnum=0
	var maxRows=10;
	var totalRows=$(table+' tbody tr').length
	document.getElementById("demo").innerHTML="Total entries "+totalRows
	$(table+' tr:gt(0)').each(function(){
		trnum++;
	if(trnum > maxRows){
		$(this).hide()
	}
	if(trnum <= maxRows){
		$(this).show()
	}
})
		if(totalRows > maxRows)
			{ 
			var pagenum=Math.ceil(totalRows/maxRows)
			for(var i=1;i<=pagenum;){
				$('.pagination').append('<li class="page-item" data-page = "'+ i +'">\<span class="page-link">'+ i++ +'<span class="sr-only">(current)</span></span>\</li>').show()
			}
			}
	$('.pagination li:first-child').addClass('active')
	$('.pagination li').on('click',function(){
		var pageNum=$(this).attr('data-page')
		var trIndex=0;
		$('.pagination li').removeClass('active')
		$(this).addClass('active')
		$(table+' tr:gt(0)').each(function()
				{
			trIndex++
			if(trIndex>(maxRows*pageNum) || trIndex <=((maxRows*pageNum)-maxRows))
				{
				$(this).hide()
				}
			else{
				$(this).show()
			}
				})
	
			})
			
			
			</script>

	<script type="text/javascript">
 
function checkAll(e){
	var checkboxe = document.getElementsByName('check');
	
	if(e.checked){
		for(var i=0;i < checkboxe.length; i++){
			checkboxe[i].checked = true;
		}
	}else{
		for(var i = 0; i < checkboxe.length; i++){
			checkboxe[i].checked = false;
		}
	}
}

function myfunctions(){
	var checkboxes=document.getElementsByName('check');
	for(var i=0;i<checkboxes.length;i++){
		if(checkboxes[i].checked==true){
			var id=checkboxes[i].value;
			if(document.getElementById('status_'+id).innerHTML=="Active"){
				document.getElementById('status_'+id).innerHTML = "Inactive";
			}
			else{
				document.getElementById('status_'+id).innerHTML = "Active";
			}
		}
	}
}

</script>


<script type="text/javascript">
function myFunction() {
	  var my_id = document.getElementById("select");
	  var val=my_id.value;
	  var input, filter, table, tr, td, i, txtValue;
	  input = document.getElementById("search");
	  filter = input.value.toUpperCase();
	  table = document.getElementById("mytable");
	  tr = table.getElementsByTagName("tr");
	  if(val=="username")
		  {
		  k=1;
		  }
	  else if(val=="email")
	  {
	  k=5;
	  }
	  else if(val=="phone")
	  {
	  k=7;
	  }
	  for (i = 0; i < tr.length; i++) {
	    td = tr[i].getElementsByTagName("td")[k];
	    if (td) {
	      txtValue = td.textContent || td.innerText;
	      if (txtValue.toUpperCase().indexOf(filter) > -1) {
	        tr[i].style.display = "";
	      } else {
	        tr[i].style.display = "none";
	      }
	    }       
	  }
	}
</script>



 <div align="center">
<br/><a href="home.jsp" class="btn btn-primary btn-sm">Back</a>
       <a href="register" class="btn btn-primary btn-sm">Add New User</a> 
</div>


</body>
</html>


