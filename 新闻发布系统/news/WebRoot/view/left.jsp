<%@ page language="java" contentType="text/html; charset=gbk"%>
<%@ page import="com.news.dao.*"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.news.model.*" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>      
    <title>������ļ�</title>
  </head>  
  <body>
    <form action="indexServlet?method=vote" method="post">
    	<table border="1" width="200" cellpadding="0" cellspacing="0">
    		<tr>
    			<td>
    				<table border="0" width="200" cellpadding="0" cellspacing="0">
    					<tr height="10"><td></td><tr>  					
    					<tr align="center">						
    						<td><font style="font-size: 18px;font-family: ����">��Ϊ��ϲ��������ͶƱ<hr></font></td>
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
    						<td><input type="submit" value="ͶƱ"></td>
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
    					<td><font style="font-size: 23px;font-family: ����">��������<hr></font></td>
    				</tr>
    				<tr height="30"><td></td><tr>  	
    				<tr align="center">
    					<td><a href="indexServlet?method=link&url=sina"><font style="font-size: 20px;">��������</font></a></td>
    				</tr>
    				<tr height="30"><td></td><tr>  	
    				<tr align="center">
    					<td><a href="indexServlet?method=link&url=souhu"><font style="font-size: 20px;">�Ѻ�����</font></a></td>
    				</tr>
    				<tr height="30"><td></td><tr>  	
    				<tr align="center">
    					<td><a href="indexServlet?method=link&url=qq"><font style="font-size: 20px;">��Ѷ����</font></a></td>
    				</tr>
    				<tr height="30"><td></td><tr>  	
    				<tr align="center">
    					<td><a href="indexServlet?method=link&url=baidu"><font style="font-size: 20px;">�ٶ�����</font></a></td>
    				</tr>
    				<tr height="40"><td></td><tr>  	
    			</table>
    		</td>
    	</tr>
    </table>
  </body>
</html>
