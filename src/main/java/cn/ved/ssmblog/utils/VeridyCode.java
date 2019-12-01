package cn.ved.ssmblog.utils;

import java.awt.BasicStroke;
import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Random;

import javax.imageio.ImageIO;

import com.sun.javafx.iio.ImageStorage.ImageType;

public class VeridyCode {
	// 设置图片宽度，长度，
	private int width = 70;
	private int height =35;
	//设置随机
	private Random r = new Random();
	//可选字体
	private String[] fontNames = {"宋体","华文楷体","黑体","微软雅黑"};
	//可选字母
	private String codes = "123456789abcdefghijkmlnopqrstuvwxyz";
	//设置白色
	private Color bgColor = new Color(255, 255, 255);
	//装载字体
	private String text;
	//获取随机颜色
	private Color randomColor() {
		// TODO Auto-generated method stub
		int red=r.nextInt(150);
		int green=r.nextInt(150);
		int blue=r.nextInt(150);
		return new Color(red,green,blue);
	}
	//设置随机字体
	private Font randomFont() {
		// TODO Auto-generated method stub
		int index = r.nextInt(fontNames.length);
		String fontName=fontNames[index];
		int style=r.nextInt(4);
		int size = r.nextInt(4)+24;
		return new Font(fontName, style, size);
	}
	//画干扰线
	private void darwLine(BufferedImage image) {
		// TODO Auto-generated method stub
		int num = 3;
		Graphics2D g2=(Graphics2D)image.getGraphics();
		for (int i = 0;i<num;i++) {
			int x1 = r.nextInt(width);
			int y1 = r.nextInt(height);
			int x2 = r.nextInt(width);
			int y2 = r.nextInt(height);
			g2.setStroke(new BasicStroke(1.5F));
			g2.setColor(Color.black);
			g2.drawLine(x1, y1, x2, y2);	
		}
	}
	//产生随机字符
	private char randomChar() {
		// TODO Auto-generated method stub
		int index = r.nextInt(codes.length());
		return codes.charAt(index);
	}
	//得到图片缓冲
	private BufferedImage creatImage() {
		// TODO Auto-generated method stub
		BufferedImage image = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
		Graphics2D g2=(Graphics2D)image.getGraphics();
		g2.setColor(bgColor);
		g2.fillRect(0, 0, width, height);
		return image;
	}
	//得到验证码
	public  BufferedImage getImage() {
		// TODO Auto-generated method stub
			BufferedImage image = creatImage();
			Graphics2D g2 = (Graphics2D) image.getGraphics();
			StringBuilder sb = new StringBuilder();
			for(int i=0;i<4;i++) {
				String s = randomChar()+"";//随机生成一个字符
				sb.append(s);
				float x = i * 1.0F * width/4;
				g2.setFont(randomFont());
				g2.setColor(randomColor());
				g2.drawString(s, x, height-5);
			}
			this.text=sb.toString();
			darwLine(image);
			return image;
	}
	public String getText() {
		return text;
	}
	public static void output(BufferedImage image, OutputStream out) throws IOException {
		ImageIO.write(image, "JPEG", out);
	}
}
