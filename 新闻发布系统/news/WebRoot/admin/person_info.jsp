<%@ page language="java" contentType="text/html; charset=gbk"%>
<%@ page import="com.news.model.*" %>
<%@ page import="com.news.dao.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>       
    <title>����������ϸ��Ϣ</title>
  </head>  
  <script type="text/javascript">
  	function goBack(){
  		window.location.href="admin/AdminTemp.jsp?mainPage=person_select";
  	}
  	</script>
  <body>
  	<%
  		Person person = (Person)session.getAttribute("persons");
  		if(person != null){  		
  	 %>
    <table border="1" width="700" height="500" cellpadding="0" cellspacing="0" align="right">
    	<tr>
    		<td>
    			<table border="0" width="700" height="500" cellpadding="0" cellspacing="0">
    			<tr height="20"><td></td></tr>
    				<tr align="center">
    					<td colspan="2">
    						<font style="font-size: 22px;font-family: ����;"><%=person.getPerson_name() %>����ϸ��Ϣ</font>
    					</td>
    				</tr>
    				<tr height="20"><td></td></tr>
    				<tr align="center">
    					<td style="text-indent: 50px;" >������</td>
    					<td><%=person.getPerson_name() %></td>
    				</tr>
    				<tr height="20"><td></td></tr>
    				<tr align="center">
    					<td style="text-indent: 50px;">���䣺</td>
    					<td><%=person.getPerson_age() %>��</td>
    				</tr>
    				<tr height="20"><td></td></tr>
    				<tr align="center">
    					<td style="text-indent: 50px;">ְҵ��</td>
    					<td><%=person.getPerson_job() %></td>
    				</tr>
    				<tr height="20"><td></td></tr>
    				<tr align="center">
    					<td style="text-indent: 50px;">סַ��</td>
    					<td><%=person.getPerson_address() %></td>
    				</tr>
    				<tr height="20"><td></td></tr>
    				<tr align="center">
    					<td style="text-indent: 40px;">��Ʊ����</td>
    					<td><%=person.getPerson_number() %>Ʊ</td>
    				</tr>
    				<tr height="20"><td></td></tr>
    				<tr align="center">
    					<td style="text-indent: 50px;">��飺</td>
    					<td>&nbsp;</td>
    				</tr>
    				<tr height="20"><td></td></tr>
    				<tr align="center">
    					<td></td>
    					<td>
    						<textarea rows="5" cols="60"><%=person.getPerson_remark() %></textarea>
    					</td>
    				</tr>
    				<tr>
    			 		<td align="center" colspan="2">
    			 			<input type="button" value="����" onclick="goBack();">
    			 		</td>
    			 </tr>
    			 <tr height="20"><td></td></tr>
    			</table>
    		</td>
    	</tr>
    </table>
    <%
    	}
     %>
  </body>
</html>
