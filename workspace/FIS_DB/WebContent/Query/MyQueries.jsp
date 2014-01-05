<%@taglib prefix="s" uri="/struts-tags"%>

<html>

<head>
<title>Farmer Buddy - My Queries            </title>
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

<p><font face="Estrangelo Edessa" style="font-size: 20pt">Query Listing&nbsp;&nbsp;&nbsp;</font></p>
<div class="message">
<s:actionerror/>
<s:actionmessage/>
</div>
<a href="offView.action">Back</a>&nbsp;&nbsp;
		<a href="logout.action">Logout</a>	<br><br>	
<s:iterator value="query.queryList" status="stat">
	Q<s:property value="#stat.index+1"/>)&nbsp;&nbsp;
	<s:a href="replyToQuery.action?queryText=%{queryText}&qid=%{qid}">
		<s:property value="queryText"/>
		<br>
	</s:a>
</s:iterator>

	</div>
	<br class="clearfloat"/>
	<s:include value="/Other/Footer.jsp"/>
</div>
	

</body>

</html>
