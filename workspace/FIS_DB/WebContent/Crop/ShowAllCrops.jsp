<%@taglib prefix="s" uri="/struts-tags"%>
<html>
	<head>
		<title>Farmer Buddy - Show Crops</title>
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
			<p><font face="Estrangelo Edessa" style="font-size: 20pt">Crop Listing&nbsp;&nbsp;</font></p>			
<a href="offView.action">Back</a>&nbsp;&nbsp;
		<a href="logout.action">Logout</a>	<br><br>	
			<br/><br/>
			
			<table class="table" >	
				<tr>
					<th>Name</th>
					<th>Type</th>
					<th>Season</th>
				</tr>
				<s:iterator value="crop.allCrops" >
					<tr class="alt">
						<td><s:property value="name"/></td> 
						<td><s:property value="type"/></td> 
						<td><s:property value="season"/></td>  
					</tr>
				</s:iterator>
			</table>

					<div class = "message">
					<s:actionerror/>
					<s:actionmessage/>
					</div>
				
			<br><br>
			<table class="table">	
				<tr>
					<td style="font-size:larger">Delete Crop</td>
					<td>
						<s:form action="deletecrop">
							<select size="1" name="crop.name" >
								<s:iterator value="crop.allCrops" >	
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
					<td style="font-size:larger">UpdateCrop</td>
					<td>
						<s:form action="updatecropView">
							<select size="1" name="crop.name" >
								<s:iterator value="crop.allCrops" >	
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
