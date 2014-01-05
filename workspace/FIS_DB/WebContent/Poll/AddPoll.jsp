<%@taglib prefix="s" uri="/struts-tags"%>

<html>

<head>
<title>Farmer Buddy - All Poll           </title>
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
<p><font face="Estrangelo Edessa" style="font-size: 20pt">Add Poll With Details</font></p>
<a href="offView.action">Back</a>&nbsp;&nbsp;
		<a href="logout.action">Logout</a>	<br><br>
<form method="POST" action="addPoll.action">
<div class="message">
	<s:actionmessage />
	<s:actionerror />
	</div>
	<fieldset style="width: 366px; height: auto;">
	<legend align="left">Enter Details</legend> 	
	<p>Question&nbsp;&nbsp;&nbsp;
	<textarea rows="2" name="poll.question" cols="20"></textarea></p>
	<div class="message"><s:fielderror> <s:param>poll.question</s:param> </s:fielderror></div>
	<p>Option A&nbsp;&nbsp;&nbsp;
	<textarea rows="2" name="poll.option1" cols="20"></textarea>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
	<div class="message"><s:fielderror> <s:param>poll.option1</s:param> </s:fielderror></div>
	<p>Option B&nbsp;&nbsp;&nbsp;
	<textarea rows="2" name="poll.option2" cols="20"></textarea>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p> 
	<div class="message"><s:fielderror> <s:param>poll.option2</s:param> </s:fielderror></div>
	<p>Option C&nbsp;&nbsp;&nbsp;
	<textarea rows="2" name="poll.option3" cols="20"></textarea></p>
	<div class="message"><s:fielderror> <s:param>poll.option3</s:param> </s:fielderror></div>
	<p>Option D&nbsp;&nbsp;&nbsp; <textarea rows="2" name="poll.option4" cols="20"></textarea>&nbsp;&nbsp;&nbsp;&nbsp; </p>
	<div class="message"><s:fielderror> <s:param>poll.option4</s:param> </s:fielderror></div>	
	<p>&nbsp;</p>
	</fieldset>

<p><input type="submit" value="Submit" name="B1"/>&nbsp;&nbsp;&nbsp;&nbsp;
	</p></form>

	</div>
	<br class="clearfloat"/>
	<s:include value="/Other/Footer.jsp"/>
</div>
	

</body>

</html>
