package com.news.test;
import java.sql.Connection;
import com.news.dao.*;
public class DBTest {
	public static void main(String[] args) {
		DB db = new DB();
		System.out.println("���ݿ���������ע��ɹ���");
		/*Connection conn = db.getConn();
		if(conn != null){
			System.out.println("���ݿ����ӳɹ���");
		}*/
		String sql = "insert into tb_type(type_name) values(?)";
		Object [] params = {"�ƾ�"};
		db.doPstm(sql, params);
		int count = db.getCounts();
		if(count > 0){
			System.out.println("��¼����ɹ��ˣ�");
		}
	}
}
