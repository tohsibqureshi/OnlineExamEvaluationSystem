<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Registration Form</title>
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css">
  <link rel="stylesheet" href="css/reg.css">
  <script
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>

</head>
<body ng-app="dateInputExample">
<script>
   angular.module('dateInputExample', [])
     .controller('DateController', ['$scope', function($scope) {
       $scope.example = {
         
         currentDate: new Date()
       };
       
     
     }]);
</script>
<div class="wrapper">
  <div class="title">
      <strong>Create Test Here</strong>
  </div>
  
  
  <div class="form" ng-controller="DateController as dateCtrl">
  <form action="/addtest">
    <div class="input_field">
    <input name="F_id" type="number" class="input"   value="${user.userId}" readonly="" style="display:none;" >
    </div>
    
    <div class="input_field">
   
    
    
      <input name="testName" type="text" placeholder="Name of Test" class="input" required="required">

    </div>
    <div class="input_field">
      <input name="duration" type="number" placeholder="Duration" class="input" required="required">

    </div>
    <div class="input_field">
      <input name="cutoff" type="number" required="required" placeholder="Cuttoff" class="input" required="required">
      
    </div>
    <div class="input_field">
      <input id="exampleInput" name="expiry" type="date" required="required" min="{{example.currentDate | date: 'yyyy-MM-dd'}}" placeholder="Test availabel till"  class="input" required="required">
      <input name="expiryTime" type="time"  required="required" placeholder="Test availabel time"  class="input" required="required">
  
    </div>
    <div class="input_field">
      <input name="nQuestions" type="number" required="required" placeholder="No of questions" min="2" class="input" required="required">
      
    </div>
    <div class="input_field">
      <input name="correct" type="number" required="required" placeholder="Marks of correct answer" class="input" required="required">
          </div>
    <div class="input_field">
      <input name="incorrect" type="number" required="required" placeholder="Marks of incorrect answer" class="input" required="required">
      
    </div>
   
    <div class="btn1">
      <button class="btn" type="submit" >Upload Questions</button>
    </div>
   </form> 
  </div>
</div>	
	

</body>
</html>