
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Online Examination System</title>
<link rel="stylesheet" href="css/Astyle.css">
<script src="https://kit.fontawesome.com/b99e675b6e.js"></script>
</head>
<body>

	<div class="wrapper">
		<div class="sidebar">
			<h2>Online Examination System</h2>
			<ul>
				<li><a href="/home">Home</a></li>
				<li><a href="/profile">Edit Profile</a></li>
				<li><a href="/create">${createtest }</a></li>
				<li><a href="/testtable">${createdbyme }</a></li>
				<li><a href="/alltest">Available Test</a></li>
				<li><a href="/logout">Logout</a></li>
			</ul>
			<div class="social_media">
				<a href="#"><i class="fab fa-facebook-f"></i></a> <a href="#"><i
					class="fab fa-twitter"></i></a> <a href="#"><i
					class="fab fa-instagram"></i></a>
			</div>
		</div>
		<div class="main_content">
			<div class="header">Welcome ${user.name }</div>
			<div class="info"></div>
		</div>




	</div>

</body>
</html>