<%@taglib prefix="s" uri="/struts-tags"%>

<html>

<head>
<title>Farmer Buddy - Login Page</title>
<link rel="stylesheet" type="text/css" href = "<s:url value = 'css/login.css' />"  >
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
<script language="javascript" src="globalscript.js"></script>
<script type="text/javascript">
	function validate_fun(thisform){
		var temp=0;
		with(thisform){
			if(validator_null(username)==false)
			{
				document.getElementById("usernameError").innerHTML= 'Username&nbsp; <input type="text" id="username" name="user.uid" size="20"">'+"&nbsp;<span style='color:red;font-size:75%'>Enter the UserName</span>";
				username.focus();
				temp=temp+1;
			}
			else{
			document.getElementById("usernameError").innerHTML= 'Username&nbsp; <input type="text" id="username" name="user.uid" size="20" value="'+document.getElementById("username")+'">';}

			if(validator_null(password)==false)
			{
				document.getElementById("passwordError").innerHTML= 'Password&nbsp; <input type="password" id="password" name="user.pwd" size="20">' +"&nbsp;<span style='color:red;font-size:75%'>Enter the password</span>";
				password.focus();
				temp=temp+1;
			}
			else
			document.getElementById("passwordError").innerHTML= 'Password&nbsp; <input type="password" id="password" name="user.pwd" size="20" value="'+document.getElementById("username")+'">';}
			if(temp==0)return true;
			else return false;
			}
		}
	</script>
</head>

<body class = "twoColFixRtHdr">
<div id="container">

	<div id="header" >

	<a href = "<s:url value = 'myacc.action'/>"><img src="images/headLink.jpg" border="0" alt="Home Link" /> </a>
	</div>


		<div id = "mainContent">
			<s:include value="/Other/PublicDDM.jsp"/><br /><br /><br />
		<iframe width="550" frameborder="0" src="Other/Content.html" height="400">
		</iframe>
  <div id="sidebar" >
		<h3>Login Form&nbsp;&nbsp;</h3>
		<div id = "message">
		<s:actionerror/>
		<s:actionmessage/>
		</div>

		<form action="verify.action" method="POST" onsubmit="return validate_fun(this);">

						<div id="usernameError">Username&nbsp; <input type="text" id="username" name="user.uid" size="20" ></div>
						<br><div class="message"><s:fielderror> <s:param>user.uid</s:param> </s:fielderror></div>
						<div id="passwordError">Password&nbsp;&nbsp; <input type="password" id="password" name="user.pwd" size="20"></div>
						<div class="message"><s:fielderror> <s:param>user.pwd</s:param> </s:fielderror></div>
						<p>&nbsp;<s:submit value="Login" />&nbsp;&nbsp;&nbsp;<s:reset value="Reset" /><br /><br /><a href="registerView.action">NewUser?Register Here</a></p>
					</form>


	</div>
	</div>
	
	<br class="clearfloat"/>
	<s:include value="/Other/Footer.jsp"/>
</div>  

</body>

</html>
