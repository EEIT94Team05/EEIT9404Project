package model;

import java.util.ArrayList;
import java.util.List;

import hibernate.HibernateUtil;
import model.dao.CompanyDAO;

public class CompanyService {
	ICompanyDAO companydao;
	public CompanyService(ICompanyDAO companydao) {
		this.companydao = companydao;
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
			CompanyBean temp = companydao.select(bean.getCom_id());
			if(temp!=null) {
				result = new ArrayList<CompanyBean>();
				result.add(temp);
			}
		}else {
			result = companydao.select(); 
		}
		return result;
	}
	
//	public CompanyBean insert(CompanyBean bean){
//		CompanyBean result = null;
//		if(bean!=null){
//			result = bean;
//			
//		}
//		return companydao.insert(bean);
//	}
	
	public CompanyBean select(String com_id){
	CompanyBean companyBean = companydao.select(com_id);
		return companyBean;
	}
	
	public CompanyService update(){
		return null;
	}
	
	public CompanyService delete(){
		return null;
	}
	
	public CompanyBean login(String username, String password) {
		CompanyBean bean = companydao.select(username);
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
