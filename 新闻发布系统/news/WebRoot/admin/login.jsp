<%@ page language="java" contentType="text/html; charset=gbk"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String mainPage = request.getParameter("mainPage");
if(mainPage == null || mainPage.equals("login")){
	mainPage = "default.jsp";
}else if(mainPage.equals("AddUser")){
	mainPage = "AddUser.jsp";
}else if(mainPage.equals("updatePwd")){
	mainPage = "updatePwd.jsp";
}
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">    
    <title>ºóÌ¨µÇÂ½Ò³Ãæ</title>
    <link rel="stylesheet" type="text/css" href="CSS/style.css">
  </head>
  <body>
    <center>
    	<div id="top"><jsp:include page="top.jsp"/></div>
    	<div id="login_default"><jsp:include page="<%=mainPage %>"/></div>
    	<div id="end"><jsp:include page="end.jsp"/></div>
    </center>
  </body>
</html>
