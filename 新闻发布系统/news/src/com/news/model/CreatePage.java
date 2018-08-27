package com.news.model;
public class CreatePage {
	private int currentP;//��ǰ��ҳ��
	private int allR;//�ܼ�¼��
	private int perR;//ÿҳ��ʾ�ļ�¼��
	private int allP;//��ҳ��
	private String pageInfo;//��ҳ״̬��Ϣ
	private String pageLink;//��ҳ������Ϣ
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
		this.pageInfo += "��&nbsp;"+this.currentP+"&nbsp;ҳ, ��&nbsp;"+this.allP+"&nbsp;ҳ";
		this.pageInfo += "</td></tr></table>";
	}
	public String getPageLink() {
		return pageLink;
	}
	public void setPageLink(String gowhich) {
		if(gowhich != null && !gowhich.equals("")){
			//�ж�gowhich���Ƿ����?
			if(gowhich.indexOf("?") >= 0){
				gowhich += "&";
			}else{
				gowhich += "?";
			}
			if(this.allP > 1){
				//��ҳ   ��һҳ
				this.pageLink = "<table border=0><tr><td>";
				if(this.currentP > 1){					
					this.pageLink += "<a href='"+gowhich+"showpage=1'>��ҳ</a>&nbsp;&nbsp;";
					this.pageLink += "<a href='"+gowhich+"showpage="+(this.currentP-1)+"'>��һҳ</a>&nbsp;&nbsp;";
				}
				//��һҳ   βҳ
				if(this.currentP < this.allP){
					this.pageLink += "<a href='"+gowhich+"showpage="+(this.currentP+1)+"'>��һҳ</a>&nbsp;&nbsp;";
					this.pageLink += "<a href='"+gowhich+"showpage="+this.allP+"'>βҳ</a>";
					
				}
				this.pageLink += "</td></tr></table>";
			}			
		}
	}
	
}
