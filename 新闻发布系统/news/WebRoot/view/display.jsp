<%@ page language="java" contentType="text/html; charset=gbk"%>
<%@ page import="com.news.model.*" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>       
    <title>����������ϸ��Ϣ</title>
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
    						<font style="font-size: 22px;font-family: ����;"><%=person.getPerson_name() %>����ϸ��Ϣ</font>
    					</td>
    				</tr>
    				<tr><td height="20"></td></tr>
    				<tr align="center">
    					<td>������</td>
    					<td><%=person.getPerson_name() %></td>
    				</tr>
    				<tr><td height="20"></td></tr>
    				<tr align="center">
    					<td>���䣺</td>
    					<td><%=person.getPerson_age() %>��</td>
    				</tr>
    				<tr><td height="20"></td></tr>
    				<tr align="center">
    					<td>ְҵ��</td>
    					<td><%=person.getPerson_job() %></td>
    				</tr>
    				<tr><td height="20"></td></tr>
    				<tr align="center">
    					<td>סַ��</td>
    					<td><%=person.getPerson_address() %></td>
    				</tr>
    				<tr><td height="20"></td></tr>
    				<tr align="center">
    					<td>��Ʊ����</td>
    					<td><%=person.getPerson_number() %>Ʊ</td>
    				</tr>
    				<tr><td height="20"></td></tr>
    				<tr>
    					<td align="center">��飺</td>
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
    						<input type="button" value="����" onclick="goBack();">
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
