<%@ page language="java" contentType="text/html; charset=gbk"%>
<%@ page import="com.news.dao.*"  %>
<%@ page import="com.news.model.*"  %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  	<base href="<%=basePath%>">  
    <title>新闻内容详细信息</title>
    <link rel="stylesheet" type="text/css" href="CSS/style.css">
  </head> 
  <script type="text/javascript">
  	function goBack(){
  		window.location.href="IndexTemp.jsp";
  	}
  </script> 
  <body>
    <center>
    	<div id="top"><jsp:include page="top.jsp"/></div>
    	<div id="newsInfo">
    		<table border="0" width="900" height="250" cellpadding="0" cellspacing="0" >
    		<%
    			String strid = request.getParameter("strid");
    			OpDB opdb = new OpDB();
    			News news = opdb.OpGetNewsInfo(strid);
    			if(news != null){
    		 %>
    		 		<tr height="20"><td colspan="2"></td></tr>
    				<tr align="center">
    					<td colspan="2"><font style="font-size: 20px;font-family: 黑体;"><%=news.getInfo_title() %></font></td>    					
    				</tr>
    				<tr align="center">
    					<td><font style="font-size: 12px;color: gray;"><%=news.getInfo_creator() %></font></td>
    					<td><font style="font-size: 12px;color: gray;"><%=news.getInfo_date() %></font></td>
    				</tr>
    				<tr>
    					<td colspan="2"><%=news.getInfo_content() %></td>
    				</tr>	
    				<tr>
    					<td align="center" colspan="2">
    						<input type="button" value="返回" onclick="goBack();">
    					</td>
    				</tr>
    				<tr height="20"><td colspan="2"></td></tr>
    		<%
    			}	
    		 %>			
    		</table>
    	</div>
    	<div id="end"><jsp:include page="end.jsp"/></div>
    </center>
  </body>
</html>
