<%@taglib prefix="s" uri="/struts-tags"%>

<html>

<head>
<title>Farmer Buddy - loan Listing</title>
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
<h3>Loan Listing</h3>
<a href="home.action">Back</a><br><br>
		<table class="table">	
			<tr>
				<th>Name</th>
				<th>Amount</th>
				<th>Term</th>
				<th>Income Status</th>
				<th>Interest</th>
			</tr>
			<s:iterator value="loan.allLoans" >
			<tr>
				<td><s:property value="name"/></td> 
				<td><s:property value="amount"/></td> 
				<td><s:property value="term"/></td> 
				<td><s:property value="income"/></td>
				<td><s:property value="interest"/></td>  
			</tr>
			</s:iterator>
		</table>
	</div>
	<br class="clearfloat"/>
	<s:include value="/Other/Footer.jsp"/>
</div>
	

</body>

</html>
