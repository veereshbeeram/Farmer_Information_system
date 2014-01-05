<%@taglib prefix="s" uri="/struts-tags"%>

<html>

<head>
<title>Farmer Buddy - Show Locations</title>
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
	 
	<a href = "<s:url value = 'home.action'/>"><img src="images/headLink.jpg" border="0" alt="Home Link" /> </a>
	</div>
	
	<s:include value="/Other/OffDDM.jsp"/>
	<div id = "mainContent" style="overflow: auto;">
<p><font face="Estrangelo Edessa" style="font-size: 20pt">Location Listing</font></p>
<br><br>
<a href="offView.action">Back</a>&nbsp;&nbsp;
		<a href="logout.action">Logout</a>	<br><br>
<div class ="message">
<s:actionerror/>
<s:actionmessage/>
</div>

<table class="table">	
<tr>
<th>District</th>
<th>State</th>
<th>Avg Temp</th>
<th>Rainfall</th>
<th>Market</th>
</tr>
<s:iterator value="loc.allLocs" >
<tr>
<td><s:property value="district"/></td> 
<td><s:property value="state"/></td> 
<td><s:property value="avgTemp"/></td>
<td><s:property value="rain"/></td>
<td><s:property value="marketName"/></td>  
</tr>
</s:iterator>
</table>
<br /><br />
<table class="table">	
<tr>
<td style="font-size:larger">Delete Location</td>
<td>
<s:form action="deleteloc">
	<select size="1" name="loc.district" >
	<s:iterator value="loc.allLocs" >	
	<option>
		<s:property value="district"/>
	</option>		
	</s:iterator>		
	</select>
	<s:submit value="Delete"/>
</s:form>
</td>
</tr>
<tr>
<td style="font-size:larger">Update Location</td>
<td>
<s:form action="updatelocView">
	<select size="1" name="loc.district" >
	<s:iterator value="loc.allLocs" >	
	<option>
		<s:property value="district"/>
	</option>		
	</s:iterator>		
	</select>
	<s:submit value="Update"/>
</s:form>
</td>
</tr>
</table>
<br><br>
	</div>
	<br class="clearfloat"/>
	<s:include value="/Other/Footer.jsp"/>
</div>
	

</body>

</html>
