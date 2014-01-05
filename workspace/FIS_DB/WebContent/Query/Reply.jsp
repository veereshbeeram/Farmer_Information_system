<%@taglib prefix="s" uri="/struts-tags"%>

<html>

<head>
<title>Farmer Buddy - Reply to Queries            </title>
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
<h3>Reply to Query</h3>
<a href="myQuery.action">Back</a>&nbsp;&nbsp;
		<a href="logout.action">Logout</a>	<br><br>	
<form method="POST" action="addReply.action">
<fieldset style="padding: 2">
	<legend>Query-Reply</legend>
	<p>Query Text&nbsp;&nbsp; : &nbsp;&nbsp;<s:property value="#parameters.queryText" /> </p>
	<s:hidden name="query.qid" value="%{#parameters.qid}" />
	<p>Answer Query&nbsp;&nbsp; </p>
	<p>&nbsp;<textarea rows="10" name="query.ans" cols="43"></textarea></p><div class="message"><s:fielderror> <s:param>query.ans</s:param> </s:fielderror></div>
	</fieldset><input type="submit" value="Submit" name="B1"/>
</form>

	</div>
	<br class="clearfloat"/>
	<s:include value="/Other/Footer.jsp"/>
</div>
	

</body>

</html>
