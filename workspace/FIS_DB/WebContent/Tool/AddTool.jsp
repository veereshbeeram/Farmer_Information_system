<%@taglib prefix="s" uri="/struts-tags"%>

<html>

<head>
<title>Farmer Buddy - Upload Tools/Solutions             </title>
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
	 
	<a href = "<s:url value = 'home.action'/>"><img src="images/headLink.jpg" border="0" alt="Home Link" /> </a>
	</div>
	
	<s:include value="/Other/OffDDM.jsp"/>
	<div id = "mainContent">
	<p><font face="Estrangelo Edessa" style="font-size: 20pt">Add Tool With Details</font></p>
		<div class="message">
		<s:actionmessage />
		</div>
		<br>
		<a href="offView.action">Back</a>&nbsp;&nbsp;
		<a href="logout.action">Logout</a>	<br><br>
		<s:form action="addTool" method="POST" enctype="multipart/form-data">

<p>Select File &nbsp;&nbsp;&nbsp;<s:file name="upload"/></p>
<div class="message"><s:fielderror> <s:param>upload</s:param> </s:fielderror></div>
<p>Name of Tool/Solution &nbsp;&nbsp;&nbsp; <input type="text" name="name"  size="20"/></p>
<div class="message"><s:fielderror> <s:param>name</s:param> </s:fielderror></div>
<p>Manufacturer &nbsp;&nbsp;&nbsp; <input type="text" name="manufacturer"  size="20"/></p>
<div class="message"><s:fielderror> <s:param>manufacturer</s:param> </s:fielderror></div>
<s:submit />
</s:form>
		
	</div>
	<br class="clearfloat"/>
	<s:include value="/Other/Footer.jsp"/>
</div>
	

</body>

</html>
