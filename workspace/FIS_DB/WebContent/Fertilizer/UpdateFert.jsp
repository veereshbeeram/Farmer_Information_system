<%@taglib prefix="s" uri="/struts-tags"%>

<html>

<head>
<title>Farmer Buddy - Update Fertilizer</title>
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
<h3>Update Fertilizer With New Details</h3>
<a href="allfert.action">Back</a>&nbsp;&nbsp;
		<a href="logout.action">Logout</a>	<br><br>
<form method="POST" action="updatefert.action">
	<div class = "message">
	<s:actionmessage />
	<s:actionerror />
	</div>
	<fieldset style="width: 316px; height: auto; padding: 0">
	<legend align="left">Enter New Details</legend>
	Fertilizer description : <b><s:property value="%{fert.description}"/></b>
	<input type="hidden" name="fert.description" value="<s:property value="%{fert.description}"/>" size="20"/>

	<p>Distributor&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="fert.distributor" value="<s:property value="fert.distributor "/>" size="20"/></p>
	<div class="message"><s:fielderror> <s:param>fert.distributor</s:param> </s:fielderror></div>
	<p>Price&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="fert.price" value="<s:property value="%{fert.price}"/>"/></p>
	<div class="message"><s:fielderror> <s:param>fert.price</s:param> </s:fielderror></div>
	</fieldset>

<p><input type="submit" value="Submit" name="B1"/></p>
</form>	


	</div>
	<br class="clearfloat"/>
	<s:include value="/Other/Footer.jsp"/>
</div>
	

</body>

</html>
