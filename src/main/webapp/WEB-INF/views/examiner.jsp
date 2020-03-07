
<!doctype html>

<html lang="en">
<head>

<meta name="mobile-web-app-capable" content="yes">
<link rel="icon" sizes="192x192" href="img/tsicon.png">





<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Roboto:regular,bold,italic,thin,light,bolditalic,black,medium&amp;lang=en">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet"
	href="https://code.getmdl.io/1.3.0/material.cyan-light_blue.min.css">
<link rel="stylesheet" href="css/examinerstyles.css">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<title>${title}</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css">
  <link rel="stylesheet" href="css/reg.css">
  <script
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>

<style>
#view-source {
	position: fixed;
	display: block;
	right: 0;
	bottom: 0;
	margin-right: 40px;
	margin-bottom: 40px;
	z-index: 900;
}
</style>
</head>
<body>
	<div
		class="demo-layout mdl-layout mdl-js-layout mdl-layout--fixed-drawer mdl-layout--fixed-header">

		<%@include file="./shared/nav.jsp"%>

		<%@include file="./shared/sidebar.jsp"%>


		<main class="mdl-layout__content mdl-color--grey-100">

			<c:if test="${userClickHome==true}">
				<%@include file="welcome.jsp"%>
			</c:if>

			<c:if test="${userClickCreateTest==true}">
				<%@include file="createtest.jsp"%>
			</c:if>

			<c:if test="${userClickCreatedTest==true}">
				<%@include file="testtable.jsp"%>
			</c:if>

			<c:if test="${userClickAvailableTest==true}">
				<%@include file="alltest.jsp"%>
			</c:if>

			<c:if test="${userClickEditProfile==true}">
				<%@include file="profile.jsp"%>
			</c:if>

<%-- 			<c:if test="${userClick==true}"> --%>
<%-- 				<%@include file="createtest.jsp"%> --%>
<%-- 			</c:if> --%>

<%-- 			<c:if test="${userClick==true}"> --%>
<%-- 				<%@include file="createtest.jsp"%> --%>
<%-- 			</c:if> --%>

		</main>
	</div>

	<a
		href="https://github.com/google/material-design-lite/blob/mdl-1.x/templates/dashboard/"
		target="_blank" id="view-source"
		class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--colored mdl-color-text--white">Contact
		us</a>
	<script src="https://code.getmdl.io/1.3.0/material.min.js"></script>
</body>
</html>
