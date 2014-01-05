<%@taglib prefix="s" uri="/struts-tags"%>

<html>

<head>
<title>Farmer Buddy - Market Prices</title>
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
<h3>All Market Prices of <s:property value="market.cropName"/></h3>
<s:a href="mandiCropPriceView.action">Back</s:a><br><br>
<table class="table">	
<tr>
<th>Market Name</th>
<th>Yesterday's Price</th>
<th>Today's Price</th>
</tr>
<s:iterator value="market.cropPrices" >
<tr>
<td><s:property value="marketName"/></td> 
<td><s:property value="oldPrice"/></td> 
<td><s:property value="newPrice"/></td>   
</tr>
</s:iterator>
</table>

	</div>
	<br class="clearfloat"/>
	<s:include value="/Other/Footer.jsp"/>
</div>
	

</body>

</html>
