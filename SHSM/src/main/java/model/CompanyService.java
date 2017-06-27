package model;

import java.util.ArrayList;
import java.util.List;

import model.dao.CompanyDAO;

public class CompanyService {
	private CompanyDAO companyDao;
	public CompanyService(CompanyDAO companydao) {
		this.companyDao = companydao;
	}


//	public static void main(String[] args) {
//		
//		try {
//			HibernateUtil.getSessionFactory().getCurrentSession().beginTransaction();
//		
//			CompanyService service = new CompanyService(
//					new CompanyDAO(HibernateUtil.getSessionFactory()));
//			CompanyBean a = service.companydao.select("eeit9458");
//			List<CompanyBean> beans = service.select(null);
//			System.out.println("beans="+beans);		
//		
//			HibernateUtil.getSessionFactory().getCurrentSession().getTransaction().commit();
//			HibernateUtil.getSessionFactory().getCurrentSession().close();
//		} finally {
//			HibernateUtil.closeSessionFactory();
//		}
//	}
	public List<CompanyBean> select(CompanyBean bean){
		List<CompanyBean> result = null;
		if(bean!=null && bean.getCom_id().length()!=0){
			CompanyBean temp = companyDao.select(bean.getCom_id());
			if(temp!=null) {
				result = new ArrayList<CompanyBean>();
				result.add(temp);
			}
		}else {
			result = companyDao.select(); 
		}
		return result;
	}
	public CompanyBean insert(CompanyBean bean) {
		CompanyBean result = null;
		if(bean!=null){			
			result = companyDao.insert(bean);
		}
		return result;
	}
	
	public CompanyBean select(String com_id){
	CompanyBean companyBean = companyDao.select(com_id);
		return companyBean;
	}
	
	public CompanyService update(){
		return null;
	}
	
	public CompanyService delete(){
		return null;
	}
	
	public CompanyBean login(String username, String password) {
		CompanyBean bean = companyDao.select(username);
		if(bean!=null) {
			if(password!=null && password.length()!=0) {
				String pass = password;	
				String temp = bean.getCom_password();	
				if(pass.equals(temp)) {
					return bean;
				}
			}
		}
		return null;
	}
}
