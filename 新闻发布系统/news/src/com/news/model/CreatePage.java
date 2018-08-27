package com.news.model;
public class CreatePage {
	private int currentP;//当前的页码
	private int allR;//总记录数
	private int perR;//每页显示的记录数
	private int allP;//总页数
	private String pageInfo;//分页状态信息
	private String pageLink;//分页链接信息
	public int getCurrentP() {
		return currentP;
	}
	public void setCurrentP(String strcurrentP) {
		if(strcurrentP == null || strcurrentP.equals("")){
			strcurrentP = "1";
		}
		try {
			this.currentP = Integer.parseInt(strcurrentP);
		} catch (Exception e) {
			this.currentP = 1;
		}
		if(this.currentP < 1){
			this.currentP = 1;
		}
		if(this.currentP > this.allP){
			this.currentP = this.allP;
		}
	}
	public int getAllR() {
		return allR;
	}
	public void setAllR(int allR) {
		this.allR = allR;
	}
	public int getPerR() {
		return perR;
	}
	public void setPerR(int perR) {
		this.perR = perR;
	}
	public int getAllP() {
		return allP;
	}
	public void setAllP() {
		this.allP = (this.allR % this.perR == 0)?(this.allR/this.perR):(this.allR/this.perR+1);
	}
	public String getPageInfo() {
		return pageInfo;
	}
	public void setPageInfo() {
		this.pageInfo = "<table border=0><tr><td>";
		this.pageInfo += "第&nbsp;"+this.currentP+"&nbsp;页, 共&nbsp;"+this.allP+"&nbsp;页";
		this.pageInfo += "</td></tr></table>";
	}
	public String getPageLink() {
		return pageLink;
	}
	public void setPageLink(String gowhich) {
		if(gowhich != null && !gowhich.equals("")){
			//判断gowhich中是否包含?
			if(gowhich.indexOf("?") >= 0){
				gowhich += "&";
			}else{
				gowhich += "?";
			}
			if(this.allP > 1){
				//首页   上一页
				this.pageLink = "<table border=0><tr><td>";
				if(this.currentP > 1){					
					this.pageLink += "<a href='"+gowhich+"showpage=1'>首页</a>&nbsp;&nbsp;";
					this.pageLink += "<a href='"+gowhich+"showpage="+(this.currentP-1)+"'>上一页</a>&nbsp;&nbsp;";
				}
				//下一页   尾页
				if(this.currentP < this.allP){
					this.pageLink += "<a href='"+gowhich+"showpage="+(this.currentP+1)+"'>下一页</a>&nbsp;&nbsp;";
					this.pageLink += "<a href='"+gowhich+"showpage="+this.allP+"'>尾页</a>";
					
				}
				this.pageLink += "</td></tr></table>";
			}			
		}
	}
	
}
