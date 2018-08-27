package com.news.tools;
import java.util.Date;
import java.text.SimpleDateFormat;
public class DoString {
	//将日期型数据转换成String型数据的方法
	public static final String toStrTime(Date date){
		if(date == null){
			date = new Date();//当前系统时间
		}
			SimpleDateFormat hTime = new SimpleDateFormat("yyyy年MM月dd日 HH:mm:ss");//设置日期的显示格式
			String time = hTime.format(date); //将日期转换为字符型		
			return time;
	}
//将日期转换为带星期的方法
	public static final String toStrTime(){
		String week = "";
		String time = "";
		Date date = new Date();
		switch(date.getDay()){
		case 0:week = "星期日";break;
		case 1:week = "星期一";break;
		case 2:week = "星期二";break;
		case 3:week = "星期三";break;
		case 4:week = "星期四";break;
		case 5:week = "星期五";break;
		case 6:week = "星期六";break;
		}
		SimpleDateFormat hTime = new SimpleDateFormat("yyyy年MM月dd日 HH:mm:ss");//设置日期的显示格式
	    time = hTime.format(date)+week; //将日期转换为字符型
		//time = (1900+date.getYear())+"年"+(date.getMonth()+1)+"月"+(date.getDate())+"日   "+week;
		return time.toString();
	}
//修改字符编码格式的方法
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
	//过滤危险字符的方法
	public static final String filterStr(String str){
		if(str == null){
			str = "";
		}
		//危险字符
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
