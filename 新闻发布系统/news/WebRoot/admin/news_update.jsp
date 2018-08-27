<%@ page language="java" contentType="text/html; charset=gbk"%>
<%@ page import="com.news.dao.*"  %>
<%@ page import="com.news.model.*"  %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  	<base href="<%=basePath%>">  
    <title>新闻修改页面</title>
    <link rel="stylesheet" type="text/css" href="CSS/style.css">
  </head>  
  <script type="text/javascript">
  	function goBack(){
  		window.location.href="AdminTemp.jsp";
  	}
  </script>
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
    <center>
    <form action="adminServlet?method=news_update" method="post">
    	<div id="top"><jsp:include page="top.jsp"/></div>
    	<div id="newsInfo">
    		<table border="0" width="900" height="500" cellpadding="0" cellspacing="0" >
    			<%
    				String strid = request.getParameter("strid");
    				int id = Integer.parseInt(strid);
    				OpDB opdb = new OpDB();
    				News n = opdb.OpGetNewsInfo(strid);
    				if(n != null){
    					String typeName = opdb.OpGetTypeName(opdb.OpGetType(id));
    			 %>
    			 <tr align="center">
    			 	<td>新闻类别：</td>
    			 	<td><input type="text" name="typeName" value="<%=typeName%>" disabled="disabled"></td>
    			 </tr>
    			 <tr align="center">
    			 	<td>新闻标题：</td>
    			 	<td><input type="text" name="info_title" value="<%=n.getInfo_title()%>"></td>
    			 </tr>
    			 <tr align="center">
    			 	<td colspan="2">新闻内容：</td>
    			 </tr>
    			 <tr align="center">
    			 	<td colspan="2">
    			 		<textarea id="editor_id" name="info_content" style="width:100px;height:150px;"><%=n.getInfo_content() %></textarea>
    			 	</td>
    			 </tr>
    			 <tr align="center">
    			 	<td>新闻作者：</td>
    			 	<td><input type="text" name="info_creator" value="<%=n.getInfo_creator()%>"></td>
    			 </tr>
    			 <tr>
    			 	<td colspan="2">
    			 		<input type="hidden" name="info_type" value="<%=n.getInfo_type() %>">
    			 		<input type="hidden" name="id" value="<%=n.getId() %>">
    			 	</td>
    			 </tr>
    			 <tr align="center">
    			 	<td><input type="submit" value="修改"></td>
    			 	<td><input type="button" value="返回" onclick="goBack();"></td>
    			 </tr>
    			 <%
    			 	}
    			  %>
    		</table>
    	</div>
    	<div id="end"><jsp:include page="end.jsp"/></div>
    </form>	
    </center>
  </body>
</html>
