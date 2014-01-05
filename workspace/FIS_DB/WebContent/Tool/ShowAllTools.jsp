<%@taglib prefix="s" uri="/struts-tags"%>

<html>

<head>
<title>Farmer Buddy -  Show All Tools           </title>
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

	<div id = "mainContent">
	<h3>Tools/Solutions With Details</h3>
		<div class="message">
		<s:actionmessage />
		<s:fielderror />
		</div>
		<br>
		<a href="myacc.action">Back</a>
		<br><br>
		<table class="table" >	
<tr>
<th>Name</th>
<th>Manufacturer</th>
<th>Link</th>
</tr>
<s:iterator value="%{tool.allTools}">
<tr>
<td><s:property value="name"/></td>	 
<td><s:property value="manufacturer"/></td> 
<td><a href="<s:property value="link"/>">Download Details</a></td>  
</tr>
</s:iterator>
</table>
		
	</div>
	<br class="clearfloat"/>
	<s:include value="/Other/Footer.jsp"/>
</div>
	

</body>

</html>
