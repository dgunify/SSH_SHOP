package com.yd.dao.impl;
import java.sql.SQLException;
import java.util.List;




import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.yd.dao.NoticeDao;
import com.yd.model.Notice;



public class NoticeDaoImpl extends HibernateDaoSupport implements NoticeDao {

	

	public void deleteBean(Notice bean) {
		this.getHibernateTemplate().delete(bean);
		
	}

	public void insertBean(Notice bean) {
		this.getHibernateTemplate().save(bean);
		
	}

	@SuppressWarnings("unchecked")
	public Notice selectBean(String where) {
		List<Notice> list = this.getHibernateTemplate().find("from Notice "+where);
		if(list.size()==0){
			return null;
		}
		return list.get(0);
	}

	public long selectBeanCount(final String where) {
		long count = (Long)this.getHibernateTemplate().find(" select count(*) from Notice  "+where).get(0);
		return count;
	}

	@SuppressWarnings("unchecked")
	public List<Notice> selectBeanList(final int start,final int limit,final String where) {
		return (List<Notice>)this.getHibernateTemplate().executeFind(new HibernateCallback(){

			public Object doInHibernate(final Session session) throws HibernateException, SQLException {
				List<Notice> list = session.createQuery(" from Notice"+where).setFirstResult(start).setMaxResults(limit).list();
				return list;
			}
		});
		
	}

	public void updateBean(Notice bean) {
		this.getHibernateTemplate().update(bean);
		
	}
	
	
	
	
	
	
	
}
