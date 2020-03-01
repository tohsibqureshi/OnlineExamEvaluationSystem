


<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Registration Form</title>
<link rel="stylesheet" href="css/student-register.css">
</head>
<body>

	<div class="wrapper">
		<div class="title">Registration Form</div>
		<div class="form">
			<form action="/addstudentdetails/${testId}">
				<div class="inputfield">
					<label>First Name </label> <input name="firstname" type="text"
						class="input" required="required">
						
<%-- 						<input name="testId" type="text" value="${testId}" --%>
<!-- 						class="input" required="required"> -->
				</div>
				<div class="inputfield">
					<label>Last Name </label> <input name="lastname"
						required="required" type="text" class="input">
				</div>

				<div class="inputfield">
					<label>Gender</label>
					<div class="custom_select">
						<select name="gender" required="required">
							<option value="">Select</option>
							<option value="male">Male</option>
							<option value="female">Female</option>
						</select>
					</div>
				</div>
				<div class="inputfield">
					<label>Email Address</label> <input name="email"
						required="required" type="email" class="input">
				</div>
				<div class="inputfield">
					<label>Phone Number</label> <input name="phone" type="tel" pattern="[0-9]{10}"
						required="required" class="input">
				</div>
				
				<div class="inputfield">
					<label>College</label> <input name="institute" type="text"
						required="required" class="input">
				</div>
				
					<div class="custom_select">
						<select name="branch" required="required">
							<option value="">Select</option>
							<option value="cs">CSE</option>
							<option value="it">IT</option>
							<option value="ec">EC</option>
							<option value="me">ME</option>
						</select>
					</div>


				<div class="inputfield">

					<button type="submit" id="Register" class="btn">Submit</button>

				</div>
			</form>
		</div>
	</div>

</body>
</html>


