<%@taglib prefix="s" uri="/struts-tags"%>
<html>

<head>
<script src="jquery.js"></script>
  
	<script>	
	
	$(document).ready(function(){
		$.getJSON("sendJSONData.action?market.cropName="+cropName.value+"&"+"market.marketName="+marketName.value,
		function(json){
			document.getElementById("newPrice").setAttribute("value",json.cropPrice);
		})});
			
		function sendJSONData(){
		$.getJSON("sendJSONData.action?market.cropName="+cropName.value+"&"+"market.marketName="+marketName.value,
		function(json){
			var price = json.cropPrice
			if(price==0)
				document.getElementById("newPrice").setAttribute("value","");
			else
				document.getElementById("newPrice").setAttribute("value",price);
		})};
		
</script>

<title>Farmer Buddy - Update Crop Prices</title>
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

<p><font face="Estrangelo Edessa" style="font-size: 20pt">Publish Today's Market Price for Crop</font></p>
<a href="offView.action">Back</a>&nbsp;&nbsp;
		<a href="logout.action">Logout</a>	<br><br>	
	<form method="POST" action="updateCropPrice.action">
	<div class="message">
	<s:actionmessage />
	<s:actionerror />
	</div>	

	<fieldset style="width: 316px; height: auto; padding: 0">
	<legend>Update Crop Price</legend>
	
	<p>Market Name&nbsp;&nbsp;&nbsp;
	<s:select list="market.allMarketNames" name="market.marketName" onchange="sendJSONData()" id="marketName"/></p>
	<p>Crop&nbsp;&nbsp;&nbsp;
	<s:select list="#application.appInitValues.allCropNames" name="market.cropName" onchange="sendJSONData()" id="cropName"/></p>


	<p>Today's Price&nbsp;&nbsp;&nbsp; 
	<input type="text" id="newPrice" name="market.newPrice" value="<s:property value="market.newPrice"/>" ></p>
	<p>&nbsp;</p>
	</fieldset><input type="submit" value="Update" name="B4">&nbsp;&nbsp;&nbsp;
	
</form>


	</div>
	<br class="clearfloat"/>
	<s:include value="/Other/Footer.jsp"/>
</div>
	

</body>

</html>
