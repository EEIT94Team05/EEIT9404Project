package model.dao;

import java.util.Date;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import model.CustomerBean;
import model.ICustomerDAO;


public class CustomerDAO implements ICustomerDAO {
	private SessionFactory sessionFactory;
	public CustomerDAO(SessionFactory sessionFactory) {
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
			
			ICustomerDAO customerDao = new CustomerDAO(sf);
			CustomerBean select = customerDao.select("eeit9410");
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
	public CustomerBean select(String custid) {
		return getSession().get(CustomerBean.class, custid);
	}
	
}

