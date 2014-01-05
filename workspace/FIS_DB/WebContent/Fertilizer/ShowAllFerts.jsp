<%@taglib prefix="s" uri="/struts-tags"%>

<html>

<head>
<title>Farmer Buddy - Show Fertilizer</title>
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
<p><font face="Estrangelo Edessa" style="font-size: 20pt">Fertilizer Listing</font></p>
<br/><br/>
<div class="message">
<s:actionerror/>
<s:actionmessage/>
</div>
<br/><br/>
<s:a href="offView.action">Back</s:a>&nbsp;&nbsp;
		<a href="logout.action">Logout</a>	<br><br>
<table class="table">	
<tr>
<th>Description</th>
<th>Distributor</th>
<th>Price</th>
</tr>
<s:iterator value="fert.allFerts" >
<tr>
<td><s:property value="description"/></td> 
<td><s:property value="distributor"/></td> 
<td><s:property value="price"/></td> 
</tr>
</s:iterator>
</table>
<br /><br />
<table class="table">	
<tr>
<td style="font-size:larger">Delete Fertilizer</td>
<td>
<s:form action="deletefert" >
	<select size="1" name="fert.description" >
	<s:iterator value="fert.allFerts" >	
	<option>
		<s:property value="description"/>
	</option>		
	</s:iterator>		
	</select>
	<s:submit value="Delete"/>
</s:form>
</td>
</tr>
<tr>
<td style="font-size:larger">Update Fertilizer</td>
<td>
<s:form action="updatefertView">
	<select size="1" name="fert.description" >
	<s:iterator value="fert.allFerts" >	
	<option>
		<s:property value="description"/>
	</option>		
	</s:iterator>		
	</select>
	<s:submit value="Update"/>
</s:form>
</td>
</tr>
</table>
<br/>
<br/>

	</div>
	<br class="clearfloat"/>
	<s:include value="/Other/Footer.jsp"/>
</div>
	

</body>

</html>
