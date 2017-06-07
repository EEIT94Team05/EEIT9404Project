package model.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import model.ReportBean;
import model.ReportDAO;

public class ReportDAOHibernate implements ReportDAO{
	private SessionFactory sessionFactory;
	public ReportDAOHibernate(SessionFactory sessionFactory){
		this.sessionFactory=sessionFactory;
	}
	public Session getSession(){
		return sessionFactory.getCurrentSession();
	}
	@Override
	public ReportBean select(String report_id) {
		
		return getSession().get(ReportBean.class,report_id);
	}

	@Override
	public List<ReportBean> select() {
		
		return this.getSession().createQuery("from ReportBean",ReportBean.class).getResultList();
	}

	@Override
	public ReportBean insert(ReportBean bean) {
		if(bean!=null){//如果有資料傳進來
			ReportBean select = this.select(bean.getReport_id());//到資料庫查有無同樣ID的資料,若有就放到select裡,沒有就放null
			if(select==null){
				 this.getSession().save(bean);
				 return bean;
			}
		}
		return null;
	}

	@Override
	public ReportBean update(ReportBean bean) {
		
		return null;
	}

	@Override
	public boolean delete(String report_id) {
	
		return false;
	}

}
