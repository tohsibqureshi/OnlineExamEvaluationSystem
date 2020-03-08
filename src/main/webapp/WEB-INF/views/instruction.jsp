<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<style>

.instruction h1{
		font-size: 28px;
	    text-align: left;
		padding-top: 160px;

}
.instruction h1::after{
	content: '';
	background: #ff4d73;
	display: block;
	height: 3px;
	width: 190px;
	margin: 5px;
	

}
.instruction ol
{
	margin-top: 30px;
	margin-left: 10px;
list-style-type: none;

}
.instruction ol li{
	line-height: 40px;
	font-size: 18px;
	position: relative;
}
.instruction ol li::after{
	content: '';
	height: 9px;
	width: 9px;
	background: #ff4d73;
	transform: rotate(45deg);
	position: absolute;
	top: 17px;
	left: -25px;
}


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

	
	<link rel="stylesheet" href="css/instruction.css">
</head>
<body>
<section class="instruction">
	<div class="content-box">
		<div class="container">
			<div class="row">
				<div class="col-md-6">
					<h1><strong>Test Instructions</strong></h1>
					<ol>
						<li> Before taking test , please make sure that:
						     <br>You have a proper internet connection.
							<br>Your webcam is Working fine.
						</li>
						<li> This test contains Multiple Choice Question on Mathematical Aptitude.</li>
						<li>Your webcam will be recorded during the test.  Please do <bold>NOT</bold> use your mobile phone or other electronic devices.  Please do <bold>NOT</bold> talk to anyone during the test.</li>
						<li> This test is window proctored. Please do <bold>NOT</bold> navigate away from the test window during the test.  If the system detects that you have opened any other application (browser) your test will be terminated.</li>
				
					</ol>
				</div>
			
			</div>
		</div>
	</div>
</section>

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