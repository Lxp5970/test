<%@ page language="java" contentType="image/jpeg; charset=gbk"%>
<%@page import="java.awt.image.BufferedImage"%>
<%@ page import="java.awt.*"%>
<%@ page import="java.awt.Image" %>
<%@ page import="java.util.*" %>
<%@ page import="javax.imageio.ImageIO" %>
<%@ page import="java.io.OutputStream" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>产生验证码</title>
  </head>  
  <body>
    <%
    	BufferedImage image = new BufferedImage(60,20,BufferedImage.TYPE_INT_RGB);
    	Graphics g = image.getGraphics();
    	//绘制一个宽60高20的矩形框
    	g.setColor(Color.cyan);
    	g.fillRect(0, 0, 60, 20);
    	g.setFont(new Font("Times new Roman",Font.PLAIN,18));
    	g.setColor(Color.red);
    	Random random = new Random();
    	String sRand = "";
    	for(int i=0;i<4;i++){
    		String rand = String.valueOf(random.nextInt(10));
    		sRand += rand;
    		//在指定x轴和y轴点上绘制指定字符串rand
    		g.drawString(rand, 13*i+6, 16);
    	}
    	g.dispose();
    	//将图片输出
    	OutputStream output = response.getOutputStream();
    	ImageIO.write(image, "JPEG", output);
    	output.flush();
    	output.close();
    	output = null;
    	response.flushBuffer();
    	out.clear();
    	out = pageContext.pushBody();
     %>
  </body>
</html>
