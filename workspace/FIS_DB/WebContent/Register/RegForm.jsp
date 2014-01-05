<%@taglib prefix="s" uri="/struts-tags"%>
<html>

<head>

<script src="jquery.js"></script>

 <script language="JavaScript">	
	$(document).ready(function(){
		$.getJSON("fetchJSON.action?reg.state="+regForm.state.value,
		function(json){
			var eleDistrict = document.getElementById("district")
			var districtsInState = json.districtsInState
			for(var i=0;i<districtsInState.length;i++)
				eleDistrict.options[i] = new Option(districtsInState[i],districtsInState[i]);
		})});
	
	function checkUid(){
		$.getJSON("checkUid.action?reg.uid="+regForm.uid.value,
		function(json){
		alert(regForm.uid.value+" "+json.status); 
		})};
		
	function fetchJSONData(){
		$.getJSON("fetchJSON.action?reg.state="+regForm.state.value,
		function(json){
			var eleDistrict = document.getElementById("district")
			var districtsInState = json.districtsInState
			for(var i=0;i<districtsInState.length;i++)
				eleDistrict.options[i] = new Option(districtsInState[i],districtsInState[i]);
		})};
</script>

<title>Farmer Buddy - Registration Form</title>
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
<div id="container" style="height: 1500px">
 
	<div id="header" >
	 
	<a href = "<s:url value = 'myacc.action'/>"><img src="images/headLink.jpg" border="0" alt="Home Link" /> </a>
	</div>
	
	
		
		
	
	<div id = "mainContent" style="overflow: auto;height: 1400px">
	<s:include value="/Other/PublicDDM.jsp"/>
	<a href="home.action">Back</a><br>
<p><font face="Estrangelo Edessa" style="font-size: 20pt">Registration Form&nbsp;&nbsp; </font>

<form method="POST" action="register.action" id="regForm" onsubmit="return validate_fun(this);">
	<div class="message"><s:actionerror /></div>
	<font color="red">(*)Required Fields</font>
<fieldset style="padding: 2">
	<legend>Personal Details</legend>
    <p>Name&nbsp;<font color="red">*</font>&nbsp;&nbsp;<input type="text" id="name" name="reg.name" size="20"></p>
	<div class="message"><s:fielderror> <s:param>reg.name</s:param> </s:fielderror></div>	
	<p>Age&nbsp;<font color="red">*</font>&nbsp;&nbsp;<input type="text" id="age" name="reg.age" size="20"></p>
	<div class="message"><s:fielderror> <s:param>reg.age</s:param> </s:fielderror></div>
	<p>Address&nbsp;<font color="red">*</font>&nbsp;&nbsp;<input type="text" id="address" name="reg.address" size="20"></p>
	<div class="message"><s:fielderror> <s:param>reg.address</s:param> </s:fielderror></div>
	<p>State and District&nbsp;<font color="red">*</font>&nbsp;&nbsp;</p>
	
	<s:select list="#application.appInitValues.allStateNames" name="reg.state" id="state" onchange="fetchJSONData()"/>
	
	<select size="1" name="reg.district" id="district">
	</select>
	
	<p>Occupation &nbsp;<font color="red">*</font>&nbsp;&nbsp;
	<s:select list="#application.appInitValues.allOccupations" name="reg.occupation"/>
	
	<p>Annual Income&nbsp;<font color="red">*</font>&nbsp;&nbsp;<input type="text" id="income" name="reg.income" size="20"></p>
	<div class="message"><s:fielderror> <s:param>reg.income</s:param> </s:fielderror></div>
	<p>User ID&nbsp;<font color="red">*</font>&nbsp;&nbsp;<input type="text" id='uid' name="reg.uid" size="20" onchange="checkUid()"></p>
	<div class="message"><s:fielderror> <s:param>reg.uid</s:param> </s:fielderror></div><div class="message">
	<s:actionmessage/>
	</div>
	<p>Password&nbsp;<font color="red">*</font>&nbsp;&nbsp;<input type="password" id='password' name="reg.pwd" size="20"></p>
	<div class="message"><s:fielderror> <s:param>reg.pwd</s:param> </s:fielderror></div>
	<p>Re-type Password&nbsp;<font color="red">*</font>&nbsp;&nbsp;<input type="password" id='re-pass' name="reg.confirmPwd" size="20"></p>
	<div class="message"><s:fielderror> <s:param>reg.confirmPwd</s:param> </s:fielderror></div>
	</fieldset>
	<fieldset style="padding: 2">
	<legend>Dependant Details</legend>
	<fieldset style="padding: 10; margin: 10">
	<legend>Dependant 1</legend>
	<p>Name&nbsp;&nbsp;&nbsp;<input type="text" name="reg.dependant[0].name" size="20"></p>
	<p>Age&nbsp;&nbsp;&nbsp;<input type="text" name="reg.dependant[0].age" size="20"></p>
	<p>Relationship&nbsp;&nbsp;&nbsp;<input type="text" name="reg.dependant[0].relationship" size="20"></p>
	</fieldset>
	
	<fieldset style="padding: 10; margin: 10">
	<legend>Dependant 2</legend>
	<p>Name&nbsp;&nbsp;&nbsp;<input type="text" name="reg.dependant[1].name" size="20"></p>
	<p>Age&nbsp;&nbsp;&nbsp;<input type="text" name="reg.dependant[1].age" size="20"></p>
	<p>Relationship&nbsp;&nbsp;&nbsp;<input type="text" name="reg.dependant[1].relationship" size="20"></p>
	</fieldset>
	</fieldset>
	<fieldset style="padding: 2">
	<legend>Crop Details</legend>
	Tick the crops that you are currently cultivating <p>
	<s:checkboxlist name="reg.myCrops" list="#application.appInitValues.allCropNames" /></p>
</fieldset>
<br>
<p>
<button name="B1">Submit</button></p>

</form>

	</div>
	<br class="clearfloat"/>
	<s:include value="/Other/Footer.jsp"/>
</div>
	

</body>

</html>
