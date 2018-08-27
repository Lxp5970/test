<%@ page language="java" contentType="text/html; charset=gbk"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>新闻人物添加</title>
  </head>
  <script type="text/javascript">
  	function goBack(){
  		window.location.href="AdminTemp.jsp";
  	}
  	</script>
  <body>
  <form action="adminServlet?method=person_add" method="post">
    	<table border="1" width="700" height="500" cellpadding="0" cellspacing="0" rules="none">    	
    		<tr align="center">
    			<td colspan="2">
    				<font style="font-size: 18px; color: red;">注意：发布前请仔细检查发布内容是否正确</font>
    			</td>
    		</tr>
    		<tr>
    			<td align="center">人物姓名：</td>
    			<td>
    				<input type="text" name="person_name" size="30">
    			</td>
    		</tr>
    		<tr>
    			<td align="center">居住地址：</td>
    			<td>
    				<input type="text" name="person_address" size="30">
    			</td>
    		</tr>
    		<tr>
    			<td align="center">人物年龄：</td>
    			<td>
    				<input type="text" name="person_age" size="30">
    			</td>
    		</tr>
    		<tr>
    			<td align="center">人物职业：</td>
    			<td>
    				<input type="text" name="person_job" size="30">
    			</td>
    		</tr>
    		<tr>
    			<td align="center">得票数：</td>
    			<td>
    				<input type="text" name="person_number" size="30">
    			</td>
    		</tr>
    		<tr>
    			<td align="center">人物简介：</td>
    			<td><font style="font-size: 15px;color: gray;">简介内容不能超过250字</font></td>
    		</tr>
    		<tr align="center">
    			<td colspan="2">
    				<textarea name="person_remark" rows="5" cols="60"></textarea>
    			</td>
    		</tr>
    		<tr align="center">
    			<td colspan="2">
    				<input type="submit" value="提交">&nbsp;&nbsp;&nbsp;&nbsp;
    				<input type="reset" value="重置">&nbsp;&nbsp;&nbsp;&nbsp;
    				<input type="button" value="返回" onclick="goBack();">
    			</td>
    		</tr>
    	</table>
    </form>
  </body>
</html>

