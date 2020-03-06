<!DOCTYPE html>
<html>
<head>
<title>Online Examination System</title>
<link rel="stylesheet" type="text/css" href="css/profile-style.css">
<script class="jsbin"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
	
</head>
<body>
	<div class="wrap">
		<h2>Profile</h2>

		<div class="image">
			<img id="blah" src="/upload/${user.imageName}" alt="your image" />
		</div>
		<form action="/updateprofile" method="post"
			enctype="multipart/form-data">
			<input type="text" name="name" placeholder="Your Name"
				value="${user.name}"> <input type="email" name="email"
				placeholder="Email" value="${user.email}"> <input
				type="text" name="userName" placeholder="Uersname"
				value="${user.userName}"> <input type="text" name="mobile"
				placeholder="Mobile N0." value="${user.mobile}">

			<div class="u_btn">
			Upload Profile
			
				<input type="file" class="hide_file" name="file" placeholder="Upload Prolfile"
					accept="image/gif, image/jpeg, image/png" onchange="readURL(this);">
	</div>
			

			<button type="submit">Edit Profile</button>
		</form>
	</div>
	<script>
		function readURL(input) {
			if (input.files && input.files[0]) {
				var reader = new FileReader();

				reader.onload = function(e) {
					$('#blah').attr('src', e.target.result);
				};

				reader.readAsDataURL(input.files[0]);
			}
		}
	</script>
</body>
</html>

