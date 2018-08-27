<%@ page language="java" contentType="text/html; charset=gbk"%>
<%@ page import="com.news.dao.*"%>
<%@ page import="com.news.model.*"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>内容显示区文件</title>
  </head> 
  <body>
    <table border="1" width="700" height="500" cellpadding="0" cellspacing="0" align="right">
    	<tr>
    		<td align="center">
    			<table border="0" width="690"  height="480" cellpadding="0" cellspacing="0">
    				<tr bgcolor="#E2F1EE">
    					<td colspan="5">
    						<font style="font-size: 20px;font-family: 黑体">★旅游攻略</font>
    						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    						<a href="admin/news_info_link.jsp?infoType=2">更多&gt;&gt;</a>
    					</td>
    				</tr>
    				<% 
    					OpDB opdb = new OpDB();
    					ArrayList<News> junshi = opdb.OpGetNewsInfo(2);
    					if(junshi != null && junshi.size() > 0){
    						for(News n : junshi){
    				%>
    				<tr>
    					<td><a href="admin/news_info.jsp?strid=<%=n.getId()%>"><%=n.getInfo_title() %></a></td>
    					<td><%=n.getInfo_creator() %></td>
    					<td><%=n.getInfo_date() %></td>    					
    					<td><a href="admin/news_update.jsp?strid=<%=n.getId()%>">修改</a></td>
    					<td><a href="adminServlet?method=news_delete&strid=<%=n.getId()%>">删除</a></td>
    				</tr>
    				<% 
    						}
    					}
    				%>
    				<tr bgcolor="#E2F1EE">
    					<td colspan="5">
    						<font style="font-size: 20px;font-family: 黑体">★军事要闻</font>
    						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    						<a href="admin/news_info_link.jsp?infoType=3">更多&gt;&gt;</a>
    					</td>
    				</tr>
    				<% 
    					ArrayList<News> tiyu = opdb.OpGetNewsInfo(3);
    					if(tiyu != null && tiyu.size() > 0){
    						for(News n : tiyu){
    				%>
    				<tr>
    					<td><a href="admin/news_info.jsp?strid=<%=n.getId()%>"><%=n.getInfo_title() %></a></td>
    					<td><%=n.getInfo_creator() %></td>
    					<td><%=n.getInfo_date() %></td>    					
    					<td><a href="admin/news_update.jsp?strid=<%=n.getId()%>">修改</a></td>
    					<td><a href="adminServlet?method=news_delete&strid=<%=n.getId()%>">删除</a></td>
    				</tr>
    				<% 
    						}
    					}
    				%>
    				<tr bgcolor="#E2F1EE">
    					<td colspan="5">
    						<font style="font-size: 20px;font-family: 黑体">★美文赏析</font>
    						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    						<a href="admin/news_info_link.jsp?infoType=4">更多&gt;&gt;</a>
    					</td>
    				</tr>
    				<% 
    					ArrayList<News> lvyou = opdb.OpGetNewsInfo(4);
    					if(lvyou != null && lvyou.size() > 0){
    						for(News n : lvyou){
    				%>
    				<tr>
    					<td><a href="admin/news_info.jsp?strid=<%=n.getId()%>"><%=n.getInfo_title() %></a></td>
    					<td><%=n.getInfo_creator() %></td>
    					<td><%=n.getInfo_date() %></td>    					
    					<td><a href="admin/news_update.jsp?strid=<%=n.getId()%>">修改</a></td>
    					<td><a href="adminServlet?method=news_delete&strid=<%=n.getId()%>">删除</a></td>
    				</tr>
    				<% 
    						}
    					}
    				%>
    				<tr bgcolor="#E2F1EE">
    					<td colspan="5">
    						<font style="font-size: 20px;font-family: 黑体">★生活百科</font>
    						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    						<a href="admin/news_info_link.jsp?infoType=5">更多&gt;&gt;</a>
    					</td>
    				</tr>
    				<% 
    					ArrayList<News> jiaoyu = opdb.OpGetNewsInfo(5);
    					if(jiaoyu != null && jiaoyu.size() > 0){
    						for(News n : jiaoyu){
    				%>
    				<tr>
    					<td><a href="admin/news_info.jsp?strid=<%=n.getId()%>"><%=n.getInfo_title() %></a></td>
    					<td><%=n.getInfo_creator() %></td>
    					<td><%=n.getInfo_date() %></td>    					
    					<td><a href="admin/news_update.jsp?strid=<%=n.getId()%>">修改</a></td>
    					<td><a href="adminServlet?method=news_delete&strid=<%=n.getId()%>">删除</a></td>
    				</tr>
    				<% 
    						}
    					}
    				%>
    				<tr bgcolor="#E2F1EE">
    					<td colspan="5">
    						<font style="font-size: 20px;font-family: 黑体">★财经解码</font>
    						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    						<a href="admin/news_info_link.jsp?infoType=6">更多&gt;&gt;</a>
    					</td>
    				</tr>
    				<% 
    					ArrayList<News> zhufang = opdb.OpGetNewsInfo(6);
    					if(zhufang != null && zhufang.size() > 0){
    						for(News n : zhufang){
    				%>
    				<tr>
    					<td><a href="admin/news_info.jsp?strid=<%=n.getId()%>"><%=n.getInfo_title() %></a></td>
    					<td><%=n.getInfo_creator() %></td>
    					<td><%=n.getInfo_date() %></td>    					
    					<td><a href="admin/news_update.jsp?strid=<%=n.getId()%>">修改</a></td>
    					<td><a href="adminServlet?method=news_delete&strid=<%=n.getId()%>">删除</a></td>
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
