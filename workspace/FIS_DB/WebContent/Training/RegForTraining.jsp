<%@taglib prefix="s" uri="/struts-tags"%>

<html>

<head>
<title>Farmer Buddy - Training Registration            </title>
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
	
	<s:if test="#session['user'].userRole=='Farmer'">
			<s:include value="/Other/FarmerDDM.jsp"/>
		</s:if>
		<s:else>
			<s:if test="#session['user'].userRole=='Student'">
			<s:include value="/Other/StudentDDM.jsp"/>
		</s:if>
		<s:else>
		<s:include value="/Other/PublicDDM.jsp"/>
		</s:else>		
		</s:else>		

	<div id = "mainContent" style="overflow: auto;">
<h3>Listing of Training Schedules</h3>	
<br/><a href="myacc.action">Back</a>&nbsp;&nbsp;
<s:if test="#session['user']!=null">
<a href="logout.action">Logout</a>
</s:if>
<div class ="message">
<s:actionerror/>
<s:actionmessage/>
</div>
<p>&nbsp;</p>
<table class="table">	
<tr>
<th>ID</th>
<th>Name</th>
<th>Details</th>
<th>Date</th>
<th>Address</th>
<th>Max Registration</th>
<th>Duration(days)</th>
<th>Status</th>
</tr>
<s:iterator value="training.allTrainingDet" status="stat">
<tr>
<td><s:property value="tid"/></td>
<td><s:property value="name"/></td>
<td><s:property value="description"/></td> 
<td><s:property value="time"/></td> 
<td><s:property value="address"/></td> 
<td><s:property value="maxCount"/></td> 
<td><s:property value="duration"/></td>
<td><s:property value="training.allTrainingDet[#stat.index]"/></td>
</tr>
</s:iterator>
</table>
<p>&nbsp;</p>

<s:form method="POST" action="regForTraining">
	
	<fieldset style="width: 316px; height: auto; padding: 0">
	<legend>Enter Registration Details</legend>
	<br/>
	Tick the training id's for the trainings you want to attend
	 <br>
	<s:checkboxlist name="training.myTrainings" list="training.otherTrainings"/>
&nbsp;<p>Name&nbsp;&nbsp;&nbsp; 
	<input type="text" name="training.uname" value="<s:property value="training.uname"/>" size="20"></p>
	<div class="message"><s:fielderror> <s:param>training.uname</s:param> </s:fielderror></div>	
	<p>Occupation&nbsp;&nbsp;&nbsp;&nbsp; <s:select list="training.allOccs" name="training.occ"/> </p>
	<p>Contact No.&nbsp;&nbsp;&nbsp; 
	<input type="text" name="training.contact" size="20"></p>
	<div class="message"><s:fielderror> <s:param>training.contact</s:param> </s:fielderror></div>	
	</fieldset>
	<input type="submit" value="Submit" name="B1">
</s:form>


	</div>
	<br class="clearfloat"/>
	<s:include value="/Other/Footer.jsp"/>
</div>
	

</body>

</html>
