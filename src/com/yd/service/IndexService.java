package com.yd.service;

import java.util.List;

import com.yd.dao.ProductDao;
import com.yd.dao.UserDao;
import com.yd.model.Product;
import com.yd.model.User;

/**
* @author YD
* @version 1.0
* @Description 业务层
*/
public interface IndexService {
	//获取新品推荐，店长推荐
	public List<Product> getProductBySql(ProductDao productDao,String sql);
	
	
	//注册
	public boolean register(UserDao userDao,User user);
	
}
