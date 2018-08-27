<%@ page language="java" contentType="text/html; charset=gbk"%>
<%@ page import="com.news.model.*" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>       
    <title>新闻人物详细信息</title>
  </head>  
  <script type="text/javascript">
  	function goBack(){
  		window.location.href="view/IndexTemp.jsp";
  	}
  	</script>
  <body>
  	<%
  		Person person = (Person)session.getAttribute("person");
  		if(person != null){  		
  	 %>
    <table border="1" width="690" height="500" cellpadding="0" cellspacing="0" align="right">
    	<tr>
    		<td>
    			<table border="0" width="640" heignt="500" cellpadding="0" cellspacing="0">
    				<tr><td height="20"></td></tr>
    				<tr align="center">
    					<td>
    						<font style="font-size: 22px;font-family: 黑体;"><%=person.getPerson_name() %>的详细信息</font>
    					</td>
    				</tr>
    				<tr><td height="20"></td></tr>
    				<tr align="center">
    					<td>姓名：</td>
    					<td><%=person.getPerson_name() %></td>
    				</tr>
    				<tr><td height="20"></td></tr>
    				<tr align="center">
    					<td>年龄：</td>
    					<td><%=person.getPerson_age() %>岁</td>
    				</tr>
    				<tr><td height="20"></td></tr>
    				<tr align="center">
    					<td>职业：</td>
    					<td><%=person.getPerson_job() %></td>
    				</tr>
    				<tr><td height="20"></td></tr>
    				<tr align="center">
    					<td>住址：</td>
    					<td><%=person.getPerson_address() %></td>
    				</tr>
    				<tr><td height="20"></td></tr>
    				<tr align="center">
    					<td>得票数：</td>
    					<td><%=person.getPerson_number() %>票</td>
    				</tr>
    				<tr><td height="20"></td></tr>
    				<tr>
    					<td align="center">简介：</td>
    					<td>&nbsp;</td>
    				</tr>
    				<tr><td height="20"></td></tr>
    				<tr align="center">
    					<td colspan="2">
    						<textarea rows="10" cols="60"><%=person.getPerson_remark() %></textarea>
    					</td>
    				</tr>
    				<tr><td height="20"></td></tr>
    				<tr align="center">
    					<td colspan="2">
    						<input type="button" value="返回" onclick="goBack();">
    					</td>
    				</tr>
    				<tr><td height="20"></td></tr>
    			</table>
    		</td>
    	</tr>
    </table>
    <%
    	}
     %>
  </body>
</html>
