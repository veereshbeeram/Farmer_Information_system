<%@taglib prefix="s" uri="/struts-tags"%>

<html>

<head>
<title>Farmer Buddy - Update Training            </title>
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

<h3>Update Training Schedule With New Details</h3>
<a href="allTrainingDet.action">Back</a>&nbsp;&nbsp;
		<a href="logout.action">Logout</a>	<br><br>
<form method="POST" action="updateTrainingDet.action">
	<div class="message">
	<s:actionmessage />
	<s:actionerror />
	</div>
	<input type="hidden" name="training.tid" value="<s:property value="%{training.tid}"/>" />
	<fieldset style="width: 366px; height: auto;">
	<legend align="left">Enter Details</legend> 	
	<p>Name&nbsp;&nbsp;&nbsp; <input type="text" name="training.name"  value="<s:property value="training.name"/>" size="20"></p>
	<div class="message"><s:fielderror> <s:param>training.name</s:param> </s:fielderror></div>	
	<p>Description&nbsp;&nbsp;&nbsp; 
	<s:textarea rows="2" name="training.description" cols="20"/>
	<div class="message"><s:fielderror> <s:param>training.description</s:param> </s:fielderror></div>	
	<p>Date &amp; Time&nbsp;&nbsp;<input type="text" name="training.time"  value="<s:property value="training.time"/>" size="20"/> 
	(dd/mm/yy&nbsp; hh:mm)</p>
	<div class="message"><s:fielderror> <s:param>training.time</s:param> </s:fielderror></div>
	<p>Duration&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<input type="text" name="training.duration" value="<s:property value="training.duration"/>" size="7" /> days</p>
	<div class="message"><s:fielderror> <s:param>training.duration</s:param> </s:fielderror></div>
	<p>Address&nbsp;&nbsp;&nbsp; 
	<s:textarea rows="2" name="training.address" cols="20"/></p>
	<div class="message"><s:fielderror> <s:param>training.address</s:param> </s:fielderror></div>
	Max no. of Registrations&nbsp;&nbsp;&nbsp; 
	<p><input type="text" name="training.maxCount" size="70" value="<s:property value="training.maxCount"/>"/></p>
	<div class="message"><s:fielderror> <s:param>training.maxCount</s:param> </s:fielderror></div>	
	</fieldset>

<p><input type="submit" value="Update" name="B1"/>&nbsp;&nbsp;&nbsp;&nbsp;
	</p></form>


	</div>
	<br class="clearfloat"/>
	<s:include value="/Other/Footer.jsp"/>
</div>
	

</body>

</html>
