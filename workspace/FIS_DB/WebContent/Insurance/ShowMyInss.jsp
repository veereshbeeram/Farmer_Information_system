<%@taglib prefix="s" uri="/struts-tags"%>

<html>

<head>
<title>Farmer Buddy - Farmer Insurances</title>
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
	
	<s:include value="/Other/FarmerDDM.jsp"/>
	
<div id = "mainContent" style="overflow: auto;">
<h3>Insurance Listing</h3>
<div class="message">
<s:actionerror/>
<s:actionmessage/>
</div>
<s:a href="myacc.action">Back</s:a>&nbsp;&nbsp;
<a href="logout.action">Logout</a><br><br>

<table class="table">	
<tr>
<td style="font-size:larger">Add Insurance (if any)</td>
<td>
<s:form action="addNewIns">
	<select size="1" name="ins.insID" >
	<s:iterator value="ins.otherInss" status="stat">	
	<option>
		<s:property value="ins.otherInss[#stat.index]"/>
	</option>		
	</s:iterator>		
	</select>
	<s:submit value="Add"/>
</s:form>
</td>
</tr>
<tr>
<td style="font-size:larger">Delete Your Old Insurance Scheme</td>
<td>
<s:form action="deleteOldIns">
	<select size="1" name="ins.insID" >
	<s:iterator value="ins.myInss" status="stat">	
	<option>
		<s:property value="ins.myInss[#stat.index]"/>
	</option>		
	</s:iterator>		
	</select>
	<s:submit value="Delete"/>
</s:form>
</td>
</tr>
</table>
<br/><br/>
<table class="table">	
<tr>
<th>Insurance ID</th>
<th>Name</th>
<th>Interest</th>
<th>Type</th>
<th>Premium</th>
<th>Term</th>
</tr>
<s:iterator value="ins.allInss" >
<tr>
<td><s:property value="insID"/></td>
<td><s:property value="name"/></td> 
<td><s:property value="interest"/></td> 
<td><s:property value="type"/></td>
<td><s:property value="premium"/></td>
<td><s:property value="term"/></td> 
</tr>
</s:iterator>
</table>

	</div>
	<br class="clearfloat"/>
	<s:include value="/Other/Footer.jsp"/>
</div>
	

</body>

</html>
