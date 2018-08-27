package com.news.model;
public class Type {
	private int id;//±àºÅID
	private String type_name;//Àà±ðÃû³Æ
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getType_name() {
		return type_name;
	}
	public void setType_name(String type_name) {
		this.type_name = type_name;
	}
	public Type(){}
	public Type(String type_name){
		this.type_name = type_name;
	}
}
