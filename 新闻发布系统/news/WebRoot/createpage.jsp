<%@ page language="java" contentType="text/html; charset=gbk"%>
<%@ page import="com.news.dao.*" %>
<%@ page import="com.news.model.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>分页显示</title>
  </head>  
  <body>
    <%
    	String showpage = request.getParameter("showpage");
    	String sqlAll = "select * from tb_news";
    	OpDB opdb = new OpDB();
    	CreatePage cp = opdb.OpCreatePage(sqlAll, null, 2, showpage, "createpage.jsp");
     %>
     <h4>
     	当前页码：<%=cp.getCurrentP() %><br>
     	总记录数：<%=cp.getAllR() %><br>
     	总页数：<%=cp.getAllP() %><br>
     	<%=cp.getPageInfo() %>
     	<%=cp.getPageLink() %>
     </h4>
  </body>
</html>
