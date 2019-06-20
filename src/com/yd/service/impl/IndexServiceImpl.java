package com.yd.service.impl;

import java.util.Date;
import java.util.List;

import com.yd.dao.ProductDao;
import com.yd.dao.UserDao;
import com.yd.model.Product;
import com.yd.model.User;
import com.yd.service.IndexService;

/**
* @author YD
* @version 1.0
* @Description 业务层实现
*/
public class IndexServiceImpl implements IndexService{

	/**
	* @param ProductDao productDao, String sql
	* @return List<Product>
	* @author YD
	* @version 1.0
	* @Description 获取新品推荐，店长推荐
	*/
	@Override
	public List<Product> getProductBySql(ProductDao productDao, String sql) {
		return productDao.selectBeanList(0, 3,sql);
	}

	
	
	@Override
	public boolean register(UserDao userDao, User user) {
		User bean = userDao.selectBean("  where deletestatus=0 and username='"
				+ user.getUsername() + "'");
		
		if (bean == null && user.getUsername()!=null && !"".equals(user.getUsername())) {
			user.setCreatetime(new Date());
			userDao.insertBean(user);
			return true;
		}
		return false;
	}
	
}
