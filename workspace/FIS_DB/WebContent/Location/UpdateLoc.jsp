<%@taglib prefix="s" uri="/struts-tags"%>

<html>

<head>
<title>Farmer Buddy - Update Location</title>

<SCRIPT type="text/javascript">
function setDistrict(){
document.getElementById("favCrop").setAttribute("href","updateFavCrops.action?loc.district="+district.value)
}
</script>

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
<h3>Update Location With details</h3>
<a href="allloc.action">Back</a>&nbsp;&nbsp;
		<a href="logout.action">Logout</a>	<br><br>
<form method="POST" action="updateloc.action">
	<div class="message"><s:actionmessage />
	<s:actionerror /></div>
	<fieldset style="padding: 2">
	<legend>Enter New Location details</legend>
	
	<p>District is : <b><s:property value="%{loc.district}"/></b>
	<input type="hidden" id="district" name="loc.district" value="<s:property value="%{loc.district}"/>" size="20"/>&nbsp;
	<p>State&nbsp;&nbsp;&nbsp; <input type="text" name="loc.state" value="<s:property value="%{loc.state}"/>" size="20"></p>
	<div class="message"><s:fielderror> <s:param>loc.state</s:param> </s:fielderror></div>	
	<p>Average Temperature (in Celsius)&nbsp;&nbsp;&nbsp;<input type="text" name="loc.avgTemp" value="<s:property value="%{loc.avgTemp}"/>" size="20"></p>
	<div class="message"><s:fielderror> <s:param>loc.avgTemp</s:param> </s:fielderror></div>	
	<p>Rainfall (in mm)&nbsp;&nbsp;&nbsp;<input type="text" name="loc.rain" value="<s:property value="%{loc.rain}"/>" size="20"></p>
	<div class="message"><s:fielderror> <s:param>loc.rain</s:param> </s:fielderror></div>		
	<p>Market name&nbsp;&nbsp;&nbsp; <input type="text" name="loc.marketName" value="<s:property value="%{loc.marketName}"/>" size="20"></p>
	<div class="message"><s:fielderror> <s:param>loc.marketName</s:param> </s:fielderror></div>	
	<p><a href="" id="favCrop" onclick="setDistrict()">Update Favourable Crop Details</a></p>
	</fieldset>
	<input type="submit" value="Update">
</form>

	</div>
	<br class="clearfloat"/>
	<s:include value="/Other/Footer.jsp"/>
</div>
	

</body>

</html>
