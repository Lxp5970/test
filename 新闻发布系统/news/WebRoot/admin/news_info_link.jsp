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
    <title>分页显示某类别下的所有新闻</title>
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
    		String infoType = request.getParameter("infoType");
    		if(infoType == null || infoType.equals("")){infoType = "0";}
    		int info_type = 0;
    		try{
    		   info_type = Integer.parseInt(infoType);
    		}catch(Exception e){
    		info_type = 0;
    		}
    		String typeName = "";
    		switch(info_type){
    			case 2 : typeName="旅游攻略";break;
    			case 3 : typeName="军事要闻";break;
    			case 4 : typeName="美文赏析";break;
    			case 5 : typeName="生活百科";break;
    			case 6 : typeName="财经解码";break;
    		}
    		%>
    		 <tr bgcolor="#E2F1EE" height="40">
    				<td colspan="4" style="text-indent: 20px;">
    					<font style="font-size: 20px;font-family: 黑体">★<%=typeName %></font>
    				</td> 
    			</tr>
    			<% 
    				String showpage = request.getParameter("showpage");
    				if(showpage == null || showpage.equals("")){showpage = "1";}
    				String sqlALL = "select * from tb_news where info_type=?";
    				OpDB opdb = new OpDB();
    				Object [] params = {info_type};
    				CreatePage cp = opdb.OpCreatePage(sqlALL, params, 2, showpage, "admin/news_info_link.jsp?infoType="+infoType);
    				String sqlSub = "";
    				ArrayList<News> list = null;
    				int top = (cp.getCurrentP() - 1)*2;
    				if(cp.getCurrentP() == 1){
    					sqlSub = "select TOP 2 * from tb_news where info_type=? order by info_date desc";
    				}else{
    					sqlSub = "select TOP 2 * from tb_news where info_type="+info_type+" and info_date < (select MIN(info_date) from (select TOP "+top+" (info_date) from tb_news where (info_type=?) order by info_date desc) as mindate) order by info_date desc";
    				}
    				DB db = new DB();
    				db.doPstm(sqlSub, params);
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
    				if(list != null && list.size() > 0){
    					for(News n : list){
    			%>
    			<tr>
    				<td style="text-indent: 20px;"><a href="admin/news_info.jsp?strid=<%=n.getId()%>"><%=n.getInfo_title() %></a></td>
    				<td><%=n.getInfo_date() %></td>
    				<td><a href="#">删除</a></td>
    				<td><a href="admin/news_update.jsp?strid=<%=n.getId()%>">修改</a></td>
    			</tr>
    			<% 
    					}
    			%>
    			<tr>
    				<td colspan="2" align="center"><%=cp.getPageInfo() %></td>
    				<td colspan="2"><%=cp.getPageLink() %></td>
    			</tr>
    			<% 
    				}
    			%>
    			<tr>
    				<td colspan="4" align="center"><input type="button" value="返回" onclick="goBack();"></td>
    			</tr>
    		</table>
    	</div>
    	<div id="end"><jsp:include page="end.jsp"/> </div>
    </center>
  </body>
</html>
