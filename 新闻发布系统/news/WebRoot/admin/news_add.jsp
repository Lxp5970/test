<%@ page language="java" contentType="text/html; charset=gbk"%>
<%@ page import="com.news.dao.*" %>
<%@ page import="com.news.model.*" %>
<%@ page import="java.util.ArrayList"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>新闻添加页面</title>
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
    				<font style="font-size: 18px; color: red;">注意：发布前请仔细检查发布内容是否正确</font>
    			</td>
    		</tr>
    		<tr>
    			<td style="text-indent: 20px;">新闻类别：</td>
    			<td>
    				<select name="info_type">
    					<option value="-1">--请选择--</option>
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
    			<td style="text-indent: 20px;">新闻标题：</td>
    			<td>
    				<input type="text" name="info_title" size="60">
    			</td>
    		</tr>
    		<tr>
    			<td style="text-indent: 20px;">新闻内容：</td>
    			<td><font style="font-size: 15px;color: gray;">新闻内容不能超过1500字</font></td>
    		</tr>
    		<tr align="center">
    			<td colspan="2">
    				<textarea id="editor_id" name="info_content" style="width:100px;height:150px;"></textarea>
    			</td>
    		</tr>
    		<tr>
    			<td style="text-indent: 20px;">创建者：</td>
    			<td>
    				<input type="text" name="info_creator">
    			</td>
    		</tr>
    		<tr align="center">
    			<td colspan="2">
    				<input type="submit" value="提交">&nbsp;&nbsp;&nbsp;&nbsp;
    				<input type="reset" value="重置">&nbsp;&nbsp;&nbsp;&nbsp;
    				<input type="button" value="返回" onclick="history.go(-1);">
    			</td>
    		</tr>
    	</table>
    </form>
  </body>
</html>
