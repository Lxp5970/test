package com.news.model;
public class User {
	private int id;//���ID
	private String user_name;//�û���
	private String user_password;//����
	private String user_type;//�û����� ��0����ʾ��ͨ�û�����1����ʾ�����û�
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_password() {
		return user_password;
	}
	public void setUser_password(String user_password) {
		this.user_password = user_password;
	}
	public String getUser_type() {
		return user_type;
	}
	public void setUser_type(String user_type) {
		this.user_type = user_type;
	}
	public User(){}
	public User(String user_name,String user_password){
		this.user_name = user_name;
		this.user_password = user_password;
		this.user_type = "0";
	}
}
