package com.yd.dao.impl;
import java.sql.SQLException;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.yd.dao.ClassifyDao;
import com.yd.model.Classify;



public class ClassifyDaoImpl extends HibernateDaoSupport implements ClassifyDao {

	

	public void deleteBean(Classify bean) {
		this.getHibernateTemplate().delete(bean);
		
	}

	public void insertBean(Classify bean) {
		this.getHibernateTemplate().save(bean);
		
	}

	@SuppressWarnings("unchecked")
	public Classify selectBean(String where) {
		List<Classify> list = this.getHibernateTemplate().find("from Classify "+where);
		if(list.size()==0){
			return null;
		}
		return list.get(0);
	}

	public long selectBeanCount(final String where) {
		long count = (Long)this.getHibernateTemplate().find(" select count(*) from Classify  "+where).get(0);
		return count;
	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	public List<Classify> selectBeanList(final int start,final int limit,final String where) {
		return (List<Classify>)this.getHibernateTemplate().executeFind(new HibernateCallback(){

			public Object doInHibernate(final Session session) throws HibernateException, SQLException {
				List<Classify> list = session.createQuery(" from Classify"+where).setFirstResult(start).setMaxResults(limit).list();
				return list;
			}
		});
		
	}

	public void updateBean(Classify bean) {
		this.getHibernateTemplate().update(bean);
		
	}
	
	
	
	
	
	
	
}
