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

	<h2>Questions</h2>

	<table>
		<tr>

			<th>Question</th>
			<th>Option1</th>
			<th>Option2</th>
			<th>Option3</th>
			<th>Option4</th>
			<th>Answer</th>
			<th>Edit</th>

		</tr>
		<c:forEach var="que" items="${queList}">

			<tr>
				<td>${que.question}</td>
				<td>${que.opt1}</td>
				<td>${que.opt2}</td>
				<td>${que.opt3}</td>
				<td>${que.opt4}</td>
				<td>${que.answer}</td>
				<td>
					<form action="/updatepage">
						<input name="id" value="${que.queId}" style="display: none;">
						<button type="submit">Edit</button>
					</form>
				</td>
			</tr>
		</c:forEach>
	</table>

</body>
</html>