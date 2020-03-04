<!DOCTYPE html>
<html>
<head>
  <title>Online Examination System</title>
  <link rel="stylesheet" type="text/css" href="css/profile-style.css">
</head>
<body>
<div class="wrap">
  <h2>Profile</h2>
  <form action="/updateprofile" method="post" enctype="multipart/form-data">
    <input type="text" name="name" placeholder="Your Name" value="${user.name}">
     <input type="email" name="email" placeholder="Email" value="${user.email}" >
      <input type="text" name="userName" placeholder="Uersname" value="${user.userName}">
       <input type="text" name="mobile" placeholder="Mobile N0." value="${user.mobile}">
        <input type="file" name="file" placeholder="Upload Prolfile" value="${user.imageName}">
         <button  type="submit" >Edit Profile </button>
  </form>
</div>
</body>
</html>

     