<%@ page language="java" contentType="text/html; charset=gbk"%>
<%@ page import="com.news.dao.*" %>
<%@ page import="com.news.model.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>��ҳ��ʾ</title>
  </head>  
  <body>
    <%
    	String showpage = request.getParameter("showpage");
    	String sqlAll = "select * from tb_news";
    	OpDB opdb = new OpDB();
    	CreatePage cp = opdb.OpCreatePage(sqlAll, null, 2, showpage, "createpage.jsp");
     %>
     <h4>
     	��ǰҳ�룺<%=cp.getCurrentP() %><br>
     	�ܼ�¼����<%=cp.getAllR() %><br>
     	��ҳ����<%=cp.getAllP() %><br>
     	<%=cp.getPageInfo() %>
     	<%=cp.getPageLink() %>
     </h4>
  </body>
</html>
