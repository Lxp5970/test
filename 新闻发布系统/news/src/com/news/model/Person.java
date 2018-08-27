package com.news.model;
import java.util.Date;
public class Person {
	private int id;//编号ID
	private String person_name;//人物姓名
	private String person_address;//人物住址
	private int person_age;//人物年龄
	private String person_job;//人物工作
	private String person_remark;//人物简介
	private int person_number;//得票数
	private Date person_time;//发布时间
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getPerson_name() {
		return person_name;
	}
	public void setPerson_name(String person_name) {
		this.person_name = person_name;
	}
	public String getPerson_address() {
		return person_address;
	}
	public void setPerson_address(String person_address) {
		this.person_address = person_address;
	}
	public int getPerson_age() {
		return person_age;
	}
	public void setPerson_age(int person_age) {
		this.person_age = person_age;
	}
	public String getPerson_job() {
		return person_job;
	}
	public void setPerson_job(String person_job) {
		this.person_job = person_job;
	}
	public String getPerson_remark() {
		return person_remark;
	}
	public void setPerson_remark(String person_remark) {
		this.person_remark = person_remark;
	}
	public int getPerson_number() {
		return person_number;
	}
	public void setPerson_number(int person_number) {
		this.person_number = person_number;
	}
	public Date getPerson_time() {
		return person_time;
	}
	public void setPerson_time(Date person_time) {
		this.person_time = person_time;
	}
	public Person(){}
	public Person(String person_name,String person_address,int person_age,String person_job,String person_remark,int person_number){
		this.person_name = person_name;
		this.person_address = person_address;
		this.person_age = person_age;
		this.person_job = person_job;
		this.person_remark = person_remark;
		this.person_number = person_number;
	}
	public Person(int id,String person_name,String person_address,int person_age,String person_job,String person_remark,int person_number){
		this.id = id;
		this.person_name = person_name;
		this.person_address = person_address;
		this.person_age = person_age;
		this.person_job = person_job;
		this.person_remark = person_remark;
		this.person_number = person_number;
	}
}
