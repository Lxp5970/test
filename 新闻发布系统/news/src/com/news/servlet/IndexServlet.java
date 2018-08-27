package com.news.servlet;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import com.news.dao.*;
import com.news.model.*;
import com.news.tools.DoString;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
public class IndexServlet extends HttpServlet{
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=gbk");
		request.setCharacterEncoding("gbk");
		PrintWriter out = response.getWriter();
		String method = request.getParameter("method");
		if(method != null && !method.equals("")){
			if(method.equals("vote")){
				boolean flag = this.getVote(request, response);
				if(flag){
					out.println("<script>alert('ͶƱ�ɹ�!');history.go(-1)</script>");
				}else{
					out.println("<script>alert('ͶƱʧ��!');history.go(-1)</script>");
				}
			}else if(method.equals("display")){
				Person person = this.getPersonInfo(request, response);
				if(person != null){
					request.getSession().setAttribute("person", person);
					request.getRequestDispatcher("view/IndexTemp.jsp?mainPage=display").forward(request, response);
				}else{
					out.println("<script>alert('ҳ����ת����!');history.go(-1)</script>");
				}				
			}else if(method.equals("link")){
				String url = this.getLink(request, response);
				if(url != null){
					response.sendRedirect(url);
				}else{
					out.println("<script>alert('�������ӳ���!');history.go(-1)</script>");
				}
			}else if(method.equals("showSearch")){
				ArrayList<News> list = this.GetNewsInfo(request, response);
				if(list != null && list.size() > 0){
					request.getSession().setAttribute("NewsLists", list);
					response.sendRedirect("view/IndexTemp.jsp?mainPage=showSearch");
				}else{
					out.println("<script>alert('��ѯ���ݲ����ڣ�');history.go(-1);</script>");
				}
			}
		}else{
			out.println("<script>alert('����δ֪����!');history.go(-1)</script>");
		}
		//request.getRequestDispatcher("view/IndexTemp.jsp?mainPage=display").forward(request, response);
	}
	//ʵ��ͶƱ���ܵķ���
	private boolean getVote(HttpServletRequest request,HttpServletResponse response){
		String person_id = request.getParameter("person_id");
		int id = Integer.parseInt(person_id);
		OpDB opdb = new OpDB();
		boolean flag = opdb.OpReplacePerson(id);
		return flag;
	}
	//ʵ����ʾ�����������ϸ��Ϣ�ķ���
	private Person getPersonInfo(HttpServletRequest request,HttpServletResponse response){
		String strid = request.getParameter("strid");
		int id = Integer.parseInt(strid);
		OpDB opdb = new OpDB();
		Person person = opdb.OpGetPerson(id);
		return person;                                    
	}
	//ʵ����������
		private String getLink(HttpServletRequest request,HttpServletResponse response){
			String url = request.getParameter("url");
			if(url != null && !url.equals("")){
				if(url.equals("sina")){
					url = "http://news.sina.com.cn/";
				}else if(url.equals("souhu")){
					url = "http://news.sohu.com/";
				}else if(url.equals("qq")){
					url = "http://news.qq.com/";
				}else if(url.equals("baidu")){
					url = "http://news.baidu.com/";
				}
			}
			return url;
		}
	//���ݲ�ѯ������ȡָ������
		private ArrayList<News> GetNewsInfo(HttpServletRequest request,HttpServletResponse response){
			ArrayList<News> list = null;
			String condition = DoString.toGBK(request.getParameter("condition"));		
			if(condition != null && !condition.equals("")){
				request.getSession().setAttribute("condition", condition);
				OpDB opdb = new OpDB();
				list = opdb.OpGetAllNewsInfo(condition);
			}
			return list;
		}
}
