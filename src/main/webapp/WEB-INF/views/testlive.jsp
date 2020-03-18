<!-- Learn about this code on MDN: https://developer.mozilla.org/en-US/docs/Web/API/MediaStream_Recording_API/Recording_a_media_element -->

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

<link rel="stylesheet" href="css/teststyle.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>

<body>
	<div ng-app="myApp" ng-controller="myCtrl">
		<div class="sec">
			<h2>
				sec 1
				<form action="/submittest">
				<input name="jsonobj" type="text" ng-model="json"
					style="display: none;">

				<button type="submit">Submit test</button>
			</form>
			</h2>

			<div class="que">Que !</div>


			<div class="qbody">{{question}}</div>

			<div class="opt">
				<form>
					<div class="opt1">
						<input name="optt1" type="radio" ng-model="selected" value="option1"> {{opt1}}
					</div>
					<div class="opt1">
						<input name="optt1" type="radio" ng-model="selected" value="option2"> {{opt2}}
					</div>
					<div class="opt1">
						<input name="optt1" type="radio" ng-model="selected" value="option3"> {{opt3}}
					</div>
					<div class="opt1">
						<input name="optt1" type="radio" ng-model="selected" value="option4"> {{opt4}}
					</div>
					<div class="btn">
						<button ng-click="next()" ng-model="selected" type="button" ng-hide="con">next</button>
					</div>
					<div class="btn">
					</div>
				</form>

			</div>



		</div>
	</div>
</body>


<script>
    var app = angular.module('myApp', []);
    app.controller('myCtrl', function($scope) {
        var i = 0;
		var studentId=${sId};
        var a;
        $scope.a = ${json};
        var total;
        $scope.total = ${size};
		var array=[];
		$scope.json="";
        console.log($scope.a[i].question);
        console.log($scope.total);
var data;
        $scope.question = $scope.a[i].question;
        $scope.opt1 = $scope.a[i].opt1;
        $scope.opt2 = $scope.a[i].opt2;
        $scope.opt3 = $scope.a[i].opt3;
        $scope.opt4 = $scope.a[i].opt4;
        
       
        i++;
        $scope.next = function() {

        	
        	
   			 data={
    				queId:$scope.a[i].queId,
    				testId:$scope.a[i].testId,
    				correctOpt:$scope.a[i].answer,
    				selectedOpt:$scope.selected,
    				studentId:${sId}
    			};    	
        	
        	array.push(data);
        	 $scope.json=JSON.stringify(array);
     		console.log($scope.json);
     		
            console.log(array);
            

            
            $scope.question = $scope.a[i].question;
            $scope.opt1 = $scope.a[i].opt1;
            $scope.opt2 = $scope.a[i].opt2;
            $scope.opt3 = $scope.a[i].opt3;
            $scope.opt4 = $scope.a[i].opt4;



            if (i < $scope.total - 1) {
                i++;
            } else {
                i=0;
            }
            $scope.next1 = function(j) {
                $scope.name = a[j].name;
                $scope.age = a[j].age;
                $scope.i = j;

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

// � let recorded = wait(lengthInMS).then(
//     () => recorder.state == "recording" && recorder.stop()
// � );
 
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