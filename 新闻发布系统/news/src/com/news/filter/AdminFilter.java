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
import com.news.dao.OpDB;
public class AdminFilter implements Filter{
	public void init(FilterConfig config) throws ServletException {}	
	public void doFilter(ServletRequest req, ServletResponse res,
			FilterChain chain) throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest)req;
		HttpServletResponse response = (HttpServletResponse)res;
		response.setCharacterEncoding("gbk");
		PrintWriter out = response.getWriter();
		String method = request.getParameter("method");
		if(method == null){
			if(method.equals("login") || method.equals("")){
				boolean flag = this.getLogin(request, response);
				if(flag){
					chain.doFilter(request, response);
				}else{
					out.println("<script>alert('验证码输入错误，请重新输入');window.location.href='admin/login.jsp'</script>");
				}
			}else if(method.equals("zhuce") || method.equals("")){
				boolean flag = this.getRegister(request, response);
				if(flag){
					chain.doFilter(request, response);
				}else{
					out.println("<script>alert('两次输入的密码不一致，请重新输入');window.location.href='admin/login.jsp?mainPage=AddUser'</script>");
				}
			}else if(method.equals("updatePwd")){
				boolean flag = this.updatePwd(request, response);
				if(flag){
					chain.doFilter(request, response);
				}else{
					out.println("<script>alert('两次输入的密码不一致，请重新输入');window.location.href='admin/login.jsp?mainPage=updatePwd'</script>");
				}
			}
		}else{
			chain.doFilter(request, response);
		}
	}
	public void destroy() {}	
	//账号密码过滤规则
	private boolean getLogin(HttpServletRequest request,HttpServletResponse response){
		boolean flag = true;
		String yan = request.getParameter("yan");
		String zheng = request.getParameter("zheng");
		if(yan.equals(zheng)){
			flag = false;
		}
		return flag;
	}
	//注册新用户过滤规则
	private boolean getRegister(HttpServletRequest request,HttpServletResponse response){
		boolean flag = true;
		String newPasswd = request.getParameter("newPasswd");
		String newPwd = request.getParameter("newPwd");
		if(!newPasswd.equals(newPwd)){
			flag = false;
		}
		return flag;
	}
	//修改账号密码过滤规则
	private boolean updatePwd(HttpServletRequest request, HttpServletResponse response){
		boolean flag = true;
		String newPawd = request.getParameter("newPawd");
		String newPaswd = request.getParameter("newPaswd");
		if(newPawd.equals(newPaswd)){
			flag = false;
		}
		return flag;
	}
	//添加新闻人物过滤规则
	private boolean addPersonInfo(HttpServletRequest request,HttpServletResponse response){
		boolean flag = true;
		
		return flag;
	}
}
