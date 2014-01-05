<%@taglib prefix="s" uri="/struts-tags"%>
<html>

	<head>
		<title>Farmer Buddy - Crop Listing</title>
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
			<p><font face="Estrangelo Edessa" style="font-size: 20pt">Your Crop Details&nbsp;&nbsp;</font></p>
			<s:a href="myacc.action">Back</s:a>&nbsp;&nbsp;
				<a href="logout.action">Logout</a><br>
	
			<div id = "mainContent" style="overflow: auto;">
				<br/><br/>
				
						<div class = "message"><s:actionerror/>
						<s:actionmessage/></div>
				<br/><br/>
			<table class="table">	
				<tr>
					<td style="font-size:larger">Delete Crop</td>
				<td>
					<s:form action="deleteoldcrop">
						<select size="1" name="crop.name" >
							<s:iterator value="crop.myCrops" >	
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
					<td style="font-size:larger">Add Crops</td>
					<td>
						<s:form action="addnewcrops">
							<s:label value="Tick any new crops that you are cultivating" labelposition="left"/>
							<br/>
							<table BORDER="2" BORDERCOLOR="#336699" CELLPADDING="1" CELLSPACING="5" WIDTH="100%">
								<s:checkboxlist name="crop.myCropNames" list="crop.otherCropNames" />
							</table>
							<table>
								<s:submit />
							</table>
						</s:form>
					</td>
				</tr>
			</table>
			<br/><br/>
			<table class="table">	
				<tr>
					<th>Name</th>
					<th>Type</th>
					<th>Season</th>
				</tr>
				<s:iterator value="crop.myCrops" >
					<tr>
						<td><s:property value="name"/></td> 
						<td><s:property value="type"/></td> 
						<td><s:property value="season"/></td>  
					</tr>
				</s:iterator>
			</table>
			</div>
			<br class="clearfloat"/>
			<s:include value="/Other/Footer.jsp"/>
		</div>
	</body>
</html>
