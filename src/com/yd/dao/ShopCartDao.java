package com.yd.dao;
import java.util.List;

import com.yd.model.ShopCart;



public interface ShopCartDao {

	
	//插入新纪录
	public void insertBean(ShopCart bean);
	
	//根据id删除纪录
	public void deleteBean(ShopCart bean);
	
	//根据id更新纪录
	public void updateBean(ShopCart bean);

	//获取信息列表,带查询功能，start 表示当前页，limit表示每页显示的条数 start=1,lmit=10
	public List<ShopCart> selectBeanList(final int start,final int limit,final String where);
	
	
	//查询记录的总的条数
	public long selectBeanCount(final String where);
	
	//查询信息
	public ShopCart selectBean(String where);
	

}
