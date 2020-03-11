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
			  {headerName: "Action", field: "queId",pinned:'right',width:150, cellRenderer: function(params) {
				  
				  
				 
				  
				
			      		return '<a title="Edit" href="/updatepage?id='+ params.value+'"><i class="material-icons">edit</i></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'+'<a title="Delete" href="/deleteque?id='+ params.value+'"><i class="material-icons">delete</i></a>'
		
			  }}
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
	
	




<%-- <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> --%>
<!-- <!DOCTYPE html> -->
<!-- <html> -->
<!-- <head> -->
<!-- <style> -->


<!-- </style> -->
<!-- </head> -->
<!-- <body> -->

<!-- 	<h2>Questions</h2> -->

<!-- 	<table> -->
<!-- 		<tr> -->

<!-- 			<th>Question</th> -->
<!-- 			<th>Option1</th> -->
<!-- 			<th>Option2</th> -->
<!-- 			<th>Option3</th> -->
<!-- 			<th>Option4</th> -->
<!-- 			<th>Answer</th> -->
<!-- 			<th>Edit</th> -->

<!-- 		</tr> -->
<%-- 		<c:forEach var="que" items="${queList}"> --%>

<!-- 			<tr> -->
<%-- 				<td>${que.question}</td> --%>
<%-- 				<td>${que.opt1}</td> --%>
<%-- 				<td>${que.opt2}</td> --%>
<%-- 				<td>${que.opt3}</td> --%>
<%-- 				<td>${que.opt4}</td> --%>
<%-- 				<td>${que.answer}</td> --%>
<!-- 				<td> -->
<!-- 					<form action="/updatepage"> -->
<%-- 						<input name="id" value="${que.queId}" style="display: none;"> --%>
<!-- 						<button type="submit">Edit</button> -->
<!-- 					</form> -->
<!-- 				</td> -->
<!-- 			</tr> -->
<%-- 		</c:forEach> --%>
<!-- 	</table> -->

<!-- </body> -->
<!-- </html> -->