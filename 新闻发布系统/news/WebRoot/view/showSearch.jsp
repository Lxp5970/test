<%@ page language="java" contentType="text/html; charset=gbk"%>
<%@ page import="com.news.dao.*" %>
<%@ page import="com.news.model.*"%>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>前台搜索结果显示页面</title>
  </head>  
  <script type="text/javascript">
  	function goBack(){
  		window.location.href="IndexTemp.jsp";
  	}
  	</script>
  <body>
     <table border="1" width="690" height="500" cellpadding="0" cellspacing="0" align="right">
    	<tr>
    		<td>
    			<form action="indexServlet?method=showSearch" method="post">
    				<table border="0" cellpadding="0" cellspacing="0">
    					<%
    					ArrayList<News> list = (ArrayList<News>)session.getAttribute("NewsLists");
    					String condition = (String)session.getAttribute("condition");
    					if(list != null && list.size() > 0){
    						int nums = 0;
    						if(list.size() > 4){
    							nums = 4;
    						}else{
    							nums = list.size();
    						}
    						for(int i=0;i<nums;i++){
    							News n = list.get(i);
    				 %>
    				 <tr>
    				 	<td><a href="admin/news_info.jsp?strid=<%=n.getId()%>"><%=n.getInfo_title() %></a></td>
    				 	<td><%=n.getInfo_date() %></td>
    				 	<td><a href="admin/news_update.jsp?strid=<%=n.getId()%>">修改</a></td>
    				 	<td><a href="adminServlet?method=news_delete&strid=<%=n.getId()%>">删除</a></td>
    				 </tr>
    				 <%
    				 		}
    				  %>
    				  <%
    				  		if(list.size() > 4){
    				   %>
    				   <tr><td colspan="4" align="right"><a href="admin/news_info_more.jsp?condition=<%=condition%>">更多&gt;&gt;&gt;</a></td></tr>
    				   <%
    				   		}
    				   	}
    				   %>
    				<tr align="center">
    					<td colspan="4"><input type="button" value="返回" onclick="goBack();"></td>
    				</tr>
    				</table>
    			</form>
    		</td>
    	</tr>
    </table>
  </body>
</html>
