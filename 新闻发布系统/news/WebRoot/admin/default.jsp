<%@ page language="java" contentType="text/html; charset=gbk"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>��¼�����ļ�</title>
  </head>
  <script type="text/javascript">
  	function loadimage(){
  		document.getElementById("randImage").src="admin/image.jsp?"+Math.random();
  	}
  </script>
  <body>
    <form action="adminServlet?method=login" method="post">
    			<table border="0" width="900" height="250" cellpadding="0" cellspacing="0" >
    				<tr align="center">
    					<td>
    						<table border="0"  cellpadding="0" cellspacing="0">
    							<tr height="40">
    								<td>�˺ţ�</td>
    								<td colspan="2"><input type="text" name="username" size="20"></td>
    							</tr>
    							<tr height="40">
    								<td>���룺</td>
    								<td><input type="password" name="password" size="21"></td>
    								<td><a href="adminServlet?method=updatePwd">&nbsp;&nbsp;��������</a></td>
    							</tr>
    							<tr height="40">
    								<td>��֤�룺</td>
    								<td colspan="2">
    									<input type="text" name="yan" size="20">
    								</td>
    							</tr>
    							<tr height="40">
    								<td>
  										<img alt="code..." src="admin/image.jsp" name="zheng" width="60" height="20" border="1" align="middle" id="randImage">
  									</td>
  									<td align="center" valign="middle">
  										<a href="javascript:loadimage();">���������</a>
  									</td>
    							</tr>
    							<tr height="40">
    								<td colspan="3" align="center">
    									<input type="submit" value="��½">&nbsp;&nbsp;&nbsp;&nbsp;
    									<input type="reset" value="ȡ��">    	
    									<a href="adminServlet?method=AddUser">ע�����û�</a>						
    								</td>
    							</tr>
    						</table>
    					</td>
    				</tr>
    			</table>
    		</form>
  </body>
</html>
