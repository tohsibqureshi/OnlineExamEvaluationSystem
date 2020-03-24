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
		<a class="mdl-navigation__link" href="/dashboard_student"><i
			class="mdl-color-text--blue-grey-400 material-icons"
			role="presentation">home</i>Home</a>  <a
			class="mdl-navigation__link" href="/available_test"><i
			class="mdl-color-text--blue-grey-400 material-icons"
			role="presentation">assessment</i>Available Tests</a> <a
			class="mdl-navigation__link" href="/edit_profile"><i
			class="mdl-color-text--blue-grey-400 material-icons"
			role="presentation">account_circle</i>Edit Profile</a>
		<div class="mdl-layout-spacer"></div>
		<a class="mdl-navigation__link" href=""><i
			class="mdl-color-text--blue-grey-400 material-icons"
			role="presentation">help_outline</i><span >Help</span></a>
	</nav>
</div>
