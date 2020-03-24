<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Registration Form</title>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.8.1/css/all.css">
	
	
	<link rel="icon" href="img/tsicon.png" type="image/x-icon">
	
<link rel="stylesheet" href="css/reg.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>

</head>
<body ng-app="dateInputExample">
	<script>
		angular.module('dateInputExample', []).controller('DateController',
				[ '$scope', function($scope) {
					$scope.example = {

						currentDate : new Date()
					};

				} ]);
	</script>
	<div class="wrapper">
		<div class="title">
			<strong>Create Test Here</strong>
		</div>


		<div class="form" ng-controller="DateController as dateCtrl">
			<form action="/updatetest">
				<div class="input_field">
					<input name="fId" type="number" class="input"
						value="${test.fId}" style="display: none;"> 
					<input  name="testId" type="number" class="input" value="${test.testId}"
						style="display: none;">
				</div>

				<div class="input_field">



					<input name="testName" value="${test.testName}" type="text"
						placeholder="Name of Test" class="input" required="required">

				</div>
				<div class="input_field">
					<input name="duration" value="${test.duration}" type="number"
						placeholder="Duration" class="input" required="required">

				</div>
				<div class="input_field">
					<input name="cutoff" value="${test.cutoff}" type="number"
						required="required" placeholder="Cuttoff" class="input"
						required="required">

				</div>
				<div class="input_field">
					<input id="exampleInput" name="expiry" value="${test.expiry}"
						type="date" required="required"
						min="{{example.currentDate | date: 'yyyy-MM-dd'}}"
						placeholder="Test availabel till" class="input"
						required="required"> <input name="expiryTime"
						value="${test.expiryTime}" type="time" required="required"
						placeholder="Test availabel time" class="input"
						required="required">

				</div>
				<div class="input_field">
					<input name="nQuestions" value="${test.nQuestions}" type="number"
						required="required" placeholder="No of questions" min="2"
						class="input" required="required">

				</div>
				<div class="input_field">
					<input name="correct" value="${test.correct}" type="number"
						required="required" placeholder="Marks of correct answer"
						class="input" required="required">
				</div>
				<div class="input_field">
					<input name="incorrect" value="${test.incorrect}" type="number"
						required="required" placeholder="Marks of incorrect answer"
						class="input" required="required">

				</div>
			 Previous Privacy	${test.privacy}
				<div class="input_field">
				
			    <input name="privacy" type="radio" value="public" class="input">Public &nbsp;</input>
			    <input name="privacy" type="radio" value="private" required="required" class="input" >Private</input>
			  
			  </div>
		
				
				<div class="btn1">
					<button class="btn" type="submit">Update Test</button>
				</div>
			</form>
		</div>
	</div>


</body>
</html>