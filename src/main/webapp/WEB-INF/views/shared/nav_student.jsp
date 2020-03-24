
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Roboto:regular,bold,italic,thin,light,bolditalic,black,medium&amp;lang=en">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet"
	href="https://code.getmdl.io/1.3.0/material.cyan-light_blue.min.css">
<link rel="stylesheet" href="css/examinerstyles.css">
<style>
.back :hover {
	cursor: pointer;
}

.forward :hover {
	cursor: pointer;
}
</style>
<header
	class="demo-header mdl-layout__header mdl-color--grey-100 mdl-color-text--grey-600">
	<div class="mdl-layout__header-row">
		<span class="back"> <i class="material-icons"
			onclick="goBack()"> arrow_back &nbsp; </i>
		</span> <span class="forward"> <i class="material-icons"
			onclick="goForward()"> arrow_forward &nbsp;&nbsp;</i>
		</span> <span class="mdl-layout-title">${dash_title}</span>
		<div class="mdl-layout-spacer"></div>
		<div class="mdl-textfield mdl-js-textfield mdl-textfield--expandable">
			<label class="mdl-button mdl-js-button mdl-button--icon" for="search">
				<i class="material-icons">search</i>
			</label>
			<div class="mdl-textfield__expandable-holder">
				<input class="mdl-textfield__input" type="text" id="search">
				<label class="mdl-textfield__label" for="search">Enter your
					query...</label>
			</div>
		</div>
		<button
			class="mdl-button mdl-js-button mdl-js-ripple-effect mdl-button--icon"
			id="hdrbtn">
			<i class="material-icons">more_vert</i>
		</button>
		<ul
			class="mdl-menu mdl-js-menu mdl-js-ripple-effect mdl-menu--bottom-right"
			for="hdrbtn">
			<a href="/about_student"><li class="mdl-menu__item">About</li></a>
			<a href="/contact_student">
				<li class="mdl-menu__item">Contact</li>
			</a>
			<a href="/policy_student">
				<li class="mdl-menu__item">Legal information</li>
			</a>
			<a href="/logout">
				<li class="mdl-menu__item">Logout</li>
			</a>
		</ul>
	</div>
</header>
<script>
	function goBack() {
		window.history.back();
	}
	function goForward() {
		window.history.forward();
	}
</script>