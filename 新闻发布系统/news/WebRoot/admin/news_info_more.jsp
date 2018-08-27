<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=gbk"%>
<%@ page import="com.news.dao.*"  %>
<%@ page import="com.news.model.*"  %>
<%@ page import="com.news.tools.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.ArrayList" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  	<base href="<%=basePath%>">  
    <title>查询更多新闻页面</title>
    <link rel="stylesheet" type="text/css" href="CSS/style.css">
  </head> 
  <script type="text/javascript">
  	function goBack(){
  		window.location.href="AdminTemp.jsp";
  	}
  </script> 
  <body>
    <center>
    	<div id="top"><jsp:include page="top.jsp"/></div>
    	<div id="newsInfo">   	
    		<table border="0" width="900" height="500" cellpadding="0" cellspacing="0" >
    		<%
    			String condition = DoString.toGBK(request.getParameter("condition"));
    			String showpage = request.getParameter("showpage");
    			if(showpage == null || showpage.equals("")){
    				showpage = "1";
    			}
    			String sqlAll = "select * from tb_news where info_title like '%"+condition+"%'";
    			OpDB opdb = new OpDB();
    			CreatePage cp = opdb.OpCreatePage(sqlAll, null, 2, showpage, "admin/news_info_more.jsp?condition="+condition);
    			ArrayList<News> list = null;
    			String sqlSub = "";
    			int top = (cp.getCurrentP() - 1) * 2;
    			if(cp.getCurrentP() == 1){
    				sqlSub = "select TOP 2 * from tb_news where info_title like '%"+condition+"%'";
    			}else{
    				sqlSub = "select TOP 2 * from tb_news where info_title like '%"+condition+"%' and info_date < (select MIN(info_date) from (select TOP "+top+" (info_date) from tb_news where (info_title like '%"+condition+"%') order by info_date desc)as mindate) order by info_date desc";
    			}
    			DB db = new DB();
    			db.doPstm(sqlSub, null);
    			ResultSet res = db.getRs();
    			if(res != null){
    				list = new ArrayList<News>();
    				try{
    					while(res.next()){
    						News n = new News();
    						n.setId(res.getInt("id"));
    						n.setInfo_type(res.getInt("info_type"));
    						n.setInfo_title(res.getString("info_title"));
    						n.setInfo_content(res.getString("info_content"));
    						n.setInfo_creator(res.getString("info_creator"));
    						n.setInfo_date(res.getTimestamp("info_date"));
    						list.add(n);
    					}
    				}catch(Exception e){
    					e.printStackTrace();
    					list = null;
    				}
    			}
    			if(list != null && list.size()>0){
    				for(News n: list){
    	    %>
    			 <tr>
    			 	<td><a href="admin/news_info.jsp?strid=<%=n.getId()%>"><%=n.getInfo_title() %></a></td>
    			 	<td><%=n.getInfo_date() %></td>
    			 	<td><a href="admin/news_update.jsp?strid=<%=n.getId()%>">修改</a></td>
    			 	<td><a href="adminServlet?method=news_delete&strid=<%=n.getId()%>">删除</a></td>
    			 </tr>
    		<%
    				}
    		 %>
    		 <tr>
    		 	<td colspan="4" align="center"><%=cp.getPageInfo() %>&nbsp;&nbsp;<%=cp.getPageLink() %></td>
    		 </tr>
    		 <tr>
    		 	<td colspan="4" align="center"><input type="button" value="返回" onclick="goBack();"></td>
    		 </tr>
    		 <%
    		 	}
    		  %>
    		</table>
    	</div>
    	<div id="end"><jsp:include page="end.jsp"/></div>
    </center>
  </body>
</html>
