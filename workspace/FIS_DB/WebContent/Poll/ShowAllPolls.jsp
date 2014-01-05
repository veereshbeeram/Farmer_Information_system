<%@taglib prefix="s" uri="/struts-tags"%>

<html>

<head>
<title>Farmer Buddy - Show All Polls</title>
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
<p><font face="Estrangelo Edessa" style="font-size: 20pt">Poll Listing</font></p>
<a href="offView.action">Back</a>&nbsp;&nbsp;
		<a href="logout.action">Logout</a>	<br><br>	
<div class ="message"><s:actionerror/>
<s:actionmessage/></div>
<table class="table">	
<tr>
<td style="font-size:larger">Delete Poll</td>
<td>
<s:form action="deletePoll">
	<select size="1" name="poll.pollID" >
	<s:iterator value="poll.allPolls" >	
	<option>
		<s:property value="pollID"/>
	</option>		
	</s:iterator>		
	</select>
	<s:submit value="Delete"/>
</s:form>
</td></tr>
<tr>
<td style="font-size:larger">Poll Results</td>
<td>
<s:form action="pollResult">
	<select size="1" name="poll.pollID" >
	<s:iterator value="poll.allPolls" >	
	<option>
		<s:property value="pollID"/>
	</option>		
	</s:iterator>		
	</select>
	<s:submit value="Show Result"/>
</s:form>
</table>
<br><br>
<table class="table">	
<s:iterator value="poll.allPolls" status="stat">
<tr>
<td>
Q<s:property value="pollID"/>)&nbsp;&nbsp;<s:property value="question" /><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;A1)&nbsp;&nbsp;
<s:property value="option1"/><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;A2)&nbsp;&nbsp;
<s:property value="option2"/><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;A3)&nbsp;&nbsp;
<s:property value="option3"/><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;A4)&nbsp;&nbsp;
<s:property value="option4"/><br>
</td> 
</tr>
</s:iterator>
</table>

	</div>
	<br class="clearfloat"/>
	<s:include value="/Other/Footer.jsp"/>
</div>
	

</body>

</html>
