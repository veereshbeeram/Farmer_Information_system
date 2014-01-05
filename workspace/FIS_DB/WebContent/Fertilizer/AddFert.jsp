<%@taglib prefix="s" uri="/struts-tags"%>

<html>

<head>
<title>Farmer Buddy - All Fertilizer</title>
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
	
	<s:include value="/Other/OffDDM.jsp"/>
	
	<div id = "mainContent" style="overflow: auto;">
<p><font face="Estrangelo Edessa" style="font-size: 20pt">Add Fertilizer With Details</font></p>
<s:a href="offView.action" >Back</s:a>&nbsp;&nbsp;
		<a href="logout.action">Logout</a>	<br><br>
<form method="POST" action="addfert.action">
	<div class="message">
	<s:actionmessage />
	<s:actionerror />
	</div>
	<fieldset style="width: 316px; height:auto; padding: 0">
	<legend align="left">Enter Details</legend> 	
	<p>Description&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="fert.description"  size="20"/></p>
	<div class="message"><s:fielderror> <s:param>fert.description</s:param> </s:fielderror></div>
	<p>Price&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="fert.price"  size="20"/></p>
	<div class="message"><s:fielderror> <s:param>fert.price</s:param> </s:fielderror></div>
	<p>Distributor&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="fert.distributor" /></p>
	<div class="message"><s:fielderror> <s:param>fert.distributor</s:param> </s:fielderror></div>
	</fieldset>
	<p><input type="submit" value="Submit" name="B1"/>&nbsp;&nbsp;&nbsp;&nbsp;</p>
	</form>

	</div>
	<br class="clearfloat"/>
	<s:include value="/Other/Footer.jsp"/>
</div>
	

</body>

</html>
