<%@taglib prefix="s" uri="/struts-tags"%>

<html>
	<head>
		<title>Farmer Buddy - Welcome Student</title>
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
	<div id="container" style="height: 600px">
 		<div id="header" >
	 		<a href = "<s:url value = 'myacc.action'/>"><img src="images/headLink.jpg" border="0" alt="Home Link" /> </a>
		</div>
		
			<s:include value="/Other/StudentDDM.jsp"/>
		
		<div id = "mainContent" style="overflow: auto;" style="height: 500px">
			<p>Welcome <b><s:property value="#session['user'].uid" /></b></p>
			<a href="logout.action">Logout</a>	&nbsp;&nbsp;&nbsp;
			<a href="updateaccView.action">View/Update MyProfile</a><br>
		</div>
		<br class="clearfloat"/>
		<s:include value="/Other/Footer.jsp"/>
	</div>
</body>
</html>