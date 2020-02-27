<style>
textarea {
	width: 50%;
	height: 100px;
	padding: 12px 20px;
	box-sizing: border-box;
	border: 2px solid #ccc;
	border-radius: 4px;
	background-color: #f8f8f8;
	resize: none;
}

.opt1 {
	border: 1px solid;
	border-color: lightgrey;
	border-radius: 50px;
	margin-top: 5%;
	padding: 2%;
}

.qbody {
	position: absolute;
	display: inline-block;
	text-align: justify;
	font-family: serif;
	border-color: lightgrey;
	width: 45%;
	height: 78%;
	padding: 10px;
	padding-left: 4%;
	margin-top: 1%;
	padding-right: 2%;
	overflow: auto;
}

button {
	margin-top: 50px;
	text-align: center;
	font-size: 28px;
	width: 200px;
	height: 50px;
	font-size: 13px;
	border-radius: 50px;
	cursor: pointer;
	color: black;
	background-color: #4CAF50;
	margin: 5px;
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0
		rgba(0, 0, 0, 0.19);
	outline: none;
	border: none;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
<body>
	<div ng-app="myApp" ng-controller="myCtrl">
		<div ng-hide="tt">
			<h1>Submitted success fully.... Goto dashboard</h1>
			<form action="/addQuestion">
				<input name="jsonobj" type="text" ng-model="json" style="display: none;"> 
					<input name="testId" type="number" value="${testid}" style="display: none;">

				<button type="submit">Dashboard</button>
			</form>
		</div>
		<form>
			<div ng-show="tt">
				<div class="qbody">

					Enter question:-
					<textarea ng-model="test.question" style="outline: none">
	
					</textarea>


					<div style="display: none;">{{total=${totalques}}}</div>
					<div class="opt1">
						<input ng-model="test.answer" type="radio" value="option1" required="required" style="outline: none">
						<input ng-model="test.opt1" type="text"
							style="border: none; outline: none; width: 80%; height: 30px">
					</div>
					<div class="opt1">
						<input ng-model="test.answer" type="radio" value="option2" required="required">
						<input type="text" ng-model="test.opt2"
							style="border: none; outline: none; width: 80%; height: 30px">
					</div>
					<div class="opt1">
						<input ng-model="test.answer" type="radio" value="option3" required="required">
						<input type="text" ng-model="test.opt3"
							style="border: none; outline: none; width: 80%; height: 30px">
					</div>
					<div class="opt1">
						<input ng-model="test.answer" type="radio" value="option4" required="required">
						<input ng-model="test.opt4" type="text"
							style="border: none; outline: none; width: 80%; height: 30px">
					</div>
					<div class="btn">
						<button ng-hide="con" ng-if="test.answer" ng-click="next()">Next Question</button>
					</div>
					<div class="btn">
						<button ng-show="con" ng-if="test.answer" ng-click="next()">Finish</button>
					</div>
		</form>
		<div></div>
	</div>




	<script src="js/ques.js">
		
	</script>
</body>
