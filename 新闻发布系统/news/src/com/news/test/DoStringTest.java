package com.news.test;
import com.news.tools.*;
public final class DoStringTest {
	public static void main(String[] args) {
		String str = "   kskdij* jjss% f js// jdk@#$123";
		System.out.println("����ǰ��"+str);
		System.out.println("���˺�"+DoString.filterStr(str));
		System.out.println("��ǰʱ�䣺"+DoString.toStrTime(null));
	}
}
