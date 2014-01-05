<%@taglib prefix="s" uri="/struts-tags"%>

<html>

<head>
<title>Farmer Buddy - Mandi Crop Prices</title>
<SCRIPT type="text/javascript">
function setMarket(){
document.getElementById("marketName").setAttribute("href","cropPricesOfMarketPDF.action?market.marketName="+market.value)
}
function setCrop(){
	document.getElementById("cropName").setAttribute("href","marketPricesOfCropPDF.action?market.cropName="+crop.value)
	}
</SCRIPT>

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
	<s:include value="/Other/PublicDDM.jsp"/>
	
		
	
	
<div id = "mainContent" style="overflow: auto;">
<h3>Mandi Crop Prices</h3>
<br><br>
<s:a href="home.action">Back</s:a><br>
<form method="POST" action="cropPricesOfMarket.action">
	<fieldset style="width: 210px; height: auto; padding: 0">
	<legend>Crop Prices in selected market</legend>
	&nbsp;<p>Select market&nbsp;&nbsp;&nbsp; <s:select id="market" list="market.allMarketNames" name="market.marketName"/></p>
	</fieldset><input type="submit" value="Submit" name="B2">&nbsp;&nbsp;&nbsp;
	<a href="" id="marketName" onclick="setMarket()">Get PDF</a>
</form>
<br>
<br>
<form method="post" action="marketPricesOfCrop.action">
	<fieldset style="width: 260px; height:auto; padding: 0">
	<legend>Various market prices of selected crop</legend>
	&nbsp;<p>Select crop&nbsp;&nbsp;&nbsp; <s:select id="crop" list="#application.appInitValues.allCropNames" name="market.cropName"/>
	</fieldset><input type="submit" value="Submit" name="B3">&nbsp;&nbsp;&nbsp;
	<a href="" id="cropName" onclick="setCrop()">Get PDF</a>
</form>

	</div>
	<br class="clearfloat"/>
	<s:include value="/Other/Footer.jsp"/>
</div>
	

</body>

</html>
