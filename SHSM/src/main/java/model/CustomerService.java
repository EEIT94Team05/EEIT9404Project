package model;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import model.dao.CustomerDAO;

public class CustomerService {
	private ICustomerDAO customerDao;
	public CustomerService(ICustomerDAO customerDao) {
		this.customerDao = customerDao;
	}
	
	public CustomerBean login(String username, String password) {
		CustomerBean bean = customerDao.select(username);
		if(bean!=null) {
			if(password!=null && password.length()!=0) {
				String pass = password;	
				String temp = bean.getCus_password();	
				if(pass.equals(temp)) {
					return bean;
				}
			}
		}
		return null;
	}
	
//	public static void main(String[] args) {
//		Configuration config = new Configuration().configure("hibernate.cfg.xml");
//		SessionFactory sf = config.buildSessionFactory();
//		try {
//			sf.getCurrentSession().beginTransaction();
//
//			CustomerService customerService = new CustomerService(
//					new CustomerDAO(sf));
//			
//			CustomerBean bean = customerService.login("eeit9410", "a87654321");
//			System.out.println("bean="+bean);
//			
//			
//		
//			sf.getCurrentSession().getTransaction().commit();
//			sf.getCurrentSession().close();
//		} finally {
//			sf.close();
//		}
//	}
}
