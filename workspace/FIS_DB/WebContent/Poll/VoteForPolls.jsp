<%@taglib prefix="s" uri="/struts-tags"%>

<html>

<head>
<title>Farmer Buddy - Vote In Polls</title>
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
	
		
	
	<div id = "mainContent" style="overflow: auto;">
<h3>Poll Listing</h3>
<br><br>
<s:a href="home.action">Back</s:a><br><br>
<table class="table">	
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

<br>
<s:form method="post" action="voteForPolls">
	
<s:iterator value="poll.allPolls" status="stat">

Q<s:property value="pollID"/>)&nbsp;&nbsp;<s:property value="question" /><br>
<s:radio list="options" name="poll.allPolls[%{#stat.index}].option%{#stat.index+1}" value=""/>
<s:hidden name="poll.allPolls[%{#stat.index}].pollID" value="%{pollID}" />
<br><br>	
</s:iterator>
<input type="submit" value="Register Vote" name="B1">

</s:form>


	</div>
	<br class="clearfloat"/>
	<s:include value="/Other/Footer.jsp"/>
</div>
	

</body>

</html>
