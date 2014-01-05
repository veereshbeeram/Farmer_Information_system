<%@taglib prefix="s" uri="/struts-tags"%>
<html>
	<head>
		<title>Farmer Buddy - Farmer Page</title>
		<link rel="stylesheet" type="text/css" href = "<s:url value = 'css/login.css' />" >
		<link rel="stylesheet" type="text/css" href = "<s:url value = 'css/menu.css' />" >
		<script language="javascript" src="script/menu.js"></script>
		<style type="text/css">
			.twoColFixRtHdr #header{
		 		background-image: url(images/headbg.jpg);
	 		}
			.twoColFixRtHdr #footer {
				background-image: url(images/foot.jpg);
			} 
		</style>
	</head>
	<body class = "twoColFixRtHdr">
		<div id="container">
			<div id="header" >
	 			<a href = "<s:url value = 'myacc.action'/>"><img src="images/headLink.jpg" border="0" alt="Home Link" /> </a>
			</div>
			
				<s:include value="/Other/FarmerDDM.jsp"/>	
			
			<div id = "mainContent" style="overflow: auto;">
				<p>Welcome <b><s:property value="#session['user'].uid" /></b></p>
				<p><a href="logout.action">Logout</a></p>
				<p><a href="updateaccView.action">View/Update MyProfile</a></p>
			</div>
			<br class="clearfloat"/>
			<s:include value="/Other/Footer.jsp"/>
		</div>
	</body>
</html>