<%@taglib prefix="s" uri="/struts-tags"%>

<html>

<head>
<title>Farmer Buddy - Show Insurance</title>
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
<p><font face="Estrangelo Edessa" style="font-size: 20pt">Insurance Listing</font></p>
<br/><br/>
<a href="offView.action">Back</a>&nbsp;&nbsp;
		<a href="logout.action">Logout</a>	<br><br>
<div class="message">
<s:actionerror/>
<s:actionmessage/>
</div>

<table class="table">	
<tr>
<td style="font-size:larger">Delete Insurance</td>
<td>
<s:form action="deleteins">
	<select size="1" name="ins.insID" >
	<s:iterator value="ins.allInss" >	
	<option>
		<s:property value="insID"/>
	</option>		
	</s:iterator>		
	</select>
	<s:submit value="Delete"/>
</s:form>
</td>
</tr>
<tr>
<td style="font-size:larger">Update Insurance</td>
<td>
<s:form action="updateinsView">
	<select size="1" name="ins.insID" >
	<s:iterator value="ins.allInss" >	
	<option>
		<s:property value="insID"/>
	</option>		
	</s:iterator>		
	</select>
	<s:submit value="Update"/>
</s:form>
</td>
</tr>
</table>
<br/><br/>
<table class="table">	
<tr>
<th>InsID</th>
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
