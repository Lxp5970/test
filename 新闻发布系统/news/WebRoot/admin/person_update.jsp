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
    <title>新闻人物修改页面</title>
    <link rel="stylesheet" type="text/css" href="CSS/style.css">
  </head>
  <script type="text/javascript">
  	function goBack(){
  		window.location.href="admin/AdminTemp.jsp?mainPage=person_select";
  	}
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
    				Person p = opdb.OpGetPerson(id);
    				if(p != null){
    					
    			 %>
    			 <tr align="center">
    			 	<td>人物姓名：</td>
    			 	<td><input type="text" name="person_name" value="<%=p.getPerson_name()%>" disabled="disabled"></td>
    			 </tr>
    			 <tr align="center">
    			 	<td>人物住址：</td>
    			 	<td><input type="text" name="person_address" value="<%=p.getPerson_address()%>"></td>
    			 </tr>
    			 <tr align="center">
    			 	<td>人物年龄：</td>
    			 	<td><input type="text" name="person_age" value="<%=p.getPerson_age()%>"></td>
    			 </tr>
    			 <tr align="center">
    			 	<td>人物职业：</td>
    			 	<td><input type="text" name="person_job" value="<%=p.getPerson_job()%>"></td>
    			 </tr>
    			 <tr align="center">
    			 	<td>得票数：</td>
    			 	<td><input type="text" name="person_number" value="<%=p.getPerson_number()%>" disabled="disabled"></td>
    			 </tr>
    			 <tr align="center">
    			 	<td>人物简介：</td>
    			 	<td>&nbsp;</td>
    			 </tr>
    		<tr align="center">
    			<td colspan="2">
    				<textarea name="person_remark" rows="5" cols="60"><%=p.getPerson_remark() %></textarea>
    			</td>
    		</tr>
    			 <tr>
    			 	<td colspan="2">
    			 		<input type="hidden" name="id" value="<%=p.getId() %>">
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