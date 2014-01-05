<%@taglib prefix="s" uri="/struts-tags"%>
<html>

	<head>
		<title>Farmer Buddy - Crop Listing</title>

<SCRIPT type="text/javascript">
function setDistrict(){
document.getElementById("favCrop").setAttribute("href","updatelocView.action?loc.district="+district.value)
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
	<p>	District Selected :<b> <s:property value="loc.district"/> </b></p>
	<a href="updatelocView.action" id="favCrop" onclick="setDistrict()">Back</a>&nbsp;&nbsp;
		<a href="logout.action">Logout</a>	<br><br>	
		<table class="table">	
				<tr>
					<td style="font-size:larger">Delete Crop</td>
				<td>
					<s:form action="deleteOldFavCrop">
						<input type="hidden" name="loc.district" id="district" value="<s:property value="%{loc.district}"/>"/>
						<s:select list="loc.favCrops" name="loc.oldFavCrop"></s:select>
						<s:submit value="Delete"/>
					
					</s:form>
				</td>
				</tr>
				<tr>
					<td style="font-size:larger">Add More Favourable Crops</td>
					<td>
						<s:form action="addNewFavCrop">
							<input type="hidden" name="loc.district" id="district" value="<s:property value="%{loc.district}"/>"/>
							<s:label labelposition="left"/>
							<br/>
							<table BORDER="2" BORDERCOLOR="#336699" CELLPADDING="1" CELLSPACING="5" WIDTH="100%">
								<s:select list="loc.unFavCrops" name="loc.newFavCrop"/>
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
