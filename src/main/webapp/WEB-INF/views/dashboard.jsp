<script src="https://unpkg.com/ag-grid-community/dist/ag-grid-community.min.js"></script>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/bootstrap.min.css">
<!-- Material Design Bootstrap -->
<link rel="stylesheet" href="css/mdb.min.css">

<link rel="icon" href="img/tsicon.png" type="image/x-icon">

<style>
.layout {
	
}

div.card {
	width: 2500px;
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0
		rgba(0, 0, 0, 0.19);
	text-align: center;
	margin: 50px;
}

div.header {
	background-color: #4CAF50;
	color: white;
	padding: 10px;
	font-size: 40px;
}

div.container {
	padding: 10px;
}
</style>
</head>
<body>
	<div class="row ">

		<div class="card">
			<div class="header">
				<h1>${noOftest}</h1>
			</div>
              
			<div class="container">
				<p>Total Tests hosted</p>
			</div>
		</div>

		

	</div>
	
	<div id="myGrid" style="height:100%; width:100%;" class="ag-theme-material"></div>
	  

	<script>
	var columnDefs = [
		  {headerName: "Test Name", field: "testName",sortable: false, filter: true,width: 750},
		   {headerName: "Show Results" ,field: "testId",pinned:'right',width:300, cellRenderer: function(params) {
		      return '<a title="result" href="/showresult?testId='+ params.value+'"><i class="material-icons" style="padding-top:5px;">open_in_browser</i>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;View Submission</a>'
		  }}
		];
		    
		// specify the data
		var rowData = ${json};
		    
		// let the grid know which columns and what data to use
		var gridOptions = {
		  columnDefs: columnDefs,
		  rowData: rowData,
		 
		};
		
	
	
	
		// setup the grid after the page has finished loading
		document.addEventListener('DOMContentLoaded', function() {
		    var gridDiv = document.querySelector('#myGrid');
		    new agGrid.Grid(gridDiv, gridOptions);
		});

</script>


</body>
</html>