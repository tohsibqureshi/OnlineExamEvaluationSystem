<script src="https://unpkg.com/ag-grid-community/dist/ag-grid-community.min.js"></script>
 
</head>
<body>
  <div id="myGrid" style="height:100%; width:100%;" class="ag-theme-material"></div>
  
</body>
		<script>
		var columnDefs = [
			  {headerName: "Id", field: "id",sortable: false, filter: true},
			  {headerName: "corrwectans ", field: "correctOpt",sortable: false, filter: true},
			  {headerName: "Option id", field: "queId",sortable: false, filter: true	},
			  {headerName: "corrwectans ", field: "correctOpt",sortable: false, filter: true},
			  {headerName: "Option id", field: "queId",sortable: false, filter: true	},
			 
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
	
	



