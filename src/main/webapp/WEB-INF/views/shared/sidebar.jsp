<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Roboto:regular,bold,italic,thin,light,bolditalic,black,medium&amp;lang=en">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet"
	href="https://code.getmdl.io/1.3.0/material.cyan-light_blue.min.css">
<link rel="stylesheet" href="css/examinerstyles.css">
<div
	class="demo-drawer mdl-layout__drawer mdl-color--blue-grey-900 mdl-color-text--blue-grey-50">
	<header class="demo-drawer-header">
		<img src="upload/${user.imageName}" class="demo-avatar">
		<div class="demo-avatar-dropdown">
			<span>${user.email}</span>
			<div class="mdl-layout-spacer"></div>
			<button id="accbtn"
				class="mdl-button mdl-js-button mdl-js-ripple-effect mdl-button--icon">
				<i class="material-icons" role="presentation">arrow_drop_down</i> <span
					class="visuallyhidden">Accounts</span>
			</button>
			<ul
				class="mdl-menu mdl-menu--bottom-right mdl-js-menu mdl-js-ripple-effect"
				for="accbtn">
				<li class="mdl-menu__item">hello@example.com</li>
				<li class="mdl-menu__item">info@example.com</li>
				<li class="mdl-menu__item"><i class="material-icons">add</i>Add
					another account...</li>
			</ul>
		</div>
	</header>
	<nav class="demo-navigation mdl-navigation mdl-color--blue-grey-800">
		<a class="mdl-navigation__link" href="/dashboard"><i
			class="mdl-color-text--blue-grey-400 material-icons"
			role="presentation">home</i>Home</a> <a class="mdl-navigation__link"
			href="/create"><i
			class="mdl-color-text--blue-grey-400 material-icons"
			role="presentation">inbox</i>Create Test</a> <a
			class="mdl-navigation__link" href="/testtable"><i
			class="mdl-color-text--blue-grey-400 material-icons"
			role="presentation">delete</i>Test Created By Me</a> <a
			class="mdl-navigation__link" href="/alltest"><i
			class="mdl-color-text--blue-grey-400 material-icons"
			role="presentation">report</i>Available Test</a> <a
			class="mdl-navigation__link" href="/editprofile"><i
			class="mdl-color-text--blue-grey-400 material-icons"
			role="presentation">flag</i>Edit Profile</a>
		<div class="mdl-layout-spacer"></div>
		<a class="mdl-navigation__link" href=""><i
			class="mdl-color-text--blue-grey-400 material-icons"
			role="presentation">help_outline</i><span class="visuallyhidden">Help</span></a>
	</nav>
</div>
