<%@taglib prefix="s" uri="/struts-tags"%>

<html>

<head>
<title>Farmer Buddy -  Post Query           </title>
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
			<s:include value="/Other/StudentDDM.jsp"/>
		</s:else>		
	
	
	<div id = "mainContent" style="overflow: auto;">

<h3>Post a Query</h3>

<p><a href="myacc.action">Back</a></p>
<form method="POST" action="postQuery.action">
	<div class="message"><s:actionmessage />
	<s:actionerror /></div>
	<fieldset style="padding: 2">
	<legend>Enter Details</legend>
	
	<p>Officer Name&nbsp;&nbsp;&nbsp; <s:select list="query.offNames" name="query.offName" emptyOption="true"/></p>

	<p>Your Query&nbsp;&nbsp;&nbsp;
	
	<textarea rows="4" name="query.queryText" cols="28"></textarea></p>
	<div class="message"><s:fielderror> <s:param>query.queryText</s:param> </s:fielderror></div>
	<p>&nbsp;</p>
	</fieldset><input type="submit" value="Submit" name="B2">
</form>

	</div>
	<br class="clearfloat"/>
	<s:include value="/Other/Footer.jsp"/>
</div>
	

</body>

</html>
