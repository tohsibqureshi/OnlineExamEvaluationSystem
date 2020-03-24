<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<head>
<title>Bootstrap Example</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>

<div class="container bootstrap snippet">
	<div class="row">
		<div class="col-sm-10">
			<h1>${user.userName}</h1>
		</div>

	</div>
	<div class="row">
	<form class="form" action="/updateprofile" method="post" enctype="multipart/form-data" id="registrationForm">
				
		<div class="col-sm-3">
			<!--left col-->

		
				<div class="text-center">
					<img src="upload/${user.imageName}"
						class="avatar img-circle img-thumbnail" alt="avatar">
					<h6>Upload a different photo...</h6>
					<input type="file" name="file"
						class="text-center center-block file-upload">
				</div>
				</hr>
				<br>


				<div class="panel panel-default">
					<div class="panel-heading">
						Website <i class="fa fa-link fa-1x"></i>
					</div>
					<div class="panel-body">
						<a href="http://bootnipets.com">myWork.com</a>
					</div>
				</div>
		</div>
		<!--/col-3-->
		<div class="col-sm-9">
			<ul class="nav nav-tabs">
				<li class="active"><a data-toggle="tab" href="#home">Home</a></li>

			</ul>


			<div class="tab-content">
				<div class="tab-pane active" id="home">
					<hr>
							<div class="form-group">

							<div class="col-xs-6">
								<label for="first_name"><h4>Full name</h4></label> <input
									type="text" class="form-control" name="first_name"
									id="first_name" value="${user.name}" title="Name.">
							</div>
						</div>


						<div class="form-group">

							<div class="col-xs-6">
								<label for="phone"><h4>Username</h4></label> <input type="text"
									class="form-control" name="userName" id="phone"
									value="${user.userName}" title="enter your Username.">
							</div>
						</div>

						<div class="form-group">
							<div class="col-xs-6">
								<label for="mobile"><h4>Mobile</h4></label> <input type="text"
									class="form-control" name="mobile" id="mobile"
									value="${user.mobile}" title="enter your mobile number if any.">
							</div>
						</div>
						<div class="form-group">

							<div class="col-xs-6">
								<label for="email"><h4>Email</h4></label> <input type="email"
									class="form-control" name="email" id="email"
									value="${user.email}" title="enter your email.">
							</div>
						</div>
						<div class="form-group">
							<div class="col-xs-12">
								<br>
								<button class="btn btn-lg btn-success" type="submit">
									<i class="glyphicon glyphicon-ok-sign"></i> Save
								</button>
								<button class="btn btn-lg" type="reset">
									<i class="glyphicon glyphicon-repeat"></i> Reset
								</button>
							</div>
						</div>
					

					<hr>

				</div>
			</div>
			</form>
			<!--/tab-pane-->
		</div>
		<!--/tab-content-->
</form>
	</div>
	<!--/col-9-->
</div>
<!--/row-->


<script>
	$(document).ready(function() {

		var readURL = function(input) {
			if (input.files && input.files[0]) {
				var reader = new FileReader();

				reader.onload = function(e) {
					$('.avatar').attr('src', e.target.result);
				}

				reader.readAsDataURL(input.files[0]);
			}
		}

		$(".file-upload").on('change', function() {
			readURL(this);
		});
	});
</script>
