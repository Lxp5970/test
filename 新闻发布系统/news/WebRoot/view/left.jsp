<%@ page language="java" contentType="text/html; charset=gbk"%>
<%@ page import="com.news.dao.*"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.news.model.*" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>      
    <title>左侧栏文件</title>
  </head>  
  <body>
    <form action="indexServlet?method=vote" method="post">
    	<table border="1" width="200" cellpadding="0" cellspacing="0">
    		<tr>
    			<td>
    				<table border="0" width="200" cellpadding="0" cellspacing="0">
    					<tr height="10"><td></td><tr>  					
    					<tr align="center">						
    						<td><font style="font-size: 18px;font-family: 黑体">请为您喜欢的人物投票<hr></font></td>
    					</tr>
    					<tr height="10"><td></td><tr>  	
    					<tr align="left">
    						<td>
    							<%
    								OpDB opdb = new OpDB();
    								ArrayList<Person> list = opdb.OpGetPerson();
    								if(list != null && list.size()>0){
    									for(Person p:list){    										    									
    							 %>
    							 &nbsp;&nbsp;&nbsp;<input type="radio" name="person_id" value="<%=p.getId()%>"><a href="indexServlet?strid=<%=p.getId()%>&method=display"><%=p.getPerson_name() %><br></a>
    							 <%
    							 		}
    							 	}						
    							  %>
    						</td>
    					</tr>
    					<tr height="10"><td></td><tr>  	
    					<tr align="center">    					 
    						<td><input type="submit" value="投票"></td>
    						<td height="10"></td>
    					</tr>
    					<tr height="10"><td></td><tr>  	
    				</table>
    			</td>    		
    		</tr>
    	</table>
    </form>
    <table border="1" width="200" cellpadding="0" cellspacing="0">
    	<tr>
    		<td>
    			<table border="0" width="200" cellpadding="0" cellspacing="0">
    				<tr height="10"><td></td><tr>  	
    				<tr align="center">
    					<td><font style="font-size: 23px;font-family: 黑体">友情链接<hr></font></td>
    				</tr>
    				<tr height="30"><td></td><tr>  	
    				<tr align="center">
    					<td><a href="indexServlet?method=link&url=sina"><font style="font-size: 20px;">新浪新闻</font></a></td>
    				</tr>
    				<tr height="30"><td></td><tr>  	
    				<tr align="center">
    					<td><a href="indexServlet?method=link&url=souhu"><font style="font-size: 20px;">搜狐新闻</font></a></td>
    				</tr>
    				<tr height="30"><td></td><tr>  	
    				<tr align="center">
    					<td><a href="indexServlet?method=link&url=qq"><font style="font-size: 20px;">腾讯新闻</font></a></td>
    				</tr>
    				<tr height="30"><td></td><tr>  	
    				<tr align="center">
    					<td><a href="indexServlet?method=link&url=baidu"><font style="font-size: 20px;">百度新闻</font></a></td>
    				</tr>
    				<tr height="40"><td></td><tr>  	
    			</table>
    		</td>
    	</tr>
    </table>
  </body>
</html>
