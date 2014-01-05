<%@taglib prefix="s" uri="/struts-tags"%>

<html>

<head>
<title>Farmer Buddy - Update Loan            </title>
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
<h3>Update Loan Scheme With New Details</h3>
<a href="allloan.action">Back</a>&nbsp;&nbsp;
		<a href="logout.action">Logout</a>	<br><br>
<form method="POST" action="updateloan.action">
	<div class="message">
	<s:actionmessage />
	<s:actionerror />
	</div>
	<fieldset style="width: 316px; height: auto; padding: 0">
	<legend align="left">Enter New Scheme Details</legend>
	Loan Scheme name is : <b><s:property value="%{loan.name}"/></b>
	<input type="hidden" name="loan.name" value="<s:property value="%{loan.name}"/>" size="20"/>
    <p>Amount&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="loan.amount" value="<s:property value="loan.amount "/>" size="20"/></p>
    <div class="message"><s:fielderror> <s:param>loan.amount</s:param> </s:fielderror></div>
	<p>Term&nbsp;&nbsp;&nbsp;&nbsp;	<input type="text" name="loan.term" value="<s:property value="%{loan.term}"/>"/></p>
	<div class="message"><s:fielderror> <s:param>loan.term</s:param> </s:fielderror></div>
	<p>Income Range&nbsp;&nbsp; <input type="text" name="loan.income" value="<s:property value="%{loan.income}"/>"size="20"/></p>
	<div class="message"><s:fielderror> <s:param>loan.income</s:param> </s:fielderror></div>
	<p>Interest&nbsp;&nbsp; <input type="text" name="loan.interest" value="<s:property value="%{loan.interest}"/>"size="20"/></p>
	<div class="message"><s:fielderror> <s:param>loan.interest</s:param> </s:fielderror></div>
	<p><input type="submit" value="Submit" name="B1"/></p>
	
	</fieldset></form>

	</div>
	<br class="clearfloat"/>
	<s:include value="/Other/Footer.jsp"/>
</div>
	

</body>

</html>
