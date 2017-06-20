package model.dao;


import java.text.SimpleDateFormat;
import java.util.HashMap;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;

import model.CompanyBean;
import model.ICompanyDAO;

public class CompanyDAO implements ICompanyDAO {
	private SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
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
			
			CompanyDAO companyDao = new CompanyDAO(sf);
//			CompanyBean select = companyDao.select("eeit9458");
			List<CompanyBean> select = companyDao.select();
			System.out.println("select="+select);
			
//			System.out.println(companyDao.selectJson());
			
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

	
	public String selectJson(){
		int i = 0;
		List<CompanyBean> list = this.getSession().createQuery("from CompanyBean",CompanyBean.class).getResultList();
		String date=null;
		for(CompanyBean company:list){
			date=sdf.format(company.getCom_regist());
		}
		JSONArray array;
		JSONArray arrayAll = new JSONArray();
		while(i<list.size()){
			 array= new JSONArray();
			 
			 array.add(list.get(i).getCom_id());
			 array.add(list.get(i).getCom_password());
			 array.add(list.get(i).getCom_name());
			 array.add(list.get(i).getCom_address());
			 array.add(list.get(i).getCom_phone());
			 array.add(list.get(i).getCom_email());
			 array.add(list.get(i).getCom_intr());
			 array.add(list.get(i).getCom_img()+"");
			 array.add(list.get(i).getCom_contact());
			 array.add(list.get(i).getFax());
			 array.add(date);
			 arrayAll.add(array);
			 i++;
		}
		HashMap<Object, Object> map = new HashMap<>();
		map.put("data", arrayAll);
		return JSONValue.toJSONString(map);
	}


	@Override
	public List<CompanyBean> select() {
		return this.getSession().createQuery("FROM CompanyBean", CompanyBean.class).getResultList();
	}
	

}
