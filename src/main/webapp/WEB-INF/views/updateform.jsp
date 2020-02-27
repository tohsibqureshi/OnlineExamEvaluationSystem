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

<body>


	<div>
		<div class="qbody">
			<form action="/updatequestion">
				Enter question:-
				<textarea name="question" style="outline: none">
						${que.question}
				</textarea>

				<input name="queId" value="${que.queId}" style="display: none;">
				<input name="testId" value="${que.testId}" style="display: none;">

				<div class="opt1">
					<input type="text" name="opt1" value="${que.opt1}"
						style="border: none; outline: none; width: 80%; height: 30px">
				</div>
				<div class="opt1">
					<input type="text" name="opt2" value="${que.opt2}"
						style="border: none; outline: none; width: 80%; height: 30px">
				</div>
				<div class="opt1">
					<input type="text" name="opt3" value="${que.opt3}"
						style="border: none; outline: none; width: 80%; height: 30px">
				</div>
				<div class="opt1">
					<input type="text" name="opt4" value="${que.opt4}"
						style="border: none; outline: none; width: 80%; height: 30px">
				</div>

				<div class="opt1">
					<select name="answer" required>
						<option disabled selected value>-- Select an Answer --</option>
						<option value="option1">option1</option>
						<option value="option2">option2</option>
						<option value="option3">option3</option>
						<option value="option4">option4</option>
					</select>
				</div>

				<div class="btn">
					<button type="submit">Update Question</button>
				</div>
			</form>

		</div>
	</div>

</body>
