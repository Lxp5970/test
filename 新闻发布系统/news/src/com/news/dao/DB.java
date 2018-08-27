package com.news.dao;
import java.sql.*;
public class DB {
	//加载数据库驱动程序( 静态常量)
	private static final String DRIVER_CLASS = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
	//连接数据库驱动程序的URL
	private static final String DRIVER_URL = "jdbc:sqlserver://localhost:1433;DatabaseName=db_news";
	//数据库用户名和密码
	private static final String DRIVER_USERNAME = "sa";
	private static final String DRIVER_PASSWORD = "123456";
	private Connection conn = null;//连接数据库对象
	private PreparedStatement pStm = null;//操作数据库对象
	private ResultSet res = null;//结果集对象
	//注册数据库驱动程序(只能在某个方法体里)
	public DB(){
		try {
			Class.forName(DRIVER_CLASS);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	/**连接数据库的方法*/
	private Connection getConn(){
		try {
			conn = DriverManager.getConnection(DRIVER_URL, DRIVER_USERNAME, DRIVER_PASSWORD);
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
		return conn;
	}
	/**数据库关闭方法*/
	public void closeDB(){
		try {
			if(res != null){
				res.close();
			}
			if(pStm != null){
				pStm.close();
			}
			if(conn != null){
				conn.close();
			}
		} catch (Exception e) {
			res = null;
			pStm = null;
			conn = null;
			e.printStackTrace();
			System.out.println("数据库关闭失败");
		}
	}
	
	/**数据库增删改查的方法*/
	public void doPstm(String sql,Object[] params){
		if(sql != null && !sql.equals("")){
			//sql命令中没有占位符时，把数组的长度设为0，因为不缺定会传哪种sql命令
			if(params == null){
				params = new Object[0];
			}
			//获取数据库连接对象
			conn = this.getConn();
			if(conn != null){//连接了数据库，就获取数据库操作对象pStm
				try {
					pStm = conn.prepareStatement(sql,ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
					//每循环一次为占位符赋一次值
					for(int i=0;i<params.length;i++){
						pStm.setObject(i+1, params[i]);
					}
					pStm.execute();//判断数据是否插入成功返回true/false
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
	}
	
	/**获取结果集对象的方法*/
	public ResultSet getRs(){
		try {
			res = pStm.getResultSet();//获取查询的结果集保存到res中
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
		return res;
	}
	
	/**获取影响的记录数的方法*/
	public int getCounts(){
		int count = -1;
		try {
			count = pStm.getUpdateCount();//获取被修改的记录的数量，返回int
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
		return count;
	}
}
