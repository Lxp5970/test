<%@ page language="java" contentType="text/html; charset=gbk"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>登录界面文件</title>
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
    								<td>账号：</td>
    								<td colspan="2"><input type="text" name="username" size="20"></td>
    							</tr>
    							<tr height="40">
    								<td>密码：</td>
    								<td><input type="password" name="password" size="21"></td>
    								<td><a href="adminServlet?method=updatePwd">&nbsp;&nbsp;忘记密码</a></td>
    							</tr>
    							<tr height="40">
    								<td>验证码：</td>
    								<td colspan="2">
    									<input type="text" name="yan" size="20">
    								</td>
    							</tr>
    							<tr height="40">
    								<td>
  										<img alt="code..." src="admin/image.jsp" name="zheng" width="60" height="20" border="1" align="middle" id="randImage">
  									</td>
  									<td align="center" valign="middle">
  										<a href="javascript:loadimage();">看不清点我</a>
  									</td>
    							</tr>
    							<tr height="40">
    								<td colspan="3" align="center">
    									<input type="submit" value="登陆">&nbsp;&nbsp;&nbsp;&nbsp;
    									<input type="reset" value="取消">    	
    									<a href="adminServlet?method=AddUser">注册新用户</a>						
    								</td>
    							</tr>
    						</table>
    					</td>
    				</tr>
    			</table>
    		</form>
  </body>
</html>
