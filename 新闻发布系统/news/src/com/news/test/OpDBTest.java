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
			System.out.println("���ݲ���ɹ���");
		}*/
		//��ȡ�������
		/*ArrayList<Type> list = opdb.OpGetType();
		if(list != null && list.size() >0){
			for(Type t: list){
				System.out.println("���id:"+t.getId()+",������ƣ�"+t.getType_name());
			}
		}*/
		//�����������
		/*Person p1 = new Person("Ҧ��","�����г�����",32,"�����˶�Ա","�ҹ����������˶�Ա",0);
		Person p2 = new Person("������","�����г�����",35,"�����˶�Ա","�ҹ����������˶�Ա",0);
		Person p3 = new Person("��ƽ","�����г�����",45,"�����˶�Ա","�ҹ����������˶�Ա",0);
		boolean flag = opdb.OpAddObject(p3);
		if(flag){
			System.out.println("�����������ɹ�");
		}*/
		//��ȡ���µ�������������
		/*ArrayList<Person> list = opdb.OpGetPerson();
		if(list != null && list.size()>0){
			for(Person p:list){
				System.out.println("������"+p.getPerson_name()+",ְҵ��"+p.getPerson_job());
			}
		}*/
		/*ArrayList<Person> list = opdb.OpGetPerson();
		if(list != null && list.size() >0){
			for(int i=0; i<list.size(); i++){
				Person p = list.get(i);
				System.out.println("������"+p.getPerson_name()+",�ϴ�ʱ�䣺"+p.getPerson_time());
			}
		}*/
		//��ȡָ������������
		//�޸�ָ����������ĵ�Ʊ��
		boolean flag = opdb.OpReplacePerson(2);
		if(flag){
			System.out.println("��Ʊ�����³ɹ�!");
		}else{
			System.out.println("��Ʊ������ʧ��!");
		}
		//���ݲ�ѯ������ȡָ�����ŵķ���
		/*String condition = "�й�";
		ArrayList<News> list = opdb.OpGetAllNewsInfo(condition);
		for(News n : list){
			System.out.println(n.getInfo_title());
		}*/
	}

}
