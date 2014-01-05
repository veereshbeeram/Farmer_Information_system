<%@taglib prefix="s" uri="/struts-tags"%>

<html>

<head>
<title>Farmer Buddy - Add Loan</title>
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
<p><font face="Estrangelo Edessa" style="font-size: 20pt">Add Loan Scheme With Details</font></p>
<a href="offView.action">Back</a>&nbsp;&nbsp;
		<a href="logout.action">Logout</a>	<br><br>	
<form method="POST" action="addloan.action">
	<div class = "message">
	<s:actionmessage />
	<s:actionerror />
	</div>
	<fieldset style="width: 366px; height: auto; padding: 0">
	<legend align="left">Enter Details</legend> 	
	<p>Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="text" name="loan.name"  size="20"/></p>
	<div class="message"><s:fielderror> <s:param>crop.name</s:param> </s:fielderror></div>
	<p>Amount(in Rs)&nbsp;&nbsp;&nbsp;<input type="text" name="loan.amount"  size="20"/></p>
	<div class="message"><s:fielderror> <s:param>crop.name</s:param> </s:fielderror></div>
	<p>Term(in yrs)&nbsp;&nbsp;&nbsp;&nbsp;	<input type="text" name="loan.term" /></p>
	<div class="message"><s:fielderror> <s:param>crop.name</s:param> </s:fielderror></div>
	<p>Income Range(in lacs)&nbsp;&nbsp;&nbsp; <input type="text" name="loan.income" size="20"/></p>
	<div class="message"><s:fielderror> <s:param>crop.name</s:param> </s:fielderror></div>
	<p>Interest(% per annum)&nbsp;&nbsp;&nbsp; <input type="text" name="loan.interest" size="20"/></p>
	<div class="message"><s:fielderror> <s:param>crop.name</s:param> </s:fielderror></div>
	</fieldset>	
	<p><input type="submit" value="Submit" />&nbsp;&nbsp;&nbsp;&nbsp;
	</p>
	</form>

	</div>
	<br class="clearfloat"/>
	<s:include value="/Other/Footer.jsp"/>
</div>
	

</body>

</html>
