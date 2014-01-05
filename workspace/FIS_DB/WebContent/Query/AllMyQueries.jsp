<%@taglib prefix="s" uri="/struts-tags"%>

<html>

<head>
<title>Farmer Buddy -  My Queries </title>
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

<h3>Query Listing</h3>
<div class="message">
<s:actionerror/>
<s:actionmessage/>
</div>
<p><a href="myacc.action">Back</a></p>
<s:iterator value="query.queryList" status="stat">
<p>	Q<s:property value="#stat.index+1"/>)&nbsp;&nbsp;
	<s:property value="queryText"/>
	<br>
	A<s:property value="#stat.index+1"/>)&nbsp;&nbsp;
	<s:if test="%{ans!='none1'}">
	<s:property value="ans"/>
	</s:if>
	<s:else>
	Not Yet Answered
	</s:else>
</p>	
</s:iterator>

	</div>
	<br class="clearfloat"/>
	<s:include value="/Other/Footer.jsp"/>
</div>
	

</body>

</html>
