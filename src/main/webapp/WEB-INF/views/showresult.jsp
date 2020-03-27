<script src="https://unpkg.com/ag-grid-community/dist/ag-grid-community.min.js"></script>
 
</head>
<body>
  <div id="myGrid" style="height:100%; width:100%;" class="ag-theme-material"></div>
  
</body>
		<script>
		var columnDefs = [
			  {headerName: "Email", field: "email",sortable: false, filter: true},
			  {headerName: "First Name ", field: "firstname",sortable: false, filter: true},
			  {headerName: "Last Name", field: "lastname",sortable: false, filter: true	},
			  {headerName: "Institute ", field: "institute",sortable: false, filter: true},
			  {headerName: "Branch ", field: "branch",sortable: false, filter: true,width:110},
			  {headerName: "Marks", field: "marks",sortable: false, filter: true,pinned:'right',width:101	},
			  {headerName: "Result", field: "result",sortable: false, filter: true,pinned:'right',width:103	},
			 
			  ];
			    
			// specify the data
			var rowData = ${json};
			    
			// let the grid know which columns and what data to use
			var gridOptions = {
			  columnDefs: columnDefs,
			  rowData: rowData
			};

			// setup the grid after the page has finished loading
			document.addEventListener('DOMContentLoaded', function() {
			    var gridDiv = document.querySelector('#myGrid');
			    new agGrid.Grid(gridDiv, gridOptions);
			});

	</script>
	
	



