<%@taglib prefix="s" uri="/struts-tags"%>
<html>
	<head>
		<title>Farmer Buddy - Agricultural Officer</title>
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
		
			<s:include value="/Other/OffDDM.jsp"/>
	
		<div id = "mainContent" style="overflow: auto;height: 500px">
			<p>Welcome <b><s:property value="#session['user'].uid" /></b>  </p>
			<p> You have priviliges of an Agricultural Officer</p>
			
			<a href="logout.action">Logout</a>	<br><br>
			<a href="updateaccView.action">View/Update MyProfile</a>
		</div>
		<br class="clearfloat"/>
		<s:include value="/Other/Footer.jsp"/>
	</div>
	</body>
</html>
