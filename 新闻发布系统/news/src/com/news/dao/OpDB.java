package com.news.dao;
import com.news.model.*;
import java.util.ArrayList;
import java.sql.*;
public class OpDB {
	//��Ӳ���
	public boolean OpAddObject(Object obj){
		boolean flag = false;
		String sql = "";
		int count = -1;
		Object[] params = new Object[0];
		if(obj != null){
			if(obj instanceof News){
				News n = (News)obj;
				sql = "insert into tb_news(info_type,info_title,info_content,info_creator) values(?,?,?,?)";
				params = new Object[]{n.getInfo_type(),n.getInfo_title(),n.getInfo_content(),n.getInfo_creator()};
			}else if(obj instanceof Type){
				Type t = (Type)obj;
				sql = "insert into tb_type(type_name) values(?)";
				params = new Object[]{t.getType_name()};
			}else if(obj instanceof Person){
				Person p = (Person)obj;
				sql = "insert into tb_person(person_name,person_address,person_age,person_job,person_remark,person_number) values(?,?,?,?,?,?)";
				params = new Object[]{p.getPerson_name(),p.getPerson_address(),p.getPerson_age(),p.getPerson_job(),p.getPerson_remark(),p.getPerson_number()};
			}else if(obj instanceof User){
				User u = (User)obj;
				sql = "insert into tb_user(user_name,user_password,user_type) values(?,?,?)";
				params = new Object[]{u.getUser_name(),u.getUser_password(),u.getUser_type()};
			}
			DB db = new DB();
			db.doPstm(sql, params);
			count = db.getCounts();
			if(count > 0){
				flag = true;
			}
		}
		return flag;
	}
	//��ȡ�����������ķ���
	public ArrayList<Type> OpGetType(){
		ArrayList<Type> list = new ArrayList<Type>();
		String sql = "select * from tb_type";
		DB db = new DB();
		db.doPstm(sql, null);
		ResultSet res = db.getRs();
		if(res != null){
			try {
				while(res.next()){
					Type t = new Type();
					t.setId(res.getInt("id"));
					t.setType_name(res.getString("type_name"));
					list.add(t);
				}
			} catch (SQLException e) {
				e.printStackTrace();
				list = null;
			}
		}
		return list;
	}
	//����ID��ȡָ���������ı��
	public int OpGetType(int id){
		int info_type = 0;
		String sql = "select * from tb_news where id=?";
		DB db = new DB();
		Object[] params = {id};
		db.doPstm(sql, params);
		ResultSet res = db.getRs();
		if(res != null){
			try {
				while(res.next()){
					info_type = res.getInt("info_type");
				}
			} catch (Exception e) {
				e.printStackTrace();
				info_type = 0;
			}
		}
		return info_type;
	}
	//�����������ID��ȡ�������
	public String OpGetTypeName(int info_type){
		String typeName = "";
		String sql = "select * from tb_type where id=?";
		DB db = new DB();
		Object[] params = {info_type};
		db.doPstm(sql, params);
		ResultSet res = db.getRs();
		if(res != null){
			try {
				while(res.next()){
					typeName = res.getString("type_name");
				}
			} catch (Exception e) {
				e.printStackTrace();
				typeName = "";
			}
		}
		return typeName;
	}
	//��ȡ���µ�������������ķ���
	public ArrayList<Person> OpGetPerson(){
		ArrayList<Person> list = new ArrayList<Person>();
		String sql = "select TOP 3 * from tb_person order by person_time desc";
		DB db = new DB();
		db.doPstm(sql, null);
		ResultSet res = db.getRs();
		if(res != null){
			try {
				while(res.next()){
					Person p = new Person();
					p.setId(res.getInt("id"));
					p.setPerson_address(res.getString("person_address"));
					p.setPerson_age(res.getInt("person_age"));
					p.setPerson_job(res.getString("person_job"));
					p.setPerson_name(res.getString("person_name"));
					p.setPerson_number(res.getInt("person_number"));
					p.setPerson_remark(res.getString("person_remark"));
					p.setPerson_time(res.getDate("person_time"));
					list.add(p);
				}
			} catch (Exception e) {
				e.printStackTrace();
				list = null;
			}
		}
		return list;
	}
	//��ȡָ������������
	public Person OpGetPerson(int id){
		Person p = new Person();
		String sql = "select * from tb_person where id=?";
		Object[] params = {id};
		DB db = new DB();
		db.doPstm(sql, params);
		ResultSet res = db.getRs();
		if(res != null){
			try {
				while(res.next()){
					p.setId(res.getInt("id"));
					p.setPerson_address(res.getString("person_address"));
					p.setPerson_age(res.getInt("person_age"));
					p.setPerson_job(res.getString("person_job"));
					p.setPerson_name(res.getString("person_name"));
					p.setPerson_number(res.getInt("person_number"));
					p.setPerson_remark(res.getString("person_remark"));
					p.setPerson_time(res.getDate("person_time"));		
				}		
			} catch (Exception e) {
				e.printStackTrace();
				p = null;
			}
		}
		return p;
	}	
	//�޸�ָ����������ĵ�Ʊ������
	public boolean OpReplacePerson(int id){
		boolean flag = false;
		Person person = this.OpGetPerson(id);
		int num = person.getPerson_number();
		person.setPerson_number(num+1);
		String sql = "update tb_person set person_number=? where id=?";
		Object[]params = {person.getPerson_number(),person.getId()};
		DB db = new DB();
		db.doPstm(sql, params);
		int count = db.getCounts();
		if(count > 0){
			flag = true;
		}else{
			flag = false;
		}
		return flag;
	}
	//��ȡ���е��˺ź�����ķ���
	public ArrayList<User> OpGetUser(){
		ArrayList<User> list = new ArrayList<User>();
		String sql = "select * from tb_user";
		DB db = new DB();
		db.doPstm(sql, null);
		ResultSet res = db.getRs();
		if(res != null){
			try {
				while(res.next()){
					User user = new User();
					user.setId(res.getInt("id"));
					user.setUser_name(res.getString("user_name"));
					user.setUser_password(res.getString("user_password"));
					user.setUser_type(res.getString("user_type"));
					list.add(user);
				}
			} catch (Exception e) {
				e.printStackTrace();
				list = null;
			}
		}
		return list;
	}
	//�޸�ָ���˺ŵ�����
	public boolean OpUpdateUserPwd(User u){
		boolean flag = false;
		String sql = "update tb_user set user_password=? where user_name=?";
		Object[] params = {u.getUser_password(),u.getUser_name()};
		DB db = new DB();
		db.doPstm(sql, params);
		int count = db.getCounts();
		if(count > 0){
			flag = true;
		}
		return flag;
	}
	//��ȡָ������������µ�������¼
	public ArrayList<News> OpGetNewsInfo(int info_type){
		ArrayList<News> list = new ArrayList<News>();
		String sql = "select TOP 3 * from tb_news where info_type=? order by info_date desc";
		Object [] parames = {info_type};
		DB db = new DB();
		db.doPstm(sql, parames);
		ResultSet res = db.getRs();
		if(res != null){
			try {
				while(res.next()){
					News n = new News();
					n.setId(res.getInt("id"));
					n.setInfo_title(res.getString("info_title"));
					n.setInfo_content(res.getString("info_content"));
					n.setInfo_creator(res.getString("info_creator"));
					n.setInfo_date(res.getDate("info_date"));
					n.setInfo_type(res.getInt("info_type"));
					list.add(n);
				}
			} catch (Exception e) {
				e.printStackTrace();
				list = null;
			}
		}
		return list;
	}
	//��ȡ���µ�5������
	public ArrayList<News> OpGetNews(){
		ArrayList<News> list = new ArrayList<News>();
		String sql = "select TOP 5 * from tb_news order by info_date desc";
		DB db = new DB();
		db.doPstm(sql, null);
		ResultSet res = db.getRs();
		if(res != null){
			try {
				while(res.next()){
					News n = new News();
					n.setId(res.getInt("id"));
					n.setInfo_title(res.getString("info_title"));
					n.setInfo_content(res.getString("info_content"));
					n.setInfo_creator(res.getString("info_creator"));
					n.setInfo_date(res.getDate("info_date"));
					n.setInfo_type(res.getInt("info_type"));
					list.add(n);
				}
			} catch (Exception e) {
				e.printStackTrace();
				list = null;
			}
		}
		return list;
	}
	//��ȡָ��������������ݵ���ϸ��Ϣ
	public News OpGetNewsInfo(String strid){
		News n = new News();
		String sql = "select * from tb_news where id=?";
		if(strid == null || strid.equals("")){
			strid = "0";
		}
		int id = Integer.parseInt(strid);
		Object [] parames = {id};
		DB db = new DB();
		db.doPstm(sql, parames);
		ResultSet res = db.getRs();
		if(res != null){
			try {
				while(res.next()){
					n.setId(res.getInt("id"));
					n.setInfo_title(res.getString("info_title"));
					n.setInfo_content(res.getString("info_content"));
					n.setInfo_creator(res.getString("info_creator"));
					n.setInfo_date(res.getDate("info_date"));
					n.setInfo_type(res.getInt("info_type"));
				}
			} catch (Exception e) {
				e.printStackTrace();
				n = null;
			}
		}
		return n;
	}
	//���ݲ�ѯ������ȡָ������
	public ArrayList<News> OpGetAllNewsInfo(String condition){
		ArrayList<News> list = new ArrayList<News>();
		String sql = "select * from tb_news where info_title like '%"+condition+"%'";
		DB db = new DB();
		db.doPstm(sql, null);
		ResultSet res = db.getRs();
		if(res != null){
			try {
				while(res.next()){
					News n = new News();
					n.setId(res.getInt("id"));
					n.setInfo_title(res.getString("info_title"));
					n.setInfo_content(res.getString("info_content"));
					n.setInfo_creator(res.getString("info_creator"));
					n.setInfo_date(res.getDate("info_date"));
					n.setInfo_type(res.getInt("info_type"));
					list.add(n);
				}
			} catch (Exception e) {
				e.printStackTrace();
				list = null;
			}
		}
		return list;
	}
	//�޸����ŵķ���
	public boolean OpUpdateNewsInfo(News n){
		boolean flag = false;
		String sql = "update tb_news set info_title=?,info_content=?,info_creator=? where id=?";
		Object[] params = {n.getInfo_title(),n.getInfo_content(),n.getInfo_creator(),n.getId()};
		DB db = new DB();
		db.doPstm(sql, params);
		int count = db.getCounts();
		if(count > 0){
			flag = true;
		}
		return flag;
	}
	//ɾ��ָ�����ŵķ���
	public boolean OpDeleteNewsInfo(int id){
		boolean flag = false;
		String sql = "delete from tb_news where id=?";
		Object[] params = {id};
		DB db = new DB();
		db.doPstm(sql, params);
		int count = db.getCounts();
		if(count > 0){
			flag = true;
		}
		return flag;
	}
	//�������ݷ�ҳ��ص���Ϣ��װ��createPage������
	public CreatePage OpCreatePage(String sqlAll,Object[] params,int perR,String showpage,String gowhich){
		CreatePage cp = new CreatePage();
		DB db = new DB();
		db.doPstm(sqlAll, params);
		ResultSet res = db.getRs();
		if(res != null){
			try {
				res.last();//��������ļ�¼ָ���ƶ������һ����¼
				cp.setAllR(res.getRow());//�ܼ�¼��
				cp.setPerR(perR);//ÿҳ��ʾ�ļ�¼��
				cp.setAllP();//��ҳ��
				cp.setCurrentP(showpage);//��ǰҳ��
				cp.setPageInfo();
				cp.setPageLink(gowhich);
			} catch (Exception e) {
				cp = null;
			}
		}
		return cp;
	}
	//ʵ����ʾ������������ķ���
	public ArrayList<Person> OpGetAllPerson(){
		ArrayList<Person> list = new ArrayList<Person>();
		String sql = "select * from tb_person";
		DB db = new DB();
		db.doPstm(sql, null);
		ResultSet res = db.getRs();
		if(res != null){
			try {
				while(res.next()){
					Person p = new Person();
					p.setId(res.getInt("id"));
					p.setPerson_name(res.getString("person_name"));
					p.setPerson_address(res.getString("person_address"));
					p.setPerson_age(res.getInt("person_age"));
					p.setPerson_job(res.getString("person_job"));
					p.setPerson_remark(res.getString("person_remark"));
					p.setPerson_number(res.getInt("person_number"));
					p.setPerson_time(res.getDate("person_time"));
					list.add(p);
				}
			} catch (SQLException e) {
				e.printStackTrace();
				list = null;
			}
		}
		return list;
	}
	//�޸�����������Ϣ�ķ���
	public boolean OpUpdatePersonInfo(Person p){
		boolean flag = false;
		String sql = "UPDATE tb_person SET person_address=?,person_age=?,person_job=?,person_remark=? WHERE id=?";
		Object[] params = {p.getPerson_address(),p.getPerson_age(),p.getPerson_job(),p.getPerson_remark(),p.getId()};
		DB db = new DB();
		db.doPstm(sql, params);
		int count = db.getCounts();
		if(count > 0){
			flag = true;
		}
		return flag;
	}
	//ɾ��ָ����������
	public boolean OpDeletePersonInfo(int id){
		boolean flag = false;
		String sql = "delete from tb_person where id=?";
		Object[] params = {id};
		DB db = new DB();
		db.doPstm(sql, params);
		int count = db.getCounts();
		if(count > 0){
			flag = true;
		}
		return flag;
	}
}
