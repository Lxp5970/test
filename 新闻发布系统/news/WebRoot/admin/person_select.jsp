<%@ page language="java" contentType="text/html; charset=gbk"%>
<%@ page import="com.news.dao.*" %>
<%@ page import="com.news.model.*"%>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>内容显示区</title>
  </head> 
  <script type="text/javascript">
  	function goBack(){
  		window.location.href="AdminTemp.jsp";
  	}
  	</script>
  <body>
    <table border="1" width="700" height="500" cellpadding="0" cellspacing="0" align="right">
    	<tr>
    		<td>
    			<form action="adminServlet?method=person_select" method="post">
    			<table border="0" width="690" height="480" cellpadding="0" cellspacing="0">
    				<%
    					OpDB opdb = new OpDB();
    					ArrayList<Person> list = opdb.OpGetAllPerson();
    					if(list != null && list.size()>0){
    						for(Person per : list){
    				 %>
    				 <tr>
    				 	<td align="center"><a href="adminServlet?strid=<%=per.getId()%>&method=person_info"><%=per.getPerson_name() %></a></td>
    				 	<td><%=per.getPerson_job() %></td>
    				 	<td align="center"><a href="admin/person_update.jsp?strid=<%=per.getId()%>">修改</a></td>
    				 	<td align="center"><a href="adminServlet?method=person_delete&strid=<%=per.getId()%>">删除</a></td>
    				 </tr>
    				 <%
    				 		}
    				 	}
    				  %>
    				  <tr align="center">
    				  	<td colspan="4">
    				  		<input type="button" value="返回后台首页" onclick="goBack();">
    				  	</td>
    				  </tr>
    			</table>
    			</form>
    		</td>
    	</tr>
    </table>
  </body>
</html>