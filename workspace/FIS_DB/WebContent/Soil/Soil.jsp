<%@taglib prefix="s" uri="/struts-tags"%>
<html>

	<head>
		<title>Farmer Buddy - Soil Listing</title>
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
	 			<a href = "<s:url value = 'offView.action'/>"><img src="images/headLink.jpg" border="0" alt="Home Link" /> </a>
			</div>
			<s:include value="/Other/OffDDM.jsp"/>
			<div id = "mainContent" style="overflow: auto;">
				<br/><br/>
						<div class = "message"><s:actionerror/>
						<s:actionmessage/></div>
				<br/><br/>
				<font face="Estrangelo Edessa" style="font-size: 20pt">Present soils :</font><br> 
					<a href="offView.action">Back</a>&nbsp;&nbsp;
		<a href="logout.action">Logout</a>	<br><br>	
		<s:iterator value="soil.allSoils" >
					<s:property value="name"/>&nbsp;&nbsp;
				</s:iterator>
			<br /><br />
			<table class="table">	
				<tr>
					<td style="font-size:larger">Delete Soil</td>
				<td>
					<s:form action="deletesoil">
						<select size="1" name="soil.name" >
							<s:iterator value="soil.allSoils" >	
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
					<td style="font-size:larger">Add Soil</td>
					<td>
						<s:form action="addsoil">
							<s:label value="Name" labelposition="left"/>
							<br/>
							<s:textfield name="soil.name"></s:textfield>	
							<table>
								<s:submit />
							</table>
						</s:form>
					</td>
				</tr>
			</table>
			<br/><br/>
				
			</div>
			<br class="clearfloat"/>
			<s:include value="/Other/Footer.jsp"/>
		</div>
	</body>
</html>
