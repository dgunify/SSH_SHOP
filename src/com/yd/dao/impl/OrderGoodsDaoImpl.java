package com.yd.dao.impl;
import java.sql.SQLException;
import java.util.List;




import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.yd.dao.OrderGoodsDao;
import com.yd.model.OrderGoods;



public class OrderGoodsDaoImpl extends HibernateDaoSupport implements OrderGoodsDao {

	

	public void deleteBean(OrderGoods bean) {
		this.getHibernateTemplate().delete(bean);
		
	}

	public void insertBean(OrderGoods bean) {
		this.getHibernateTemplate().save(bean);
		
	}

	@SuppressWarnings("unchecked")
	public OrderGoods selectBean(String where) {
		List<OrderGoods> list = this.getHibernateTemplate().find("from OrderGoods "+where);
		if(list.size()==0){
			return null;
		}
		return list.get(0);
	}

	public long selectBeanCount(final String where) {
		long count = (Long)this.getHibernateTemplate().find(" select count(*) from OrderGoods  "+where).get(0);
		return count;
	}

	@SuppressWarnings("unchecked")
	public List<OrderGoods> selectBeanList(final int start,final int limit,final String where) {
		return (List<OrderGoods>)this.getHibernateTemplate().executeFind(new HibernateCallback(){

			public Object doInHibernate(final Session session) throws HibernateException, SQLException {
				List<OrderGoods> list = session.createQuery(" from OrderGoods"+where).setFirstResult(start).setMaxResults(limit).list();
				return list;
			}
		});
		
	}

	public void updateBean(OrderGoods bean) {
		this.getHibernateTemplate().update(bean);
		
	}
	
	
	
	
	
	
	
}
