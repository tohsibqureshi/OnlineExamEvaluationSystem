var app = angular.module('myApp', []);
app.controller('myCtrl', function($scope) {
  
  
   $scope.next=function(){
	local(angular.copy($scope.test));
	}

arr=[];
$scope.json="";

$scope.total;
$scope.tt=true;
$scope.con=false;



function local(data){
	
	
	arr.push(data);
	console.log(arr);
	console.log($scope.con);
	$scope.test.question="";
	$scope.test.answer="";
	$scope.test.opt1="";
	$scope.test.opt2="";
	$scope.test.opt3="";
	$scope.test.opt4="";
	
	
	if($scope.con==true){
		$scope.tt=false;
		
		$scope.json=JSON.stringify(arr);
		console.log($scope.json);
	}
	if(arr.length==$scope.total-1){
		$scope.con=true;
		}
	
}



});
