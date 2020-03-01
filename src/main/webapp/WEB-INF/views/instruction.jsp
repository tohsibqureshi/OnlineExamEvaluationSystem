<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<style>
table {
	font-family: arial, sans-serif;
	border-collapse: collapse;
	width: 100%;
}

td, th {
	border: 1px solid #dddddd;
	text-align: left;
	padding: 8px;
}

tr:nth-child(even) {
	background-color: #dddddd;
}
</style>
</head>
<body>



	<h2>
		Test is live
	

	</h2>

	<table>
		<tr>
			<th>Test Name</th>
			<th>Duration</th>
			<th>Cuttoff</th>
			<th>No of Questions</th>
			<th>marks for correct Ans</th>
			<th>Marks for wrong ans</th>
			<th>Date of expiry</th>
			<th>Tid</th>
			<th>Edit</th>
		</tr>

			<tr>
				<td>${test.testName}</td>
				<td>${test.duration}</td>
				<td>${test.cutoff}</td>
				<td>${test.nQuestions}</td>
				<td>${test.correct}</td>
				<td>${test.incorrect}</td>
				<td>${test.expiryTime}</td>
				<td>${test.testId}</td>
				<td>
					<form action="/starttest">
						<input name="id" value="${test.testId}" style="display: none;">
						<button type="submit">Start Test</button>
					
						
					</form>
				</td>

			</tr>


	</table>	

</body>
</html>