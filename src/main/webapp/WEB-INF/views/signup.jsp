<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Registration Form</title>
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css">
  <link rel="stylesheet" href="css/reg.css">
</head>
<body style="background-image: url('img/bg.jpg')">

<div class="wrapper">
  <div class="title">
    Register Here
  </div>
  
  
  <div class="form">
  <form action="/addrecord">
    <div class="input_field">
      <input name="name" type="text" placeholder="Name" class="input" required="required">
      <i class="fas fa-user"></i>
    </div>
    <div class="input_field">
      <input name="userName" type="text" placeholder="Username" class="input" required="required">
      <i class="far fa-envelope"></i>
    </div>
    <div class="input_field">
      <input name="email" type="email" placeholder="Email" class="input" required="required">
      <i class="far fa-envelope"></i>
    </div>
    <div class="input_field">
      <input name="password" type="password" required="required" placeholder="Password" class="input">
      <i class="fas fa-lock"></i>
    </div>
     <div class="input_field">
     
      <input name="roles" type="radio" value="faculty" >As Examiner &nbsp;</input>
      <input name="roles" type="radio" value="student" required="required" checked="checked">As Student</input>
    
    </div>
    <div class="btn1">
      <button class="btn" type="submit">Register</button>
    </div>
   </form> 
  </div>
</div>	
	
</body>
</html>