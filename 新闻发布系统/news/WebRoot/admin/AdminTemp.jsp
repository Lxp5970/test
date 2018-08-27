<%@ page language="java" contentType="text/html; charset=gbk"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String mainPage = request.getParameter("mainPage");
if(mainPage == null || mainPage.equals("")){
	mainPage = "defaultt.jsp";
}else if(mainPage.equals("news_add")){
	mainPage = "news_add.jsp";
}else if(mainPage.equals("news_select")){
	mainPage = "news_select.jsp";
}else if(mainPage.equals("person_add")){
	mainPage = "person_add.jsp";
}else if(mainPage.equals("person_select")){
	mainPage = "person_select.jsp";
}else if(mainPage.equals("person_info")){
	mainPage = "person_info.jsp";
}
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>ºóÌ¨Ê×Ò³</title>
    <link rel="stylesheet" type="text/css" href="CSS/style.css">
  </head>
  <body>
    <center>
    	<div id="admin_top"></div>
    	<div id="admin_default"><jsp:include page="<%=mainPage %>"/></div>
    	<div id="right"><jsp:include page="right.jsp"/></div>
    	<div id="admin_end"><jsp:include page="end.jsp"/></div>
    </center>
  </body>
</html>
