<%@taglib prefix="s" uri="/struts-tags"%>

<html>

<head>
<title>Farmer Buddy - Add Officers</title>
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
	
	
		
	
	<s:include value="/Other/AdminDDM.jsp"/>
	<div id = "mainContent" style="overflow: auto;">
	<p><font face="Estrangelo Edessa" style="font-size: 20pt">Add New Officer Account</font></p>	
	
		<a href="admin.action">Back</a>&nbsp;&nbsp;
		<a href="logout.action">Logout</a><br>
<form method="POST" action="addOff.action" onsubmit="return validate_fun(this);">
	<div class="message">
	<s:actionmessage />
	<s:actionerror />
	</div>
	<fieldset style="width: 316px; height: auto; padding: 0">
	<legend >Enter Account Details</legend> 	
	<p>Name&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" id="name" name="reg.name"  size="20"/></p>
	<div class="message"><s:fielderror> <s:param>reg.name</s:param> </s:fielderror></div>
	<p>User ID&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" id="uid" name="reg.uid"  size="20"/></p>
	<div class="message"><s:fielderror> <s:param>reg.uid</s:param> </s:fielderror></div>
	<p>Password&nbsp;&nbsp;&nbsp;&nbsp;<input type="password" id="pwd" name="reg.pwd" />
	<div class="message"><s:fielderror> <s:param>reg.pwd</s:param> </s:fielderror></div>
	</fieldset>
	<p><input type="submit" value="Submit" name="B1"/>&nbsp;&nbsp;&nbsp;&nbsp;
	</p>
	</form>
	
	<table BORDER="2" BORDERCOLOR="#336699" align="center">	
				<tr>
					<th>Delete Officer Account</th>
					<td>
						<s:form action="deleteOff">
							<select size="1" name="reg.uid" >
								<s:iterator value="reg.offUidList" status="stat">	
									<option>
										<s:property value="reg.offUidList[#stat.index]"/>
									</option>		
								</s:iterator>		
							</select>
							<s:submit value="Delete"/>
						</s:form>
					</td>
				</tr>
				<tr>
			</table>
	
	</div>
	<br class="clearfloat"/>
	<s:include value="/Other/Footer.jsp"/>
</div>
	

</body>

</html>
