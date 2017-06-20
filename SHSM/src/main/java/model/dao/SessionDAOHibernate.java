package model.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import model.SessionBean;
import model.SessionDAO;

public class SessionDAOHibernate implements SessionDAO {
	private SessionFactory sessionFactory;
	public SessionDAOHibernate(SessionFactory sessionFactory){
		this.sessionFactory=sessionFactory;
	}
	public Session getSession(){
		return sessionFactory.getCurrentSession();
	}
	@Override
	public SessionBean select(String session_id) {
		
		return this.getSession().get(SessionBean.class, session_id);
	}

	@Override
	public SessionBean insert(SessionBean bean) {
		if(bean!=null){
			SessionBean select = this.select(bean.getSession_id());
			if(select==null){
				this.getSession().save(bean);
				return bean;
			}
		}
		return null;
	}

}
