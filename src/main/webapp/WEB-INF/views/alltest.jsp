<style>
<!--

-->
</style>

  <div id="myGrid" style="height:100%; width:100%;" class="ag-theme-material"></div>
  
<script src="https://unpkg.com/ag-grid-community/dist/ag-grid-community.min.js"></script>
		<script>
		var columnDefs = [
			  {headerName: "Test Name", field: "testName",sortable: false, filter: true},
			  {headerName: "Duration", field: "duration",sortable: false, filter: true},
			  {headerName: "Cuttoff", field: "cutoff",sortable: false, filter: true	},
			  {headerName: "No of Questions", field: "nQuestions",sortable: false, filter: true	},
			  {headerName: "Marks for correct Answers", field: "correct",sortable: false, filter: true	},
			  {headerName: "Marks for wrong answers", field: "incorrect",sortable: false, filter: true	},
			  {headerName: "Test Expiry Date", field: "expiry",sortable: false, filter: true	},
			  {headerName: "Test Expiry Time", field: "expiryTime",sortable: false, filter: true	},
			  {headerName: "Test Pivacy", field: "privacy",sortable: false, filter: true	},
			  {headerName: "Action", field: "testId",pinned: 'right',width:150,cellRenderer: function(params) {
			      return '<a href="/showque?id='+ params.value+'"><i class="material-icons">open_in_browser</i></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'+'<a href="/getlink?id='+ params.value+'"><i class="material-icons md-48">insert_link</i></a>'
			 
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



<!-- 	<h2>Tests...</h2> -->

<!-- 	<table> -->
<!-- 		<tr> -->
<!-- 			<th>Test Name</th> -->
<!-- 			<th>Duration</th> -->
<!-- 			<th>Cuttoff</th> -->
<!-- 			<th>No of Questions</th> -->
<!-- 			<th>marks for correct Ans</th> -->
<!-- 			<th>Marks for wrong ans</th> -->
<!-- 			<th>Date of expiry</th> -->
<!-- 			<th>time of expiry</th> -->
<!-- 			<th>Tid</th> -->
			
<!-- 			<th>Edit</th> -->
<!-- 			<th>Fid</th> -->
<!-- 		</tr> -->
<%-- 		<c:forEach var="test" items="${testList}"> --%>

<!-- 			<tr> -->
<%-- 				<td>${test.testName}</td> --%>
<%-- 				<td>${test.duration}</td> --%>
<%-- 				<td>${test.cutoff}</td> --%>
<%-- 				<td>${test.nQuestions}</td> --%>
<%-- 				<td>${test.correct}</td> --%>
<%-- 				<td>${test.incorrect}</td> --%>
<%-- 				<td>${test.expiry}</td> --%>
<%-- 				<td>${test.expiryTime}</td> --%>
<%-- 				<td>${test.testId}</td> --%>
<%-- 				<td>${test.fId}</td> --%>
<!-- 				<td> -->
<!-- 					<form action="/showque"> -->
<%-- 						<input name="id" value="${test.testId}" style="display: none;"> --%>
<!-- 						<button type="submit">Open</button> -->
<!-- 					</form> -->
<!-- 					<form action="/getlink"> -->
<%-- 						<input name="id" value="${test.testId}" style="display: none;"> --%>
						
<!-- 						<button type="submit">Get Link</button> -->
<%-- 						${link} --%>
<!-- 					</form> -->
<!-- 				</td> -->

<!-- 			</tr> -->
<%-- 		</c:forEach> --%>



<!-- 	</table> -->
<%-- 	<center> --%>
<%-- 		<h1>${msg}</h1> --%>
<%-- 	</center> --%>

<!-- </body> -->
<!-- </html> -->