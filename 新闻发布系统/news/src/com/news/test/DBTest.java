package com.news.test;
import java.sql.Connection;
import com.news.dao.*;
public class DBTest {
	public static void main(String[] args) {
		DB db = new DB();
		System.out.println("数据库驱动程序注册成功！");
		/*Connection conn = db.getConn();
		if(conn != null){
			System.out.println("数据库连接成功！");
		}*/
		String sql = "insert into tb_type(type_name) values(?)";
		Object [] params = {"财经"};
		db.doPstm(sql, params);
		int count = db.getCounts();
		if(count > 0){
			System.out.println("记录插入成功了！");
		}
	}
}
