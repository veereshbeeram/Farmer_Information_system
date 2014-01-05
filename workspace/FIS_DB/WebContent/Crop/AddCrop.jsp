<%@taglib prefix="s" uri="/struts-tags"%>

<html>

<head>
<title>Farmer Buddy - Add Crops</title>
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
	<p><font face="Estrangelo Edessa" style="font-size: 20pt">Add Crop With Details&nbsp;&nbsp;</font></p>	
	
	    <a href="offView.action">Back</a>&nbsp;&nbsp;
		<a href="logout.action">Logout</a>	<br><br>	
<form method="POST" action="addcrop.action" onsubmit="return validate_fun(this);">
	<div class="message">
	<s:actionmessage />
	<s:actionerror />
	</div>
	<fieldset style="width: 316px; height: auto; padding: 0">
	<legend >Enter Crop Details</legend> 	
	<p>Name&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" id="name" name="crop.name"  size="20"/></p>
	<div class="message"><s:fielderror> <s:param>crop.name</s:param> </s:fielderror></div>
	<p>Type&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" id="type" name="crop.type"  size="20"/></p>
	<div class="message"><s:fielderror> <s:param>crop.type</s:param> </s:fielderror></div>
	<p>Season&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" id="season" name="crop.season" />
	<div class="message"><s:fielderror> <s:param>crop.season</s:param> </s:fielderror></div>
	</fieldset>
	<fieldset>
	Tick the fertilisers that are suitable  <p>
	<s:checkboxlist name="crop.fertIDs" list="crop.allFertilisers" listKey="feID" listValue="description"/></p>
	</fieldset>
	<fieldset>
	Tick the soils that are suitable  <p>
	<s:checkboxlist name="crop.soilIDs" list="crop.allSoils" listKey="sid" listValue="name"/></p>
	</fieldset>
	<p><input type="submit" value="Submit" name="B1"/>&nbsp;&nbsp;&nbsp;&nbsp;
	</p>
	</form>
	
	</div>
	<br class="clearfloat"/>
	<s:include value="/Other/Footer.jsp"/>
</div>
	

</body>

</html>
