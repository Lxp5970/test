<%@ page language="java" contentType="text/html; charset=gbk"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String mainPage = request.getParameter("mainPage");
if(mainPage == null || mainPage.equals("")){
	mainPage = "default.jsp";
}else if(mainPage.equals("display")){
	mainPage = "display.jsp";
}else if(mainPage.equals("showSearch")){
	mainPage = "showSearch.jsp";
}else if(mainPage.equals("news_type")){
	mainPage = "news_type.jsp";
}
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">    
    <title>新闻发布系统前台首页</title>
	<link rel="stylesheet" type="text/css" href="CSS/style.css">
  </head>  
  <body>
    <center>
    	<div id="top"><jsp:include page="top.jsp"/></div>
    	<div id="left"><jsp:include page="left.jsp"/></div>
    	<div id="default"><jsp:include page="<%=mainPage %>"/></div>
    	<div id="end"><jsp:include page="end.jsp"/></div>
    </center>
  </body>
</html>
