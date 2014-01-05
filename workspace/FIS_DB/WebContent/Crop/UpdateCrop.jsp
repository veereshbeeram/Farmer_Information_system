<%@taglib prefix="s" uri="/struts-tags"%>
<html>
	<head>
		<title>Farmer Buddy - Update Crop</title>
<SCRIPT type="text/javascript">
function fertCropName(){
document.getElementById("favFert").setAttribute("href","updateFavFerts.action?crop.name="+cropName.value)
}
function soilCropName(){
	document.getElementById("favSoil").setAttribute("href","updateFavSoils.action?crop.name="+cropName.value)
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
		<p><font face="Estrangelo Edessa" style="font-size: 20pt">Update Crop With Details&nbsp;&nbsp;</font></p>				
		<a href="allcrop.action">Back</a>&nbsp;&nbsp;
		<a href="logout.action">Logout</a>	<br><br>	
				<form method="POST" action="updatecrop.action">
					<div class = "message">
					<s:actionmessage />
					<s:actionerror />
					</div>
					<fieldset style="width: 316px; height: auto; padding: 0">
						<legend align="left">Enter Crop Details</legend> 	
						<p>Name&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" id="cropName" name="crop.name"  size="20"value="<s:property value="%{crop.name}"/>"/>
						<div class="message"><s:fielderror> <s:param>crop.name</s:param> </s:fielderror></div>
						<p>Type&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="crop.type"  size="20"value="<s:property value="%{crop.type}"/>"/></p>
						<div class="message"><s:fielderror> <s:param>crop.type</s:param> </s:fielderror></div>
						<p>Season&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="crop.season" value="<s:property value="%{crop.season}"/>"/>
						<div class="message"><s:fielderror> <s:param>crop.season</s:param> </s:fielderror></div>
					</fieldset>
					<p><a href="" id="favFert" onclick="fertCropName()">Update Fertiliser Details</a></p>
					<p><a href="" id="favSoil" onclick="soilCropName()">Update Soil Details </a></p>		
					<p><input type="submit" value="Submit" name="B1"/></p>
				</form>
			</div>
			<br class="clearfloat"/>
			<s:include value="/Other/Footer.jsp"/>
		</div>
	</body>
</html>
