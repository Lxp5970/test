package com.news.test;
import com.news.dao.*;
import com.news.model.*;
import java.util.ArrayList;
public class OpDBTest {
	public static void main(String[] args) {
		OpDB opdb = new OpDB();
		/*User u = new User("admin","admin");
		u.setUser_type("1");
		boolean flag = opdb.OpAddObject(u);
		if(flag){
			System.out.println("数据插入成功！");
		}*/
		//获取新闻类别
		/*ArrayList<Type> list = opdb.OpGetType();
		if(list != null && list.size() >0){
			for(Type t: list){
				System.out.println("编号id:"+t.getId()+",类别名称："+t.getType_name());
			}
		}*/
		//添加新闻人物
		/*Person p1 = new Person("姚明","北京市朝阳区",32,"篮球运动员","我国著名篮球运动员",0);
		Person p2 = new Person("丁俊晖","北京市朝阳区",35,"排球运动员","我国著名排球运动员",0);
		Person p3 = new Person("郎平","北京市朝阳区",45,"桌球运动员","我国著名桌球运动员",0);
		boolean flag = opdb.OpAddObject(p3);
		if(flag){
			System.out.println("新闻人物插入成功");
		}*/
		//获取最新的三个新闻人物
		/*ArrayList<Person> list = opdb.OpGetPerson();
		if(list != null && list.size()>0){
			for(Person p:list){
				System.out.println("姓名："+p.getPerson_name()+",职业："+p.getPerson_job());
			}
		}*/
		/*ArrayList<Person> list = opdb.OpGetPerson();
		if(list != null && list.size() >0){
			for(int i=0; i<list.size(); i++){
				Person p = list.get(i);
				System.out.println("姓名："+p.getPerson_name()+",上传时间："+p.getPerson_time());
			}
		}*/
		//获取指定的新闻人物
		//修改指定新闻人物的得票数
		boolean flag = opdb.OpReplacePerson(2);
		if(flag){
			System.out.println("得票数更新成功!");
		}else{
			System.out.println("得票数更新失败!");
		}
		//根据查询条件获取指定新闻的方法
		/*String condition = "中国";
		ArrayList<News> list = opdb.OpGetAllNewsInfo(condition);
		for(News n : list){
			System.out.println(n.getInfo_title());
		}*/
	}

}
