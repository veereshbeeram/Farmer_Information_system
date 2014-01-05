<%@taglib prefix="s" uri="/struts-tags"%>

<html>

<head>
<title>Farmer Buddy - Add Insurance</title>
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
<div id = "mainContent" style="overflow: auto;">
<p><font face="Estrangelo Edessa" style="font-size: 20pt">Add Insurance Scheme With Details</font></p>
<a href="offView.action">Back</a>&nbsp;&nbsp;
		<a href="logout.action">Logout</a>	<br><br>	
<form method="POST" action="addins.action">
	<div class="message">
	<s:actionmessage />
	<s:actionerror />
	</div>
	<fieldset style="width: 376px; height: auto; padding: 0">	
	<legend align="left">Enter Details</legend> 	
	<p>Name&nbsp;&nbsp;&nbsp;&nbsp; <input type="text" name="ins.name"  size="20"/></p>
	<div class="message"><s:fielderror> <s:param>ins.name</s:param> </s:fielderror></div>
	<p>Type&nbsp;&nbsp;&nbsp;&nbsp; <select size="1" name="ins.type">
	<option>Crop</option>
	<option>Equipment</option>
	<option>Personal</option>
	</select></p>
	<p>Premium(in Rs)&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="ins.premium"  size="20"/></p>
	<div class="message"><s:fielderror> <s:param>ins.premium</s:param> </s:fielderror></div>
	<p>Term(in yrs)&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="ins.term" /></p>
	<div class="message"><s:fielderror> <s:param>ins.term</s:param> </s:fielderror></div>
	<p>Interest(% per annum)&nbsp;&nbsp;&nbsp;&nbsp; <input type="text" name="ins.interest" size="20"/></p>
	<div class="message"><s:fielderror> <s:param>ins.interest</s:param> </s:fielderror></div>
	</fieldset>	
	<p><input type="submit" value="Submit" /></p>
		</form>

	</div>
	<br class="clearfloat"/>
	<s:include value="/Other/Footer.jsp"/>
</div>
	

</body>

</html>
