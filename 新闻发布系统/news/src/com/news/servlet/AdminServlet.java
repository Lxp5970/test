package com.news.servlet;
import java.io.IOException;
import java.io.PrintWriter;

import com.news.dao.*;
import com.news.model.*;

import java.util.ArrayList;

import com.news.tools.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
public class AdminServlet extends HttpServlet{
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
		if(method == null || method.equals("login")){
				boolean flag = this.login(request, response);
				if(flag){
					//request.getSession().setAttribute("isLogin", "ok");
					response.sendRedirect("admin/AdminTemp.jsp");
				}else{
					out.println("<script>alert('�û���������������������룡');history.go(-1);</script>");
				}			
		}else if(method.equals("isLogin")){
			boolean flag = this.isLogin(request, response);
			if(flag){
				response.sendRedirect("admin/login.jsp");
			}else{
				response.sendRedirect("admin/AdminTemp.jsp");
			}
		}else if(method.equals("AddUser")){
			request.getRequestDispatcher("admin/login.jsp?mainPage=AddUser").forward(request, response);
		}else if(method.equals("zhuce")){
			boolean flag = this.setRegister(request, response);
			if(flag){
				out.println("<script>alert('ע��ɹ�');history.go(-1);</script>");
			}else{
				out.println("<script>alert('ע��ʧ��');history.go(-1);</script>");
			}
		}else if(method.equals("news_add")){
			boolean flag = this.addNewsInfo(request, response);
			if(flag){
				out.println("<script>alert('������ųɹ�!');window.location.href='admin/AdminTemp.jsp?mainPage=news_add'</script>");
			}else{
				out.println("<script>alert('�������ʧ�ܣ�');history.go(-1);</script>");
			}
		}else if(method.equals("news_select")){
			ArrayList<News> list = this.GetNewsInfo(request, response);
			if(list != null && list.size() > 0){
				request.getSession().setAttribute("NewsList", list);
				response.sendRedirect("admin/AdminTemp.jsp?mainPage=news_select");
			}else{
				out.println("<script>alert('��ѯ���ݲ����ڣ�');history.go(-1);</script>");
			}
		}else if(method.equals("news_update")){
			boolean flag = this.updateNewsInfo(request, response);
			if(flag){
				out.println("<script>alert('�޸����ųɹ�!');window.location.href='admin/AdminTemp.jsp'</script>");
			}else{
				out.println("<script>alert('�޸�����ʧ��!');window.location.href='admin/AdminTemp.jsp'</script>");
			}
		}else if(method.equals("news_delete")){
			boolean flag = this.deleteNewsInfo(request, response);
			if(flag){
				out.println("<script>alert('ɾ�����ųɹ�!');window.location.href='admin/AdminTemp.jsp'</script>");
			}else{
				out.println("<script>alert('ɾ������ʧ��!');window.location.href='admin/AdminTemp.jsp'</script>");
			}
		}else if(method.equals("updatePwd")){
			boolean flag = this.updatePwd(request, response);
			if(flag){
				out.println("<script>alert('�޸��˺�����ɹ�!');window.location.href='admin/login.jsp'</script>");
			}else{
				out.println("<script>alert('�޸��˺�����ʧ��!');window.location.href='admin/login.jsp?mainPage=updatePwd.jsp'</script>");
			}
		}else if(method.equals("person_add")){
			boolean flag = this.addPersonInfo(request, response);
			if(flag){
				out.println("<script>alert('�����������ɹ�!');window.location.href='admin/AdminTemp.jsp';</script>");
			}else{
				out.println("<script>alert('�����������ʧ��!');window.location.href='admin/AdminTemp.jsp';</script>");
			}
		}else if(method.equals("person_info")){
			Person person = this.getPersonInfo(request, response);
			if(person != null){
				request.getSession().setAttribute("persons", person);
				request.getRequestDispatcher("admin/AdminTemp.jsp?mainPage=person_info").forward(request, response);
			}else{
				out.println("<script>alert('ҳ����ת����!');history.go(-1)</script>");
			}		
		}else if(method.equals("person_update")){
			boolean flag = this.updatePersonInfo(request, response);
			if(flag){
				out.println("<script>alert('�޸�����������Ϣ�ɹ�!');window.location.href='admin/AdminTemp.jsp?mainPage=person_select'</script>");
			}else{
				out.println("<script>alert('�޸�����������Ϣʧ��!');window.location.href='admin/person_update.jsp'</script>");
			}
		}else if(method.equals("person_delete")){
			boolean flag = this.deletePersonInfo(request, response);
			if(flag){
				out.println("<script>alert('ɾ����������ɹ�!');window.location.href='admin/AdminTemp.jsp?mainPage=person_select'</script>");
			}else{
				out.println("<script>alert('ɾ����������ʧ��!');window.location.href='admin/AdminTemp.jsp?mainPage=person_select'</script>");
			}
		}
	}
	//��֤�û���ݵķ���
	private boolean login(HttpServletRequest request,HttpServletResponse response){
		boolean flag = false;
		String username = DoString.filterStr(request.getParameter("username"));
		String password = DoString.filterStr(request.getParameter("password"));
		OpDB opdb = new OpDB();
		ArrayList<User> list = opdb.OpGetUser();
		if(list != null && list.size() > 0){
			for(User u: list){
				if(u.getUser_name().equals(username) && u.getUser_password().equals(password) ){
					flag = true;
					break;
				}
			}
		}
		return flag;
	}
	//��֤�Ƿ���Ҫ���ε�½
	private boolean isLogin(HttpServletRequest request,HttpServletResponse response){
		boolean flag = false;
		String isLogin = (String)request.getSession().getAttribute("isLogin");
		if(isLogin == null || !isLogin.equals("ok")){
			flag = true;
		}
		return flag;
	}
	//ע�����û�
	private boolean setRegister(HttpServletRequest request,HttpServletResponse response){
		boolean flag = false;
		String newName = DoString.toGBK(request.getParameter("newName"));
		String newPasswd = DoString.toGBK(request.getParameter("newPasswd"));
		User user = new User(newName,newPasswd);
		OpDB opdb = new OpDB();
		flag = opdb.OpAddObject(user);
		if(flag){
			flag = true;
		}else{
			flag = false;
		}
		return flag;
	}
	//�޸�ָ���û����뷽��
	private boolean updatePwd(HttpServletRequest request,HttpServletResponse response){
		boolean flag = false;
		String yourName = request.getParameter("yourName");
		String passwd = request.getParameter("newPawd");
		User u = new User(yourName,passwd);
		OpDB opdb = new OpDB();
		flag = opdb.OpUpdateUserPwd(u);
		return flag;
	}
	//������ŵķ���
	private boolean addNewsInfo(HttpServletRequest request,HttpServletResponse response){
		boolean flag = false;
		String info_type = DoString.toGBK(request.getParameter("info_type"));
		int type = Integer.parseInt(info_type);
		String info_title = DoString.toGBK(request.getParameter("info_title"));
		String info_content = DoString.toGBK(request.getParameter("info_content"));
		String info_creator = DoString.toGBK(request.getParameter("info_creator"));
		News n = new News(type,info_title,info_content,info_creator);
		OpDB opdb = new OpDB();
		flag = opdb.OpAddObject(n);
		return flag;
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
	//�޸�ָ����������Ϣ
	private boolean updateNewsInfo(HttpServletRequest request,HttpServletResponse response){
		boolean flag = false;
		String strid = request.getParameter("id");
		String infoType = request.getParameter("info_type");
		int id = 0;
		int info_type = 0;
		try {
			id = Integer.parseInt(strid);
			info_type = Integer.parseInt(infoType);
		} catch (Exception e) {
			 id = 0;
			 info_type = 0;
		}
		String info_title = DoString.toGBK(request.getParameter("info_title"));
		String info_content = DoString.toGBK(request.getParameter("info_content"));
		String info_creator = DoString.toGBK(request.getParameter("info_creator"));
		News n = new News(id,info_type,info_title,info_content,info_creator);
		OpDB opdb = new OpDB();
		flag = opdb.OpUpdateNewsInfo(n);
		return flag;
	}
	//ɾ��ָ�����ŵķ���
	private boolean deleteNewsInfo(HttpServletRequest request,HttpServletResponse response){
		boolean flag = false;
		String strid = request.getParameter("strid");
		int id = 0;
		try {
			id = Integer.parseInt(strid);
		} catch (Exception e) {
			id = 0;
		}
		OpDB opdb = new OpDB();
		flag = opdb.OpDeleteNewsInfo(id);
		return flag;
	}
	//�����������ķ���
	private boolean addPersonInfo(HttpServletRequest request,HttpServletResponse response){
		boolean flag = false;
		String person_name = DoString.toGBK(request.getParameter("person_name"));
		String person_address = DoString.toGBK(request.getParameter("person_address"));
		String person_age = DoString.toGBK(request.getParameter("person_age"));
		String person_job = DoString.toGBK(request.getParameter("person_job"));
		String person_remark = DoString.toGBK(request.getParameter("person_remark"));
		String person_number = DoString.toGBK(request.getParameter("person_number"));
		int age = 0;
		int num = 0;
		try {
			age = Integer.parseInt(person_age);
			num = Integer.parseInt(person_number);
		} catch (Exception e) {
			age = 0;
			num = 0;
		}
		Person p = new Person(person_name,person_address,age,person_job,person_remark,num);
		OpDB opdb = new OpDB();
		flag = opdb.OpAddObject(p);
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
	//�޸�ָ�������������Ϣ�ķ���
		private boolean updatePersonInfo(HttpServletRequest request,HttpServletResponse response){
			boolean flag = false;
			String strid = request.getParameter("strid");
			String person_name = DoString.toGBK(request.getParameter("person_name"));
			String person_address = DoString.toGBK(request.getParameter("person_address"));
			String person_age = DoString.toGBK(request.getParameter("person_age"));
			String person_job = DoString.toGBK(request.getParameter("person_job"));
			String person_remark = DoString.toGBK(request.getParameter("person_remark"));
			String person_number = DoString.toGBK(request.getParameter("person_number"));
			int age = 0;
			int num = 0;
			int id = 0;
			try {
				age = Integer.parseInt(person_age);
				num = Integer.parseInt(person_number);
				id = Integer.parseInt(strid);
			} catch (Exception e) {
				age = 0;
				num = 0;
				id = 0;
			}
			Person p = new Person(id,person_name,person_address,age,person_job,person_remark,num);
			OpDB opdb = new OpDB();
			flag = opdb.OpUpdatePersonInfo(p);
			return flag;
		}
	//ɾ��ָ����������ķ���
		private boolean deletePersonInfo(HttpServletRequest request,HttpServletResponse response){
			boolean flag = false;
			String strid = request.getParameter("strid");
			int id = 0;
			try {
				id = Integer.parseInt(strid);
			} catch (Exception e) {
				id = 0;
			}
			OpDB opdb = new OpDB();
			flag = opdb.OpDeletePersonInfo(id);
			return flag;
		}
}
