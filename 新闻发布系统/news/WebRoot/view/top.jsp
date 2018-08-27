<%@ page language="java" contentType="text/html; charset=gbk"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.news.dao.*" %>
<%@ page import="com.news.model.*" %>
<%@ page import="com.news.tools.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>      
    <title>头部文件</title>
  </head>
  
  <body>
    <form action="indexServlet?method=showSearch" method="post">
    	<table border="1" cellpadding="0" cellspacing="0">
    		<tr><td><img width="900" height="92" src="images/head.jpg"></td></tr>
    	</table>
    	<table border="1" width="901" height="30" cellpadding="0" cellspacing="0">
    	<tr>
    		<%
    			OpDB opdb = new OpDB();
    			ArrayList<Type> list = opdb.OpGetType();
    			if(list != null && list.size()>0){
    				for(int i=0;i<list.size();i++){
    					Type t = list.get(i);
    		%>
    			<td style="text-indent: 10px;"><a href="view/IndexTemp.jsp?mainPage=news_type&info_type=<%=t.getId()%>"><%=t.getType_name() %></a></td>	
    		<%
    				}
    			}	
    		 %>
    		 <td align="center">
    		 	<%=DoString.toStrTime() %>
    		 </td>
    		 <td align="right">
    		 	<input name="condition" type="text" value="请输入新闻标题" onfocus="if (value =='请输入新闻标题'){value =''}" onblur="if (value ==''){value='请输入新闻标题'}" />
    		 	<input type="submit" value="搜索">&nbsp;&nbsp;
    		 </td>
    		 <tr>	 
    	</table>
    </form>
  </body>
</html>
