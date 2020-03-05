<!DOCTYPE html>
<html>
<head>
	<title>FeedBack</title>
	<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0">
	<link rel="stylesheet" href="css/feedback.css">
	<link href="https://fonts.googleapis.com/css?family=Quicksand&display=swap" rel="stylesheet">
</head>
<body>
	<div class="container">
		<div class="content-box">
			<div class="left"></div>
			<div class="right">
			<form action="/addfeedback">
				<h2>FeedBack</h2>
				<input type="text" class="field" name="name" placeholder="Your Name">
				<input type="email" class="field" name="email" placeholder="Your Email">
				<input type="text" class="field" name="phone" placeholder="Your Phone No.">
				<textarea class="field area" name="message" placeholder="message"></textarea>
				<button class="btn">Send</button>
			</form>
			</div>
			
		</div>
	</div>
</body>
</html>