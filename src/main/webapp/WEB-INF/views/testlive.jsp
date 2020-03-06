<!-- Learn about this code on MDN: https://developer.mozilla.org/en-US/docs/Web/API/MediaStream_Recording_API/Recording_a_media_element -->

<p>Click the "Start" button to begin video recording for a few
	seconds. You can stop the video by clicking the creatively-named "Stop"
	button. The "Download" button will download the received data (although
	it's in a raw, unwrapped form that isn't very useful).</p>
<br>
<div class="left">
	<div id="startButton" class="button">Start</div>
	<h2>Preview</h2>
	<video id="preview" width="160" height="120" autoplay muted></video>
</div>
<div class="right">
	<div id="stopButton" class="button">Stop</div>
	<h2>Recording</h2>
	<form action="/submittest">
	
	<textarea id="result" name="video"></textarea>
	<button type="submit">Submit</button>
	</form>
	
	<video id="recording" width="160" height="120" controls></video>
	<a id="downloadButton" class="button"> Download </a>
</div>
<div class="bottom">
	<pre id="log"></pre>
</div>


<script>
let preview = document.getElementById("preview");
let recording = document.getElementById("recording");
let startButton = document.getElementById("startButton");
let stopButton = document.getElementById("stopButton");
let downloadButton = document.getElementById("downloadButton");
let logElement = document.getElementById("log");

let recordingTimeMS = 5000;
let input=document.getElementById("input");
var recordedvid;

function log(msg) {
  logElement.innerHTML += msg + "\n";
}
function wait(delayInMS) {
  return new Promise(resolve => setTimeout(resolve, delayInMS));
}
function startRecording(stream, lengthInMS) {
  let recorder = new MediaRecorder(stream);
  let data = [];
 
  recorder.ondataavailable = event => data.push(event.data);
  recorder.start();
  log(recorder.state + " for " + (lengthInMS/1000) + " seconds...");
 
  let stopped = new Promise((resolve, reject) => {
    recorder.onstop = resolve;
    recorder.onerror = event => reject(event.name);
  });

  let recorded = wait(lengthInMS).then(
    () => recorder.state == "recording" && recorder.stop()
  );
 
  return Promise.all([
    stopped,
    recorded
  ])
  .then(() => data);
}
function stop(stream) {
  stream.getTracks().forEach(track => track.stop());
}
startButton.addEventListener("click", function() {
  navigator.mediaDevices.getUserMedia({
    video: true,
    audio: true
  }).then(stream => {
    preview.srcObject = stream;
    downloadButton.href = stream;
    preview.captureStream = preview.captureStream || preview.mozCaptureStream;
    return new Promise(resolve => preview.onplaying = resolve);
  }).then(() => startRecording(preview.captureStream(), recordingTimeMS))
  .then (recordedChunks => {
    let recordedBlob = new Blob(recordedChunks, { type: "video/mp4" });
    recording.src = URL.createObjectURL(recordedBlob);
    downloadButton.href = recording.src;
    downloadButton.download = "RecordedVideo.mp4";
    
    recordedvid=recordedBlob;
//     input.setAttribute('value', recordedBlob);
    
    log("Successfully recorded " + recordedBlob.size + " bytes of " +
        recordedBlob.type + " media."+typeof(recordedvid));
    
    getBase64();
  })
  .catch(log);
}, false);
stopButton.addEventListener("click", function() {
  stop(preview.srcObject);
}, false);

function getBase64() {
	log(recordedvid);
	  
	 
	  
	  
	  let reader = new FileReader();
	  reader.readAsDataURL(recordedvid); // converts the blob to base64 and calls onload

	  reader.onload = function() {
		  document.getElementById("result").value = reader.result; // data url
	  }
	  
	  
	  
	  
	}

</script>