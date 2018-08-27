package com.news.filter;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
public class IndexFilter implements Filter{
	public void init(FilterConfig config) throws ServletException {}	
	public void doFilter(ServletRequest req, ServletResponse res,
			FilterChain chain) throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest)req;
		HttpServletResponse response = (HttpServletResponse)res;
		response.setCharacterEncoding("gbk");
		PrintWriter out = response.getWriter();
		String method = request.getParameter("method");
		if(method != null && !method.equals("")){
			if(method.equals("vote")){
				boolean flag = this.voteFilter(request, response);
				if(flag){
					chain.doFilter(request, response);
				}else{
					out.println("<script>alert('请选择人物后投票!');history.go(-1)</script>");
				}
			}else if(method.equals("display")){
				boolean flag = this.displayFilter(request, response);
				if(flag){
					chain.doFilter(request, response);
				}else{
					out.println("<script>alert('请选择人物!');history.go(-1)</script>");
				}
			}else if(method.equals("showSearch")){
				boolean flag = this.searchFilter(request, response);
				if(flag){
					chain.doFilter(request, response);
				}else{
					out.println("<script>alert('请输入查询内容!');history.go(-1)</script>");
				}
			}else{
				chain.doFilter(request, response);
			}
		}		
	}
	public void destroy() {}
	//投票请求过滤条件
	private boolean voteFilter(ServletRequest request,ServletResponse response){
		boolean flag = true;
		String person_id = request.getParameter("person_id");
		if(person_id == null || person_id.equals("")){
			flag = false;
		}
		try {
			Integer.parseInt(person_id);
		} catch (Exception e) {
			flag = false;
		}
		return flag;
	}
	//显示人物详细信息过滤条件
	private boolean displayFilter(ServletRequest request,ServletResponse response){
		boolean flag = true;
		String strid = request.getParameter("strid");
		if(strid == null || strid.equals("")){
			flag = false;
		}
		try {
			Integer.parseInt(strid);
		} catch (Exception e) {
			flag = false;
		}
		return flag;
	}
	//站内搜索过滤条件
	private boolean searchFilter(ServletRequest request,ServletResponse response){
		boolean flag = true;
		String condition = request.getParameter("condition");
		if(condition == null || condition.equals("")){
			flag = false;
		}		
		return flag;
	}
}
