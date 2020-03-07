<!-- <!-- Learn about this code on MDN: https://developer.mozilla.org/en-US/docs/Web/API/MediaStream_Recording_API/Recording_a_media_element --> -->

<!-- <p>Click the "Start" button to begin video recording for a few -->
<!-- 	seconds. You can stop the video by clicking the creatively-named "Stop" -->
<!-- 	button. The "Download" button will download the received data (although -->
<!-- 	it's in a raw, unwrapped form that isn't very useful).</p> -->
<!-- <br> -->
<!-- <div class="left"> -->
<!-- 	<div id="startButton" class="button">Start</div> -->
<!-- 	<h2>Preview</h2> -->
<!-- 	<video id="preview" width="160" height="120" autoplay muted></video> -->
<!-- </div> -->
<!-- <div class="right"> -->
<!-- 	<div id="stopButton" class="button">Stop</div> -->
<!-- 	<h2>Recording</h2> -->
	
	<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
	<div ng-app="myApp" ng-controller="myCtrl">
	<form>
				
				<div class="input-group opt1 ">
				<div>{{a=${json}}}
				
				{{total=${size} }}</div>
					<div class="input-group-prepend">
						<span class="input-group-text">Enter Question</span>
					</div>
					<textarea class="form-control" name="question"
					ng-model="question"
					
						aria-label="With textarea">${que.question}</textarea>
				</div>

				<div class="input-group mb-3 opt1">
					<div class="input-group-prepend">
						<span class="input-group-text" id="basic-addon1">Option 1</span>
					</div>
					<input type="text" class="form-control" name="opt1" ng-model="opt1"
						value="${que.opt1}" aria-describedby="basic-addon1">
				</div>

				<div class="input-group mb-3 opt1">
					<div class="input-group-prepend">
						<span class="input-group-text" id="basic-addon1">Option 2</span>
					</div>
					<input type="text" class="form-control" name="opt2" ng-model="opt2"
						value="${que.opt2}" aria-describedby="basic-addon1">
				</div>

				<div class="input-group mb-3 opt1">
					<div class="input-group-prepend">
						<span class="input-group-text" id="basic-addon1">Option 3</span>
					</div>
					<input type="text" class="form-control" name="opt3" ng-model="opt3"
						value="${que.opt3}" aria-describedby="basic-addon1">
				</div>

				<div class="input-group mb-3 opt1">
					<div class="input-group-prepend">
						<span class="input-group-text" id="basic-addon1">Option 4</span>
					</div>
					<input type="text" class="form-control" name="opt4" ng-model="opt4"
						value="${que.opt4}" aria-describedby="basic-addon1">
				</div>

				<input name="queId" value="${que.queId}" style="display: none;">
				<input name="testId" value="${que.testId}" style="display: none;">

				<div class="opt1">
					<select name="answer" class="form-control" required>
						<option disabled selected value>-- Select an Answer --</option>
						<option value="option1">option1</option>
						<option value="option2">option2</option>
						<option value="option3">option3</option>
						<option value="option4">option4</option>
					</select>
				</div>

				<div class="opt1">
						<button ng-click="next()" type="button">Submit</button>
				</div>
			</form>

	
	
	</div>
	
	<script>
var app = angular.module('myApp', []);
app.controller('myCtrl', function($scope) {
var i=0;

var a;
$scope.a=[];
var total;
$scope.total=0;



 $scope.next = function() {

	 console.log($scope.a[i].question);
	 $scope.question=$scope.a[i].question;
	 $scope.opt1=$scope.a[i].opt1;
	 $scope.opt2=$scope.a[i].opt2;
	 $scope.opt3=$scope.a[i].opt3;
	 $scope.opt4=$scope.a[i].opt4;
	 
	 
	 
    if(i < $scope.total-1){
    	i++;
    }else{
    	i=0;
  }
   $scope.next1 = function(j) {
    $scope.name = a[j].name;
    $scope.age = a[j].age;
    $scope.i=j;
    
  }
  }
    
});
</script>
	
	
<!-- 	<form action="/submittest"> -->
<!-- 	<textarea id="result" name="video"></textarea> -->
<!-- 	<button type="submit">Submit</button> -->
<!-- 	</form> -->
	
<!-- 	<video id="recording" width="160" height="120" controls></video> -->
<!-- 	<a id="downloadButton" class="button"> Download </a> -->
<!-- </div> -->
<!-- <div class="bottom"> -->
<!-- 	<pre id="log"></pre> -->
<!-- </div> -->


<!-- <script> 
// let preview = document.getElementById("preview");
// let recording = document.getElementById("recording");
// let startButton = document.getElementById("startButton");
// let stopButton = document.getElementById("stopButton");
// let downloadButton = document.getElementById("downloadButton");
// let logElement = document.getElementById("log");

// let recordingTimeMS = 5000;
// let input=document.getElementById("input");
// var recordedvid;

// function log(msg) {
//   logElement.innerHTML += msg + "\n";
// }
// function wait(delayInMS) {
//   return new Promise(resolve => setTimeout(resolve, delayInMS));
// }
// function startRecording(stream, lengthInMS) {
//   let recorder = new MediaRecorder(stream);
//   let data = [];
 
//   recorder.ondataavailable = event => data.push(event.data);
//   recorder.start();
//   log(recorder.state + " for " + (lengthInMS/1000) + " seconds...");
 
//   let stopped = new Promise((resolve, reject) => {
//     recorder.onstop = resolve;
//     recorder.onerror = event => reject(event.name);
//   });

//   let recorded = wait(lengthInMS).then(
//     () => recorder.state == "recording" && recorder.stop()
//   );
 
//   return Promise.all([
//     stopped,
//     recorded
//   ])
//   .then(() => data);
// }
// function stop(stream) {
//   stream.getTracks().forEach(track => track.stop());
// }
// startButton.addEventListener("click", function() {
//   navigator.mediaDevices.getUserMedia({
//     video: true,
//     audio: true
//   }).then(stream => {
//     preview.srcObject = stream;
//     downloadButton.href = stream;
//     preview.captureStream = preview.captureStream || preview.mozCaptureStream;
//     return new Promise(resolve => preview.onplaying = resolve);
//   }).then(() => startRecording(preview.captureStream(), recordingTimeMS))
//   .then (recordedChunks => {
//     let recordedBlob = new Blob(recordedChunks, { type: "video/mp4" });
//     recording.src = URL.createObjectURL(recordedBlob);
//     downloadButton.href = recording.src;
//     downloadButton.download = "RecordedVideo.mp4";
    
//     recordedvid=recordedBlob;
// //     input.setAttribute('value', recordedBlob);
    
//     log("Successfully recorded " + recordedBlob.size + " bytes of " +
//         recordedBlob.type + " media."+typeof(recordedvid));
    
//     getBase64();
//   })
//   .catch(log);
// }, false);
// stopButton.addEventListener("click", function() {
//   stop(preview.srcObject);
// }, false);

// function getBase64() {
// 	log(recordedvid);
	  
	 
	  
	  
// 	  let reader = new FileReader();
// 	  reader.readAsDataURL(recordedvid); // converts the blob to base64 and calls onload

// 	  reader.onload = function() {
// 		  document.getElementById("result").value = reader.result; // data url
// 	  }
	  
	  
	  
	  
// 	}
-->