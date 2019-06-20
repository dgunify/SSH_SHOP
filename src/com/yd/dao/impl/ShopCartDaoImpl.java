package com.yd.dao.impl;
import java.sql.SQLException;
import java.util.List;




import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.yd.dao.ShopCartDao;
import com.yd.model.ShopCart;



public class ShopCartDaoImpl extends HibernateDaoSupport implements ShopCartDao {

	

	public void deleteBean(ShopCart bean) {
		this.getHibernateTemplate().delete(bean);
		
	}

	public void insertBean(ShopCart bean) {
		this.getHibernateTemplate().save(bean);
		
	}

	@SuppressWarnings("unchecked")
	public ShopCart selectBean(String where) {
		List<ShopCart> list = this.getHibernateTemplate().find("from ShopCart "+where);
		if(list.size()==0){
			return null;
		}
		return list.get(0);
	}

	public long selectBeanCount(final String where) {
		long count = (Long)this.getHibernateTemplate().find(" select count(*) from ShopCart  "+where).get(0);
		return count;
	}

	@SuppressWarnings("unchecked")
	public List<ShopCart> selectBeanList(final int start,final int limit,final String where) {
		return (List<ShopCart>)this.getHibernateTemplate().executeFind(new HibernateCallback(){

			public Object doInHibernate(final Session session) throws HibernateException, SQLException {
				List<ShopCart> list = session.createQuery(" from ShopCart"+where).setFirstResult(start).setMaxResults(limit).list();
				return list;
			}
		});
		
	}

	public void updateBean(ShopCart bean) {
		this.getHibernateTemplate().update(bean);
		
	}
	
	
	
	
	
	
	
}
