package com.news.tools;
import java.util.Date;
import java.text.SimpleDateFormat;
public class DoString {
	//������������ת����String�����ݵķ���
	public static final String toStrTime(Date date){
		if(date == null){
			date = new Date();//��ǰϵͳʱ��
		}
			SimpleDateFormat hTime = new SimpleDateFormat("yyyy��MM��dd�� HH:mm:ss");//�������ڵ���ʾ��ʽ
			String time = hTime.format(date); //������ת��Ϊ�ַ���		
			return time;
	}
//������ת��Ϊ�����ڵķ���
	public static final String toStrTime(){
		String week = "";
		String time = "";
		Date date = new Date();
		switch(date.getDay()){
		case 0:week = "������";break;
		case 1:week = "����һ";break;
		case 2:week = "���ڶ�";break;
		case 3:week = "������";break;
		case 4:week = "������";break;
		case 5:week = "������";break;
		case 6:week = "������";break;
		}
		SimpleDateFormat hTime = new SimpleDateFormat("yyyy��MM��dd�� HH:mm:ss");//�������ڵ���ʾ��ʽ
	    time = hTime.format(date)+week; //������ת��Ϊ�ַ���
		//time = (1900+date.getYear())+"��"+(date.getMonth()+1)+"��"+(date.getDate())+"��   "+week;
		return time.toString();
	}
//�޸��ַ������ʽ�ķ���
	public static final String toGBK(String str){
		if(str == null){
			str = "";
		}
		try {
			str = new String(str.getBytes("ISO-8859-1"),"GBK");
			str = str.trim();
		} catch (Exception e) {
			str = "";
		}
		return str;
	}	
	//����Σ���ַ��ķ���
	public static final String filterStr(String str){
		if(str == null){
			str = "";
		}
		//Σ���ַ�
				str = str.replaceAll("\\s", "");
				str = str.replaceAll(";", "");
				str = str.replaceAll("&", "");
				str = str.replaceAll("<", "");
				str = str.replaceAll(">", "");
				str = str.replaceAll("'", "");
				str = str.replaceAll("-", "");
				str = str.replaceAll("/", "");
				str = str.replaceAll("%", "");
				str = str.replaceAll(",", "");
				return str;
	}
}
