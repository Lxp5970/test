<%@ page language="java" contentType="text/html; charset=gbk"%>
<%@ page import="com.news.dao.*" %>
<%@ page import="com.news.model.*" %>
<%@ page import="java.util.ArrayList"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>�������ҳ��</title>
  </head>
  <script charset="gbk" src="editor/kindeditor.js"></script>
    <script charset="gbk" src="editor/lang/zh_CN.js"></script>
    <script>
  	var editor;
  	KindEditor.ready(function(K) {
     	editor = K.create('#editor_id');
  	});
  	var options = {
    	cssPath : '/css/index.css',
  	filterMode : true
  	};
  	var editor = K.create('textarea[name="content"]', options);
  </script>
  <body>
    <form action="adminServlet?method=news_add" method="post">
    	<table border="1" width="700" height="500" cellpadding="0" cellspacing="0" rules="none">
    	
    		<tr align="center">
    			<td colspan="2">
    				<font style="font-size: 18px; color: red;">ע�⣺����ǰ����ϸ��鷢�������Ƿ���ȷ</font>
    			</td>
    		</tr>
    		<tr>
    			<td style="text-indent: 20px;">�������</td>
    			<td>
    				<select name="info_type">
    					<option value="-1">--��ѡ��--</option>
    					<%
    						OpDB opdb = new OpDB();
    						ArrayList<Type> list = opdb.OpGetType();
    						if(list != null && list.size() > 0){
    							for(Type t : list){
    					 %>
    					 <option value="<%=t.getId() %>"><%=t.getType_name() %></option>
    					 <%
    					 		}
    					 	}	
    					  %>
    				</select>
    			</td>
    		</tr>
    		<tr>
    			<td style="text-indent: 20px;">���ű��⣺</td>
    			<td>
    				<input type="text" name="info_title" size="60">
    			</td>
    		</tr>
    		<tr>
    			<td style="text-indent: 20px;">�������ݣ�</td>
    			<td><font style="font-size: 15px;color: gray;">�������ݲ��ܳ���1500��</font></td>
    		</tr>
    		<tr align="center">
    			<td colspan="2">
    				<textarea id="editor_id" name="info_content" style="width:100px;height:150px;"></textarea>
    			</td>
    		</tr>
    		<tr>
    			<td style="text-indent: 20px;">�����ߣ�</td>
    			<td>
    				<input type="text" name="info_creator">
    			</td>
    		</tr>
    		<tr align="center">
    			<td colspan="2">
    				<input type="submit" value="�ύ">&nbsp;&nbsp;&nbsp;&nbsp;
    				<input type="reset" value="����">&nbsp;&nbsp;&nbsp;&nbsp;
    				<input type="button" value="����" onclick="history.go(-1);">
    			</td>
    		</tr>
    	</table>
    </form>
  </body>
</html>
