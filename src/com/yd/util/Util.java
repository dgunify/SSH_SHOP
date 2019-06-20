package com.yd.util;


import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.yd.dao.ManageDao;
import com.yd.model.Manage;


/**
* @author YD
* @version 1.0
* @Description 工具
*/
public class Util {
	
	public static String getTime2(){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		Date date = new Date();
		return sdf.format(date.getTime());
	}

	
	public static String getTime(){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date = new Date();
		return sdf.format(date.getTime());
	}
	
	public static String getTime3(Date date){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String s = sdf.format(date);
		return s;
	}
	
	
	public static Date getTime4(String s) throws ParseException{
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date ss = sdf.parse(s);
		return ss;
	}

	/**
	* @author YD
	* @version 1.0
	* @Description 上传文件
	*/
	public static void copyFile(File src, File dst) {
		try {
			int BUFFER_SIZE = 16 * 1024;
			InputStream in = null;
			OutputStream out = null;
			try {
				in = new BufferedInputStream(new FileInputStream(src),
						BUFFER_SIZE);
				out = new BufferedOutputStream(new FileOutputStream(dst),
						BUFFER_SIZE);
				byte[] buffer = new byte[BUFFER_SIZE]; 
				for (int byteRead = 0; (byteRead = in.read(buffer)) > 0; ) 
				{ 
					out.write(buffer, 0, byteRead); 
				} 

			} finally {
				if (null != in) {
					in.close();
				}
				if (null != out) {
					out.close();
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	/**
	* @param 
	* @return 
	* @author YD
	* @version 1.0
	* @Description 初始化系统
	*/
	public static void init(HttpServletRequest request){
		  WebApplicationContext app = WebApplicationContextUtils.getWebApplicationContext(request.getSession().getServletContext());
		  ManageDao manageDao = (ManageDao)app.getBean("manageDao");
          Manage manage = manageDao.selectBean(" where username='admin'  ");
  		if(manage==null){
  			manage = new Manage();
  			EncryDes passEncry = new EncryDes();
  			manage.setPassword(passEncry.getEncPass("111111"));
  			manage.setUsername("admin");
  			manageDao.insertBean(manage);
  		}
	}

	/**
	* @param 
	* @return 
	* @author YD
	* @version 1.0
	* @Description 增加天数
	*/
	public static String addDay(String riqi,int shuliang) throws ParseException  {
		DateFormat df=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

		Calendar c = Calendar.getInstance();
		
		c.setTime(df.parse(riqi));
		
		c.add(Calendar.DATE, shuliang); 
		return df.format(c.getTime());
	}
	
	public static void main(String[] args) throws ParseException {
		System.out.println(Util.addDay("2017-04-23 11:45:00", 50));
		EncryDes passEncry = new EncryDes();
		System.out.println(passEncry.getEncPass("111111"));
	}
	
	
	
}
