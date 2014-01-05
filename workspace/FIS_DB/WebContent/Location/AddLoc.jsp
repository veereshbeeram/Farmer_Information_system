<%@taglib prefix="s" uri="/struts-tags"%>

<html>

<head>
<title>Farmer Buddy - Add Location</title>
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

<p><font face="Estrangelo Edessa" style="font-size: 20pt">Add Location With details</font></p>
<a href="offView.action">Back</a>&nbsp;&nbsp;
		<a href="logout.action">Logout</a>	<br><br>	
<form method="POST" action="addloc.action">
	<div class="message">
	<s:actionmessage />
	<s:actionerror />
	</div>
	<fieldset style="width: 456px; height: auto; padding: 0">
	<legend align="left">Enter location details</legend>
	<p>State&nbsp;&nbsp;&nbsp; <input type="text" name="loc.state" size="20"></p>
	<div class="message"><s:fielderror> <s:param>loc.state</s:param> </s:fielderror></div>
	<p>District&nbsp;&nbsp;&nbsp;<input type="text" name="loc.district" size="20"></p>
	<div class="message"><s:fielderror> <s:param>loc.district</s:param> </s:fielderror></div>
	<p>Average Temperature (in Celsius)&nbsp;&nbsp;&nbsp;<input type="text" name="loc.avgTemp" size="20"></p>
	<div class="message"><s:fielderror> <s:param>loc.avgTemp</s:param> </s:fielderror></div>
	<p>Rainfall (in mm)&nbsp;&nbsp;&nbsp;<input type="text" name="loc.rain" size="20"></p>
	<div class="message"><s:fielderror> <s:param>loc.rain</s:param> </s:fielderror></div>
	<p>Market name&nbsp;&nbsp;&nbsp; <input type="text" name="loc.marketName" size="20"></p>
	<div class="message"><s:fielderror> <s:param>loc.marketName</s:param> </s:fielderror></div>
	
	Select Crops Favourable to be grown in this location <p>
	<s:checkboxlist name="loc.favCrops" list="#application.appInitValues.allCropNames" value="loc.myCrops"/></p>
	</fieldset>
	
	<p><input type="submit" value="Submit">&nbsp;&nbsp;&nbsp;</p>
</form>

	</div>
	<br class="clearfloat"/>
	<s:include value="/Other/Footer.jsp"/>
</div>
	

</body>

</html>
