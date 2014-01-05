<%@taglib prefix="s" uri="/struts-tags"%>
<html>

<head>

<script src="jquery.js"></script>
  
	<script>	
	$(document).ready(function(){
		$.getJSON("fetchJSON.action?reg.state="+regForm.state.value,
		function(json){
			var eleDistrict = document.getElementById("district")
			var districtsInState = json.districtsInState
			for(var i=0;i<districtsInState.length;i++){
				eleDistrict.options[i] = new Option(districtsInState[i],districtsInState[i]);
				if(districtsInState[i]==regForm.myDistrict.value)
					eleDistrict.options[i].setAttribute("selected","selected")
				}
			})
		document.getElementById("myDistrict").setAttribute("name","myDistrict");
		});
	
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

<title>Farmer Buddy - Update Account            </title>
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
	
	
		
		<s:if test="#session['user'].userRole=='Agricultural Officer'">
			<s:include value="/Other/OffDDM.jsp"/>
		</s:if>
		<s:elseif test="#session['user'].userRole=='Farmer'">
			<s:include value="/Other/FarmerDDM.jsp"/>
		</s:elseif>
		<s:else>
			<s:include value="/Other/StudentDDM.jsp"/>
		</s:else>
	
	<div id = "mainContent" style="overflow: auto;height: 1400px" >
<br> <a href="myacc.action">Back</a> 
<p><font face="Estrangelo Edessa" style="font-size: 20pt">Update Account Details&nbsp;&nbsp;</font></p>

<form method="POST" action="updateacc.action" id="regForm">
	<div class="message">
	<s:actionmessage/>
	<s:actionerror />
	</div>
	<font color="red">(*)Required Fields<br>(**)Unalterable Fields</font>
<fieldset style="padding: 2;">

	<legend>Personal Details</legend>
	<p>Name&nbsp;<font color="red">*</font>&nbsp;&nbsp;<input type="hidden" name="reg.fid" value="<s:property value="%{reg.fid}"/>" /><input type="text" name="reg.name" value="<s:property value="%{reg.name}"/>" size="20"></p>
	<div class="message"><s:fielderror> <s:param>reg.name</s:param> </s:fielderror></div>
	<p>Age&nbsp;<font color="red">*</font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="reg.age" value="<s:property value="%{reg.age}"/>" size="20"></p>
	<div class="message"><s:fielderror> <s:param>reg.age</s:param> </s:fielderror></div>	
	<p>Address&nbsp;<font color="red">*</font>&nbsp;&nbsp;<input type="text" name="reg.address" value="<s:property value="%{reg.address}"/>" size="20"></p>
	<div class="message"><s:fielderror> <s:param>reg.address</s:param> </s:fielderror></div>
	<p>State and District&nbsp;<font color="red">*</font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
	<s:select list="#application.appInitValues.allStateNames" value="%{reg.state}" name="reg.state" id="state" onchange="fetchJSONData()" />
	<select size="1" name="reg.district" id="district">
	</select>
	<input type="hidden" name="reg.district" value="<s:property value="%{reg.district}"/>" id="myDistrict"/>
	<p>Occupation &nbsp;<font color="red">**</font>&nbsp;&nbsp;<input type="text" name="reg.occupation" value="<s:property value="%{reg.occupation}"/>" size="20" readonly="readonly"></p>
	<p>Annual Income&nbsp;<font color="red">*</font>&nbsp;&nbsp;<input type="text" name="reg.income" value="<s:property value="%{reg.income}"/>" size="20"></p>
	<div class="message"><s:fielderror> <s:param>reg.income</s:param> </s:fielderror></div>	
	<p>User ID&nbsp;<font color="red">**</font>&nbsp;&nbsp;<input type="text" id="uid" name="reg.uid" value="<s:property value="%{reg.uid}"/>" size="20" readonly="readonly"></p>
	<p>Password&nbsp;<font color="red">*</font>&nbsp;&nbsp;<input type="password" name="reg.pwd" value="<s:property value="%{reg.pwd}"/>" size="20"></p>
	<div class="message"><s:fielderror> <s:param>reg.pwd</s:param> </s:fielderror></div>
	<p>Re-type Password&nbsp;<font color="red">*</font>&nbsp;&nbsp;<input type="password" name="reg.confirmPwd" value="<s:property value="%{reg.pwd}"/>" size="20"></p>
	<div class="message"><s:fielderror> <s:param>reg.confirmPwd</s:param> </s:fielderror></div>
	</fieldset>
	<fieldset style="padding: 2">
	<legend>Dependant Details</legend>
		<fieldset style="padding: 10; margin: 10">
	<legend>Dependant 1</legend>
	<p>Name&nbsp;<input type="text" name="reg.dependant[0].name" value="<s:property value="%{reg.dependant[0].name}"/>" size="20"></p>
	<p>Age&nbsp;<input type="text" name="reg.dependant[0].age" value="<s:property value="%{reg.dependant[0].age}"/>" size="20"></p>
		<p>Relationship&nbsp;<input type="text" name="reg.dependant[0].relationship" value="<s:property value="%{reg.dependant[0].relationship}"/>" size="20"></p>
</fieldset>
	<fieldset style="padding: 10; margin: 10">
<legend>Dependant 2</legend>
	<p>Name&nbsp;<input type="text" name="reg.dependant[1].name" value="<s:property value="%{reg.dependant[1].name}"/>" size="20"></p>
	<p>Age&nbsp;<input type="text" name="reg.dependant[1].age" value="<s:property value="%{reg.dependant[1].age}"/>" size="20"></p>
		<p>Relationship&nbsp;<input type="text" name="reg.dependant[1].relationship" value="<s:property value="%{reg.dependant[1].relationship}"/>" size="20"></p>
	</fieldset>
	</fieldset>
<br/>
<button name="B1">Update</button>

</form>

	</div>
	<br class="clearfloat"/>
	<s:include value="/Other/Footer.jsp"/>
</div>
	

</body>

</html>
