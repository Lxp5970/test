<%@ page language="java" contentType="text/html; charset=gbk"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>ע�����û�</title>
  </head> 
  <body>
  	<%
  		response.setCharacterEncoding("gbk");
  	 %>
    <form action="adminServlet?method=zhuce" method="post">
    	<table border="0" width="900" height="250" cellpadding="0" cellspacing="0">
    		<tr align="center">
    			<td>
    				<table border="0" cellpadding="0" cellspacing="0">
    					<tr>
    						<td>�û�����</td>
    						<td><input type="text" name="newName" size="20"></td>
    					</tr>
    					<tr height="20"><td></td></tr>
    					<tr>
    						<td>���룺</td>
    						<td><input type="password" name="newPasswd" size="21"></td>
    					</tr>
    					<tr height="20"><td></td></tr>
    					<tr>
    						<td>ȷ�����룺</td>
    						<td><input type="password" name="newPwd" size="21"></td>
    					</tr>
    					<tr height="20"><td></td></tr>
    					<tr align="center">
    						<td>
    							<input type="submit" value="�ύ">
    						</td>
    						<td><input type="reset" value="ȡ��"></td>
    					</tr>
    					<tr height="20"><td></td></tr>
    					<tr align="right"><td colspan="2"><a href="admin/login.jsp">���ص�¼����</a></td></tr>
    				</table>
    			</td>
    		</tr>
    	</table>
    </form>
  </body>
</html>
