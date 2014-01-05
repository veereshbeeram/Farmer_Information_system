<%@taglib prefix="s" uri="/struts-tags"%>

<html>

<head>
<title>Farmer Buddy - Update Insurance</title>
<link rel="stylesheet" type="text/css" href = "<s:url value = 'css/login.css' />" >
<link rel="stylesheet" type="text/css" href = "<s:url value = 'css/menu.css' />" >
		<script language="javascript" src="script/menu.js"></script><style type="text/css">
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
<h3>Update Insurance Scheme With Details</h3>
<a href="allins.action">Back</a>&nbsp;&nbsp;
		<a href="logout.action">Logout</a>	<br><br>	
<form method="POST" action="updateins.action">
	<div class= "message">
	<s:actionmessage />
	<s:actionerror />
	</div>
	<fieldset style="width: 316px; height: auto; padding: 0">
	<legend align="left">Enter Details</legend> 	
	<input type="hidden" name="ins.insID" value="<s:property value="%{ins.insID}"/>" />
	<p>Name&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="ins.name"  size="20" value="<s:property value="%{ins.name}"/>"/></p>
	<div class="message"><s:fielderror> <s:param>ins.name</s:param> </s:fielderror></div>
	<p>Type&nbsp;&nbsp;&nbsp; &nbsp;<s:select list="ins.allTypes" name="ins.type"/></p>
	<p>Premium(in Rs)&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="ins.premium"  size="20" value="<s:property value="%{ins.premium}"/>"/></p>
	<div class="message"><s:fielderror> <s:param>ins.premium</s:param> </s:fielderror></div>
	<p>Term(in yrs)&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="ins.term" value="<s:property value="%{ins.term}"/>"/></p>
	<div class="message"><s:fielderror> <s:param>ins.term</s:param> </s:fielderror></div>
	<p>Interest(% per annum)&nbsp;&nbsp;&nbsp;&nbsp; <input type="text" name="ins.interest" size="20" value="<s:property value="%{ins.interest}"/>"/></p>
	<div class="message"><s:fielderror> <s:param>ins.interest</s:param> </s:fielderror></div>
	</fieldset>	
	<p><input type="submit" value="Submit" />&nbsp;&nbsp;&nbsp;&nbsp;</p>
	</form>
	</div>
	<br class="clearfloat"/>
	<s:include value="/Other/Footer.jsp"/>
</div>
	

</body>

</html>
