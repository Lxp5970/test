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
  		window.location.href="IndexTemp.jsp";
  	}
  	</script>
  
  <body>	
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
    				String showpage = request.getParameter("showpage");
    				if(showpage == null || showpage.equals("")){showpage = "1";}
    				String sqlALL = "select * from tb_news where info_type=?";
    				OpDB opdb = new OpDB();
    				Object [] params = {info_type};
    				CreatePage cp = opdb.OpCreatePage(sqlALL, params, 3, showpage, "view/IndexTemp.jsp?mainPage=news_type"+infoType);
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
    				<td style="text-indent: 20px;"><a href="view/news_info.jsp?strid=<%=n.getId()%>"><%=n.getInfo_title() %></a></td>
    				<td><%=n.getInfo_date() %></td>
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
  </body>
</html>
