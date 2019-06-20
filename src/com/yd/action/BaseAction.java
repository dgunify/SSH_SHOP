package com.yd.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;
import com.yd.dao.ClassifyDao;
import com.yd.dao.ManageDao;
import com.yd.dao.NoticeDao;
import com.yd.dao.OrderGoodsDao;
import com.yd.dao.ProductDao;
import com.yd.dao.ShopCartDao;
import com.yd.dao.UserDao;
import com.yd.util.EncryDes;

/**
* @author YD
* @version 1.0
* @Description 基础Action
*/
public class BaseAction extends ActionSupport{
	
	
	
	/**
	* @return String
	* @author YD
	* @version 1.0
	* @Description 获取路径
	*/
	public String getCtx(){
		HttpServletRequest request = ServletActionContext.getRequest();
		return request.getContextPath();
	}
	
	
	/**
	* @param 
	* @return 
	* @author YD
	* @version 1.0
	* @Description 返回
	*/
	public void writer(HttpServletResponse response,String str) throws IOException{
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter writer = response.getWriter();
		writer.print(str);
	}
	
	
	private static final long serialVersionUID = 1L;
	
	
	/**
	* @author YD
	* @version 1.0
	* @Description 密码加密类
	*/
	EncryDes passEncry = new EncryDes();
	
	/**
	* @author YD
	* @version 1.0
	* @Description 获取url
	*/
	protected String url = "./";
	public String getUrl() {
		return url;
	}
	
	public void setUrl(String url) {
		this.url = url;
	}
	
	
	/**
	* @author YD
	* @version 1.0
	* @Description 注入manageDao  管理
	*/
	protected ManageDao manageDao;
	public ManageDao getManageDao() {
		return manageDao;
	}
	public void setManageDao(ManageDao manageDao) {
		this.manageDao = manageDao;
	}
	
	
	
	/**
    * @param 
    * @return 
    * @author YD
    * @version 1.0
    * @Description 注入userDao  用户
    */
    protected UserDao userDao;
	public UserDao getUserDao() {
		return userDao;
	}
	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}
	
	
	/**
	* @param 
	* @return 
	* @author YD
	* @version 1.0
	* @Description 注入ClassifyDao 分类
	*/
	protected ClassifyDao classifyDao;
	public ClassifyDao getClassifyDao() {
		return classifyDao;
	}

	public void setClassifyDao(ClassifyDao classifyDao) {
		this.classifyDao = classifyDao;
	}
	
	
	
	/**
	* @author YD
	* @version 1.0
	* @Description 注入productDao  商品
	*/
	protected ProductDao productDao;
	
	public ProductDao getProductDao() {
		return productDao;
	}

	public void setProductDao(ProductDao productDao) {
		this.productDao = productDao;
	}
	
	

    /**
    * @author YD
    * @version 1.0
    * @Description 注入noticeDao  公告
    */
	protected NoticeDao noticeDao;
	public NoticeDao getNoticeDao() {
		return noticeDao;
	}

	public void setNoticeDao(NoticeDao noticeDao) {
		this.noticeDao = noticeDao;
	}

	
	
	/**
	* @param 
	* @return 
	* @author YD
	* @version 1.0 
	* @Description 注入shopCartDao   购物车
	*/
	protected ShopCartDao shopCartDao;
	public ShopCartDao getShopCartDao() {
		return shopCartDao;
	}

	public void setShopCartDao(ShopCartDao shopCartDao) {
		this.shopCartDao = shopCartDao;
	}
	
	
	
	
	
	/**
	* @author YD
	* @version 1.0
	* @Description 注入orderGoodsDao  订单
	*/
	protected OrderGoodsDao orderGoodsDao;

	public OrderGoodsDao getOrderGoodsDao() {
		return orderGoodsDao;
	}

	public void setOrderGoodsDao(OrderGoodsDao orderGoodsDao) {
		this.orderGoodsDao = orderGoodsDao;
	}
	
}
