<%@ page language="java" contentType="text/html; charset=gbk"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>�����������</title>
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
    				<font style="font-size: 18px; color: red;">ע�⣺����ǰ����ϸ��鷢�������Ƿ���ȷ</font>
    			</td>
    		</tr>
    		<tr>
    			<td align="center">����������</td>
    			<td>
    				<input type="text" name="person_name" size="30">
    			</td>
    		</tr>
    		<tr>
    			<td align="center">��ס��ַ��</td>
    			<td>
    				<input type="text" name="person_address" size="30">
    			</td>
    		</tr>
    		<tr>
    			<td align="center">�������䣺</td>
    			<td>
    				<input type="text" name="person_age" size="30">
    			</td>
    		</tr>
    		<tr>
    			<td align="center">����ְҵ��</td>
    			<td>
    				<input type="text" name="person_job" size="30">
    			</td>
    		</tr>
    		<tr>
    			<td align="center">��Ʊ����</td>
    			<td>
    				<input type="text" name="person_number" size="30">
    			</td>
    		</tr>
    		<tr>
    			<td align="center">�����飺</td>
    			<td><font style="font-size: 15px;color: gray;">������ݲ��ܳ���250��</font></td>
    		</tr>
    		<tr align="center">
    			<td colspan="2">
    				<textarea name="person_remark" rows="5" cols="60"></textarea>
    			</td>
    		</tr>
    		<tr align="center">
    			<td colspan="2">
    				<input type="submit" value="�ύ">&nbsp;&nbsp;&nbsp;&nbsp;
    				<input type="reset" value="����">&nbsp;&nbsp;&nbsp;&nbsp;
    				<input type="button" value="����" onclick="goBack();">
    			</td>
    		</tr>
    	</table>
    </form>
  </body>
</html>

