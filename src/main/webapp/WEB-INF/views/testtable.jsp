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
button{
background-color:#bfc1c2;
border:none;
color:#000;
width:100px;
padding:7px 7px;
text-align:center;
text-decoration:none;
display:block;
font-size:12px;
margin:4px 4px;
cursor:pointer;
}
</style>
</head>
<body>



	<h2>Tests...</h2>

	<table>
		<tr>
			<th>Test Name</th>
			<th>Duration</th>
			<th>Cuttoff</th>
			<th>No of Questions</th>
			<th>marks for correct Ans</th>
			<th>Marks for wrong ans</th>
			<th>Date of expiry</th>
			<th>time of expiry</th>
			<th>Tid</th>
			<th>Edit</th>
		</tr>
		<c:forEach var="test" items="${testList}">

			<tr>
				<td>${test.testName}</td>
				<td>${test.duration}</td>
				<td>${test.cutoff}</td>
				<td>${test.nQuestions}</td>
				<td>${test.correct}</td>
				<td>${test.incorrect}</td>
				<td>${test.expiry}</td>
				<td>${test.expiryTime}</td>
				<td>${test.testId}</td>
				<td>
					<form action="/showque">
						<input name="id" value="${test.testId}" style="display: none;">
						<button type="submit">Open</button>
					</form>
					<form action="/updatetestpage">
						<input name="id" value="${test.testId}" style="display: none;">
						<button type="submit">Edit</button>
					</form>
					<form action="/getlink">
						<input name="id" value="${test.testId}" style="display: none;">
						<button type="submit">Get Link</button>
					
					</form>
				</td>

			</tr>
		</c:forEach>



	</table>
	<center>
		<h1>${msg}</h1>
	</center>

</body>
</html>