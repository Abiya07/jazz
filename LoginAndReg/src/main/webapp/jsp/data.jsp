<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
 <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" />
  <script src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>

  <script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
  <link href="https://cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css" rel="stylesheet" />

</head>
<body>
 <br>
      <br>
      <div class="row">
        <div class="col-lg-1"></div>
        <div class="col-lg-6">
          <div>
            <table id="dataList" class="table" data-page-length="10" cellspacing="0" width="100%" />
          </div>
        </div>
      </div>
      
      <script>
      $(function() {
    	  var columnArray = [{
    	      title: "id",
    	      data: "id",
    	      targets: 0
    	    },
    	    {
    	      title: "username",
    	      data: "username",
    	      targets: 1
    	    },
    	    {
      	      title: "password",
      	      data: "password",
      	      targets: 2
      	    },
      	  {
      	      title: "firstname",
      	      data: "firstname",
      	      targets: 3
      	    },
      	  {
      	      title: "lastname",
      	      data: "lastname",
      	      targets: 4
      	    },
      	  {
      	      title: "email",
      	      data: "email",
      	      targets: 5
      	    },
      	  {
      	      title: "address",
      	      data: "address",
      	      targets: 6
      	    },
      	  {
      	      title: "phone",
      	      data: "phone",
      	      targets: 7
      	    },
      	  {
      	      title: "createddate",
      	      data: "createddate",
      	      targets: 8
      	    }
    	  ];

    	  $('#dataList').DataTable({
    	    ajax: {
    	      url: 'http://localhost:8080/LoginAndReg/viewpage/jdata',
    	      type: 'GET',
    	      dataSrc: ''
    	    },
    	    bBootstrapLayout: true,
    	    columns: columnArray,
    	    columnDefs: [{
    	      render: function(data, type, row) {
    	        return data;
    	      },
    	      targets: 0
    	    }, {
    	      render: function(data, type, row) {
    	        var html = ' ';

    	        return html;
    	      },
    	      
    	    }]
    	  });
    	});

      
      </script>
      
</body>
</html>