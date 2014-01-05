<%@taglib prefix="s" uri="/struts-tags"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Farmer Buddy - Error Page</title>
<link rel="stylesheet" type="text/css" href = "<s:url value = 'css/login.css' />" >
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
	
	<div id="sidebar" >
		
	</div>
	
	<div id = "mainContent" style="overflow: auto;">
		<p>The following error occured while attempting to do the requested action</p>
		<div class ="message"><s:actionerror/></div>
		<s:property value="exception.message"/>
		<p>Please Contact Admin</p>
	</div>
	<br class="clearfloat"/>
	<div id = "footer">
	<a href = "<s:url value='home.action'/>" ><img src = "images/home.png" border="0" alt="home"/> </a>
	<a href = "<s:url value='htmls/about.html'/>"><img src = "images/about.png" border="0" alt="aboutUs"/></a>
	<a href = "<s:url value='htmls/sitemap.html'/>"> <img src = "images/site.png" border="0" alt="siteMap"/></a>
	<a href = "<s:url value='htmls/contact.html'/>"> <img src = "images/contact.png" border="0" alt="contactUs"/> </a>
	</div>
</div>
	

</body>

</html>
