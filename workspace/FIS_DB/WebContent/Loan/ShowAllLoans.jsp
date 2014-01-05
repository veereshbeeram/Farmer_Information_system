<%@taglib prefix="s" uri="/struts-tags"%>

<html>

<head>
<title>Farmer Buddy - Show All Loans</title>
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
<p><font face="Estrangelo Edessa" style="font-size: 20pt">Loan Listing</font></p>
<br><br>
<a href="offView.action">Back</a>&nbsp;&nbsp;
		<a href="logout.action">Logout</a>	<br><br>	
<div class = "message"><s:actionerror/>
<s:actionmessage/></div>


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
<br><br>
<table class="table">	
<tr>
<td style="font-size:larger">Delete Loan</td>
<td>
<s:form action="deleteloan">
	<select size="1" name="loan.name" >
	<s:iterator value="loan.allLoans" >	
	<option>
		<s:property value="name"/>
	</option>		
	</s:iterator>		
	</select>
	<s:submit value="Delete"/>
</s:form>
</td>
</tr>
<tr>
<td style="font-size:larger">Update Loan</td>
<td>
<s:form action="updateloanView">
	<select size="1" name="loan.name" >
	<s:iterator value="loan.allLoans" >	
	<option>
		<s:property value="name"/>
	</option>		
	</s:iterator>		
	</select>
	<s:submit value="Update"/>
</s:form>
</td>
</tr>
</table>
<br><br>
	</div>
	<br class="clearfloat"/>
	<s:include value="/Other/Footer.jsp"/>
</div>
	

</body>

</html>
