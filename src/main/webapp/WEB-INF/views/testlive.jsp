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

<link rel="icon" href="img/tsicon.png" type="image/x-icon">

<link rel="stylesheet" href="css/teststyle.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/underscore.js/1.9.1/underscore-min.js"></script>

<body>
	<div ng-app="myApp" ng-controller="myCtrl">
		<div class="sec">
			<h2>
				sec 1
				<form action="/submittest">
					<input name="jsonobj" type="text" ng-model="json" style="">
					<input name="testId" type="text" value="${testId}" style="">
					<input name="sId" type="text" value="${sId}" style="">

					<button type="submit">Submit test</button>
				</form>
			</h2>

			<div class="que">
				Que !

				<button ng-repeat="no in narr" ng-click=jump(no)>{{no}}</button>
			</div>


			<div class="qbody">{{question}}</div>

			<div class="opt">
				<form>
					<div class="opt1">
						<input name="optt1" type="radio" ng-model="selected"
							value="option1"> {{opt1}}
					</div>
					<div class="opt1">
						<input name="optt1" type="radio" ng-model="selected"
							value="option2"> {{opt2}}
					</div>
					<div class="opt1">
						<input name="optt1" type="radio" ng-model="selected"
							value="option3"> {{opt3}}
					</div>
					<div class="opt1">
						<input name="optt1" type="radio" ng-model="selected"
							value="option4"> {{opt4}}
					</div>
					<div class="btn">
						<button ng-click="next()" type="button" ng-hide="con">next</button>
						<button ng-click="" type="button" ng-show="con">submit</button>
					</div>
					<div class="btn"></div>
				</form>

			</div>



		</div>
	</div>
</body>


<script>

var app = angular.module('myApp', []);
app.controller('myCtrl', function($scope) {
   var i = 0;
   $scope.narr = [0, 1, 2];
   var studentId = ${sId};
   var a;
   var con = false;
   $scope.a = ${json};
   var total;
   $scope.total = ${size};
   var array = [];
   $scope.json = "";
   console.log($scope.a[i].question);
   console.log($scope.total);
   var data = {};
   $scope.question = $scope.a[i].question;
   $scope.opt1 = $scope.a[i].opt1;
   $scope.opt2 = $scope.a[i].opt2;
   $scope.opt3 = $scope.a[i].opt3;
   $scope.opt4 = $scope.a[i].opt4;

   function findObjectByKey(array, key, value) {
	    for (var j = 0; j < array.length; j++) {
	        if (array[j][key] === value) {
	            return true;
	        }
	    }
	    return false;
	}
   
   $scope.next = function() {
	  // console.log(array);
    
	   if (findObjectByKey(array,'queId',$scope.a[i].queId)){
      var data = {
       queId: $scope.a[i].queId,
       testId: $scope.a[i].testId,
       correctOpt: $scope.a[i].answer,
       selectedOpt: $scope.selected,
       studentId: ${sId}
      };
      array[i] = data;
      console.log(array);
     }else{
      
       data = {
       queId: $scope.a[i].queId,
       testId: $scope.a[i].testId,
       correctOpt: $scope.a[i].answer,
       selectedOpt: $scope.selected,
       studentId: ${sId}
       };

      array.push(data);
      console.log(array);
      // 	 $scope.json=JSON.stringify(array);
      //	console.log($scope.json);

     }

 

    if (i < $scope.total - 1) {
     i++;
    } else {
     i=0;
    }

    $scope.question = $scope.a[i].question;
    $scope.opt1 = $scope.a[i].opt1;
    $scope.opt2 = $scope.a[i].opt2;
    $scope.opt3 = $scope.a[i].opt3;
    $scope.opt4 = $scope.a[i].opt4;
    $scope.selected = null;
    $scope.json=JSON.stringify(array);
   }
//next end
   $scope.jump = function(n) {
	   //console.log(array);
   
     if (findObjectByKey(array,'queId',$scope.a[i].queId)){
      var data = {
       queId: $scope.a[i].queId,
       testId: $scope.a[i].testId,
       correctOpt: $scope.a[i].answer,
       selectedOpt: $scope.selected,
       studentId: ${sId}
      };
      array[i] = data;
      console.log(array);
     }else{
        
        data = {
        queId: $scope.a[i].queId,
        testId: $scope.a[i].testId,
        correctOpt: $scope.a[i].answer,
        selectedOpt: $scope.selected,
        studentId: ${sId}
        };

       array.push(data);
       console.log(array);
        	 
       //	console.log($scope.json);

      }
    
      $scope.question = $scope.a[n].question;
      $scope.opt1 = $scope.a[n].opt1;
      $scope.opt2 = $scope.a[n].opt2;
      $scope.opt3 = $scope.a[n].opt3;
      $scope.opt4 = $scope.a[n].opt4;
      $scope.selected = null;
      //$scope.selected = array[n].selectedOpt;
 if (n < $scope.total - 1) {
     i=n+1;
    } else {
     i=0;
    }
       $scope.json=JSON.stringify(array);
     }
    });

//     var app = angular.module('myApp', []);
//     app.controller('myCtrl', function($scope) {
//         var i = 0;
//         $scope.narr=[0,1,2];
// 		var studentId=${sId};
//         var a;
//         var con=false;
//         $scope.a = ${json};
//         var total;
//         $scope.total = ${size};
// 		var array=[];
// 		$scope.json="";
//         console.log($scope.a[i].question);
//         console.log($scope.total);
// 		var data={};
//         $scope.question = $scope.a[i].question;
//         $scope.opt1 = $scope.a[i].opt1;
//         $scope.opt2 = $scope.a[i].opt2;
//         $scope.opt3 = $scope.a[i].opt3;
//         $scope.opt4 = $scope.a[i].opt4;
        
//         $scope.next = function() {

//         	_.forEach(array, function(item) {
//                 //console.log(item);
//                 if(item.queId==$scope.a[i].queId){
//                 	var data={
//                				queId:$scope.a[i].queId,
//                				testId:$scope.a[i].testId,
//                				correctOpt:$scope.a[i].answer,
//                				selectedOpt:$scope.selected,
//                				studentId:${sId}
//                			};
//                 	array[i]=data;
//                 	console.log(array);	
//                 }
//         });
        	
//         	_.forEach(array, function(item) {
//                 //console.log(item);
//         		if(!(_.has(item, queId))){
//         			data={
//              				queId:$scope.a[i].queId,
//              				testId:$scope.a[i].testId,
//              				correctOpt:$scope.a[i].answer,
//              				selectedOpt:$scope.selected,
//              				studentId:${sId}
//              			};    	
                 	
//                  	array.push(data);
//                  	console.log(array);
//                 // 	 $scope.json=JSON.stringify(array);
//               	//	console.log($scope.json);
              		
//             	}

//         });
        	        	
//             if (i < $scope.total - 1) {
//                 i++;
//             } else {
//                 con=true;
//             }
            
//             $scope.question = $scope.a[i].question;
//             $scope.opt1 = $scope.a[i].opt1;
//             $scope.opt2 = $scope.a[i].opt2;
//             $scope.opt3 = $scope.a[i].opt3;
//             $scope.opt4 = $scope.a[i].opt4;
//             $scope.selected=null;

//         }
        
//         $scope.jump = function(n) {
        	
        	
//         		_.forEach(array, function(item) {
//                         //console.log(item);
//                         if(item.queId==$scope.a[i].queId){
//                         	var data={
//                        				queId:$scope.a[i].queId,
//                        				testId:$scope.a[i].testId,
//                        				correctOpt:$scope.a[i].answer,
//                        				selectedOpt:$scope.selected,
//                        				studentId:${sId}
//                        			};
//                         	array[i]=data;
//                         	console.log(array);	
//                         }
//                 });
        		
//         		_.forEach(array, function(item) {
//                     //console.log(item);
//             		if(!(_.has(item, queId))){
//             			data={
//                  				queId:$scope.a[i].queId,
//                  				testId:$scope.a[i].testId,
//                  				correctOpt:$scope.a[i].answer,
//                  				selectedOpt:$scope.selected,
//                  				studentId:${sId}
//                  			};    	
                     	
//                      	array.push(data);
//                      	console.log(array);
//                     // 	 $scope.json=JSON.stringify(array);
//                   	//	console.log($scope.json);
                  		
//                 	}
//             	  $scope.question = $scope.a[n].question;
//                   $scope.opt1 = $scope.a[n].opt1;
//                   $scope.opt2 = $scope.a[n].opt2;
//                   $scope.opt3 = $scope.a[n].opt3;
//                   $scope.opt4 = $scope.a[n].opt4;
//                   $scope.selected=array[n].selectedOpt;
      
//                  i=n+1;

                  
              		
              	
//         }
//     });
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