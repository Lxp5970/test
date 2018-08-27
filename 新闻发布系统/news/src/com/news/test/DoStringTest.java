package com.news.test;
import com.news.tools.*;
public final class DoStringTest {
	public static void main(String[] args) {
		String str = "   kskdij* jjss% f js// jdk@#$123";
		System.out.println("过滤前："+str);
		System.out.println("过滤后："+DoString.filterStr(str));
		System.out.println("当前时间："+DoString.toStrTime(null));
	}
}
