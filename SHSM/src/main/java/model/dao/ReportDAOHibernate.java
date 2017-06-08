package model.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

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
		
		return this.getSession().get(ReportBean.class,report_id);//get方法:沒符合的資料會傳回null
	}

	@Override
	public List<ReportBean> select() {
		
		Query query = this.getSession().createQuery("from ReportBean");
		List<ReportBean> list = query.list();
		return list;
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
		ReportBean select=this.select(bean.getReport_id());
		if(select!=null){
			select.setReport_case(select.getReport_case());
			select.setReport_date(select.getReport_date());
			select.setReporter(select.getReporter());
			select.setCase_id(select.getCase_id());
		}
		return select;
	}

	@Override
	public boolean delete(String report_id) {
		ReportBean bean = this.select(report_id);
		if(bean!=null){
			this.getSession().delete(bean);
		return true;
		}
		return false;
	}

}
