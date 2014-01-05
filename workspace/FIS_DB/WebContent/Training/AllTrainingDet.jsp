<%@taglib prefix="s" uri="/struts-tags"%>

<html>

<head>
<title>Farmer Buddy -             </title>
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
<p><font face="Estrangelo Edessa" style="font-size: 20pt">Listing of Training Schedules</font></p>

<a href="logout.action">Logout</a>	<br><br>
			<a href="updateaccView.action">View/Update MyProfile</a>
<div class="message"><s:actionerror/>
<s:actionmessage/></div>
<br>
<table class="table">	

<tr>
<td style="font-size:larger">UpdateTraining</td>
<td>
<s:form action="updateTrainingDetView">
	<select size="1" name="training.tid" >
	<s:iterator value="training.allTrainingDet" >	
	<option>
		<s:property value="tid"/>
	</option>		
	</s:iterator>		
	</select>
	<s:submit value="Update"/>
</s:form>

</td>
</tr>
<tr>
<td style="font-size:larger">DeleteTraining</td>
<td>
<s:form action="deleteTraining">
	<select size="1" name="training.tid" >
	<s:iterator value="training.allTrainingDet" >	
	<option>
		<s:property value="tid"/>
	</option>		
	</s:iterator>		
	</select>
	<s:submit value="Delete"/>
</s:form>

</td>
</tr>
</table>
<br><br>
<table class="table">	
<tr>
<th>TrainingID</th>
<th>Name</th>
<th>Description</th>
<th>Date</th>
<th>Address</th>
<th>Max no Registration</th>
<th>Duration</th>
</tr>
<s:iterator value="training.allTrainingDet" >
<tr>
<td><s:property value="tid"/></td>
<td><s:property value="name"/></td>
<td><s:property value="description"/></td> 
<td><s:property value="time"/></td> 
<td><s:property value="address"/></td> 
<td><s:property value="maxCount"/></td> 
<td><s:property value="duration"/></td> 
</tr>
</s:iterator>
</table>

	</div>
	<br class="clearfloat"/>
	<s:include value="/Other/Footer.jsp"/>
</div>
	

</body>

</html>
