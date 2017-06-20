package model.dao;

import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;

import model.ReportBean;
import model.ReportDAO;

public class ReportDAOHibernate implements ReportDAO{
	private SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	private SessionFactory sessionFactory;
	public ReportDAOHibernate(SessionFactory sessionFactory){
		this.sessionFactory=sessionFactory;
	}
	public Session getSession(){
		return sessionFactory.getCurrentSession();
	}
	@Override
	public ReportBean select(Integer report_id) {
		
		return this.getSession().get(ReportBean.class,report_id);//get方法:沒符合的資料會傳回null
	}

	@Override
	public List<ReportBean> select() {
		
		Query query = this.getSession().createQuery("from ReportBean",ReportBean.class);
		List<ReportBean> list = query.list();
		return list;
	}
	
	public  String selectAll() {
		int i=0;
		JSONArray array;
		List<ReportBean> list = this.getSession().createQuery("from ReportBean",ReportBean.class).getResultList();
		String date = null;
		for(ReportBean report:list){
			 date = sdf.format(report.getReport_date());
		}
		JSONArray array1 = new JSONArray(); 
		while(i<list.size()){
			array = new JSONArray();
			array.add(list.get(i).getReport_id());
			array.add(list.get(i).getCase_id());
			array.add(list.get(i).getReporter());
			array.add(date);
			array.add(list.get(i).getReport_case());
			array1.add(array);
			i++;
		}
		HashMap<Object, Object> map = new HashMap<>();
		map.put("data",array1);
		return JSONValue.toJSONString(map);
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
			bean.setReport_case(select.getReport_case());
			bean.setReport_date(select.getReport_date());
			bean.setReporter(select.getReporter());
			bean.setCase_id(select.getCase_id());
		}
		return bean;
	}

	@Override
	public boolean delete(Integer report_id) {
		ReportBean bean = this.select(report_id);
		if(bean!=null){
			this.getSession().delete(bean);
		return true;
		}
		return false;
	}

}
