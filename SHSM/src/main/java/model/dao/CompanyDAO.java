package model.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import model.CompanyBean;
import model.ICompanyDAO;

public class CompanyDAO implements ICompanyDAO {
	private SessionFactory sessionFactory;
	public CompanyDAO(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}
	public static void main(String[] args) {
		Configuration config = new Configuration().configure("hibernate.cfg.xml");
		SessionFactory sf = config.buildSessionFactory();
		try {
			sf.getCurrentSession().beginTransaction();
			
			ICompanyDAO companyDao = new CompanyDAO(sf);
			CompanyBean select = companyDao.select("eeit9450");
			System.out.println("select="+select);
			
//			boolean update = customerDao.update(
//					"E".getBytes(), "ellen@iii.org.tw", new java.util.Date(), "Ellen");
//			System.out.println("update="+update);
			
			sf.getCurrentSession().getTransaction().commit();
			sf.getCurrentSession().close();
		} finally {
			sf.close();
		}
	}
	@Override
	public CompanyBean select(String comid) {
		return getSession().get(CompanyBean.class, comid);
	}
	@Override
	public List<CompanyBean> select() {
		return this.getSession().createQuery("FROM CompanyBean", CompanyBean.class).getResultList();
	}
	
}
