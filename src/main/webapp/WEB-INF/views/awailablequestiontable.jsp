<script src="https://unpkg.com/ag-grid-community/dist/ag-grid-community.min.js"></script>
 
</head>
<body>
  <div id="myGrid" style="height:100%; width:100%;" class="ag-theme-material"></div>
  
</body>
		<script>
		var columnDefs = [
			  {headerName: "Question", field: "question",sortable: false, filter: true},
			  {headerName: "Option1", field: "opt1",sortable: false, filter: true},
			  {headerName: "Option2", field: "opt2",sortable: false, filter: true	},
			  {headerName: "Option3", field: "opt3",sortable: false, filter: true	},
			  {headerName: "Option4", field: "opt4",sortable: false, filter: true	},
			  {headerName: "Answer", field: "answer",sortable: false, filter: true	},
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
	
	



