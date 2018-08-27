package com.news.model;
import java.util.Date;
public class News {
	private int id;//编号ID
	private int info_type;//新闻类型
	private String info_title;//新闻标题
	private String info_content;//新闻内容
	private String info_creator;//创建者
	private Date info_date;//发布时间
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getInfo_type() {
		return info_type;
	}
	public void setInfo_type(int info_type) {
		this.info_type = info_type;
	}
	public String getInfo_title() {
		return info_title;
	}
	public void setInfo_title(String info_title) {
		if(info_title.length() > 10){
			this.info_title = info_title.substring(0,10)+"...";
		}else{
			this.info_title = info_title;
		}		
	}
	public String getInfo_content() {
		return info_content;
	}
	public void setInfo_content(String info_content) {
		this.info_content = info_content;
	}
	public String getInfo_creator() {
		return info_creator;
	}
	public void setInfo_creator(String info_creator) {
		this.info_creator = info_creator;
	}
	public Date getInfo_date() {
		return info_date;
	}
	public void setInfo_date(Date info_date) {
		this.info_date = info_date;
	}
	public News(){}
	public News(int info_type,String info_title,String info_content,String info_creator){
		this.info_type = info_type;
		this.info_title = info_title;
		this.info_content = info_content;
		this.info_creator = info_creator;
	}
	public News(int id,int info_type,String info_title,String info_content,String info_creator){
		this.id = id;
		this.info_type = info_type;
		this.info_title = info_title;
		this.info_content = info_content;
		this.info_creator = info_creator;
	}
}
