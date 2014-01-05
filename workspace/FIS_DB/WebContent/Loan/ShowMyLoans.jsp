<%@taglib prefix="s" uri="/struts-tags"%>

<html>

<head>
<title>Farmer Buddy - Show Loans</title>
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
	
	<s:include value="/Other/FarmerDDM.jsp"/>
<div id = "mainContent" style="overflow: auto;">
<h1>Loan Listing</h1>

<div class="message">
<s:actionerror/>
<s:actionmessage/>
</div>
	<s:a href="myacc.action">Back</s:a>&nbsp;&nbsp;
<a href="logout.action">Logout</a><br><br>			

<table class="table">	
<tr>
<td style="font-size:larger">Add New Loan Scheme(if any)</td>
<td>
<s:form action="addNewLoan">
	<select size="1" name="loan.lid" >
	<s:iterator value="loan.otherLoans" status="stat">	
	<option>
		<s:property value="loan.otherLoans[#stat.index]"/>
	</option>		
	</s:iterator>		
	</select>
	<s:submit value="Add"/>
</s:form>
</td>
</tr>
<tr>
<td style="font-size:larger">Delete Your Old Loan Scheme</td>
<td>
<s:form action="deleteoldloan">
	<select size="1" name="loan.name" >
	<s:iterator value="loan.myLoans" status="stat">	
	<option>
		<s:property value="loan.myLoans[#stat.index]"/>
	</option>		
	</s:iterator>		
	</select>
	<s:submit value="Delete"/>
</s:form>
</td>
</tr>
</table>
 <br><br>
<table class="table">	
<tr>
<th>Loan ID</th>
<th>Name</th>
<th>Amount</th>
<th>Term</th>
<th>Income Status</th>
<th>Interest</th>
</tr>
<s:iterator value="loan.allLoans" >
<tr>
<td><s:property value="lid"/></td> 
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
