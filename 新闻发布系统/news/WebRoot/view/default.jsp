<%@ page language="java" contentType="text/html; charset=gbk"%>
<%@ page import="com.news.dao.*"%>
<%@ page import="com.news.model.*" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>      
    <title>内容显示区文件</title>
  </head>  
  <body>
    <table border="1" width="690" height="500" cellpadding="0" cellspacing="0" align="right">
    	<tr>
    		<td>
    			<table border="0" width="640" heignt="500" cellpadding="0" cellspacing="0">
    				<tr align="center">
    					<td><a href="http://military.china.com.cn/2017-06/26/content_41100169_2.htm"><img src="images/wujing.jpg" height="250" width="450"></a></td>
    				</tr>
    				<tr height="20"><td></td></tr>
    				<tr>
    					<td style="text-indent: 30px;font-family: 黑体;font-size: 25px;color: blue;">即时新闻</td>
    				</tr>
    				<tr><td><hr></td></tr>
    				<% 
    					OpDB opdb = new OpDB();
    					ArrayList<News> list = opdb.OpGetNews();
    					if(list != null && list.size() > 0){
    						for(News n : list){
    				%>
    				<tr align="center">
    					<td><a href="view/news_info.jsp?strid=<%=n.getId()%>"><%=n.getInfo_title() %></a></td>
    					<td><%=n.getInfo_creator() %></td>
    				</tr>
    				<%
    						}
    					}
    				 %>
    			</table>
    		</td>
    	</tr>
    </table>
  </body>
</html>
