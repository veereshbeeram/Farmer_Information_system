<%@taglib prefix="s" uri="/struts-tags"%>
<html>

	<head>
		<title>Farmer Buddy - Soil Listing</title>

<SCRIPT type="text/javascript">
function setCropName(){
document.getElementById("cropDet").setAttribute("href","updatecropView.action?crop.name="+cropName.value)
}
</script>		


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
				<br/><br/>
				
						<div class = "message"><s:actionerror/>
						<s:actionmessage/></div>
					
				<br/><br/>
				<s:a href="updatecropView.action" id="cropDet" onclick="setCropName()">Back</s:a>&nbsp;&nbsp;
		<a href="logout.action">Logout</a>	<br><br>
	<p>	Crop Selected :<b> <s:property value="crop.name"/> </b></p>
		<table class="table">	
				<tr>
					<td style="font-size:larger">Delete Soil</td>
				<td>
					<s:form action="deleteOldFavSoil">
						<input type="hidden" name="crop.name" id="cropName" value="<s:property value="%{crop.name}"/>"/>
						<s:select list="crop.favSoils" name="crop.oldFavSoil"></s:select>
						<s:submit value="Delete"/>
					
					</s:form>
				</td>
				</tr>
				<tr>
					<td style="font-size:larger">Add More Suitable Soils</td>
					<td>
						<s:form action="addNewFavSoil">
							<input type="hidden" name="crop.name" id="cropName" value="<s:property value="%{crop.name}"/>"/>
							<s:label labelposition="left"/>
							<br/>
							<table BORDER="2" BORDERCOLOR="#336699" CELLPADDING="1" CELLSPACING="5" WIDTH="100%">
								<s:select list="crop.unfavSoils" name="crop.newFavSoil"/>
							</table>
							<s:submit value="Add"/>
							
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
