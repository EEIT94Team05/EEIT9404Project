package model.dao;

import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.LinkedHashSet;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.query.Query;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;

import model.CustomerBean;
import model.ICustomerDAO;


public class CustomerDAO implements ICustomerDAO {
	private SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd"); 
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
			
			CustomerDAO customerDao = new CustomerDAO(sf);
//			CustomerBean select = customerDao.select("eeit9410");
//			System.out.println("select="+select);
//			
			System.out.println(customerDao.selectAll());

			
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
	
	public  String selectAll(){
		int i=0;
		JSONArray obj;
		List<CustomerBean> list = this.getSession().createQuery("from CustomerBean" ,CustomerBean.class).getResultList();
		String date=null;
		for(CustomerBean customer:list){
			date=sdf.format(customer.getCus_regist());
		}
		JSONArray jsonArray = new JSONArray(); 
		while(i<list.size()){
			obj = new JSONArray();

			obj.add(list.get(i).getCus_id());
			obj.add(list.get(i).getCus_password());
			obj.add(list.get(i).getCus_name());
			obj.add(list.get(i).getCus_address());
			obj.add(list.get(i).getCus_phone());
			obj.add(date);
			obj.add(list.get(i).getCus_email());
			obj.add(list.get(i).getSex());
		
			jsonArray.add(obj);
			i++;
		}

		HashMap<Object, Object> map2 = new HashMap<>();
		map2.put("data", jsonArray);
		String jsonString = JSONValue.toJSONString(map2);
		return jsonString;
	}
//	public List<CustomerBean> selectAll(){
//		Query query = this.getSession().createQuery("from CustomerBean" ,CustomerBean.class);
//		List<CustomerBean> list = query.list();
//		return list;
//	}
	
}

