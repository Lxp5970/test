package com.news.dao;
import java.sql.*;
public class DB {
	//�������ݿ���������( ��̬����)
	private static final String DRIVER_CLASS = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
	//�������ݿ����������URL
	private static final String DRIVER_URL = "jdbc:sqlserver://localhost:1433;DatabaseName=db_news";
	//���ݿ��û���������
	private static final String DRIVER_USERNAME = "sa";
	private static final String DRIVER_PASSWORD = "123456";
	private Connection conn = null;//�������ݿ����
	private PreparedStatement pStm = null;//�������ݿ����
	private ResultSet res = null;//���������
	//ע�����ݿ���������(ֻ����ĳ����������)
	public DB(){
		try {
			Class.forName(DRIVER_CLASS);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	/**�������ݿ�ķ���*/
	private Connection getConn(){
		try {
			conn = DriverManager.getConnection(DRIVER_URL, DRIVER_USERNAME, DRIVER_PASSWORD);
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
		return conn;
	}
	/**���ݿ�رշ���*/
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
			System.out.println("���ݿ�ر�ʧ��");
		}
	}
	
	/**���ݿ���ɾ�Ĳ�ķ���*/
	public void doPstm(String sql,Object[] params){
		if(sql != null && !sql.equals("")){
			//sql������û��ռλ��ʱ��������ĳ�����Ϊ0����Ϊ��ȱ���ᴫ����sql����
			if(params == null){
				params = new Object[0];
			}
			//��ȡ���ݿ����Ӷ���
			conn = this.getConn();
			if(conn != null){//���������ݿ⣬�ͻ�ȡ���ݿ��������pStm
				try {
					pStm = conn.prepareStatement(sql,ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
					//ÿѭ��һ��Ϊռλ����һ��ֵ
					for(int i=0;i<params.length;i++){
						pStm.setObject(i+1, params[i]);
					}
					pStm.execute();//�ж������Ƿ����ɹ�����true/false
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
	}
	
	/**��ȡ���������ķ���*/
	public ResultSet getRs(){
		try {
			res = pStm.getResultSet();//��ȡ��ѯ�Ľ�������浽res��
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
		return res;
	}
	
	/**��ȡӰ��ļ�¼���ķ���*/
	public int getCounts(){
		int count = -1;
		try {
			count = pStm.getUpdateCount();//��ȡ���޸ĵļ�¼������������int
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
		return count;
	}
}
