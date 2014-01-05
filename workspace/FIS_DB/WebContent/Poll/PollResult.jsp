<%@taglib prefix="s" uri="/struts-tags"%>

<html>

<head>
<title>Farmer Buddy - Poll Result</title>
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
	
	<s:if test="#session['user'].userRole=='Agricultural Officer'">
		<s:include value="/Other/OffDDM.jsp"/>
	</s:if>
	<s:else>
		<s:include value="/Other/PublicDDM.jsp"/>
	</s:else>
	
	<div id = "mainContent" style="overflow: auto;">
<h3>Poll Result</h3>
<s:a href="backFromResult.action">Back</s:a>
<p>
Question<br><b><s:property value="poll.question"/></b></p>
<p>
Option&nbsp;A&nbsp;&nbsp;&nbsp;&nbsp;<s:property value="poll.option1"/><br>
Option&nbsp;B&nbsp;&nbsp;&nbsp;&nbsp;<s:property value="poll.option2"/><br>
Option&nbsp;C&nbsp;&nbsp;&nbsp;&nbsp;<s:property value="poll.option3"/><br>
Option&nbsp;D&nbsp;&nbsp;&nbsp;&nbsp;<s:property value="poll.option4"/>
</p>
<br>
<table class="table">
<tr>
<th>Options</th>
<th>Votes</th>
<th>Percent</th>
</tr>
<tr>
	<td>Option&nbsp;A</td>
	<td><s:property value="poll.count1"/></td>
	<td><s:property value="poll.percent1"/></td></tr>
<tr>
	<td>Option&nbsp;B</td>
	<td><s:property value="poll.count2"/></td>
	<td><s:property value="poll.percent2"/></td></tr>
<tr>
	<td>Option&nbsp;C</td>
	<td><s:property value="poll.count3"/></td>
	<td><s:property value="poll.percent3"/></td></tr>
<tr>
	<td>Option&nbsp;D</td>
	<td><s:property value="poll.count4"/></td>
	<td><s:property value="poll.percent4"/></td>
</tr>
</table>

	</div>
	<br class="clearfloat"/>
	<s:include value="/Other/Footer.jsp"/>
</div>
	

</body>

</html>
