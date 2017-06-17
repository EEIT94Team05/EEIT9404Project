package model.dao;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import model.CustomerBean;
import model.IRepaircaseDAO;
import model.RepaircaseBean;

public class RepaircaseDAO implements IRepaircaseDAO {
	private SessionFactory sessionFactory;
	public RepaircaseDAO(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	

//	public static void main(String[] args) {
//		Configuration config = new Configuration().configure("hibernate.cfg.xml");
//		SessionFactory sf = config.buildSessionFactory();
//		try {
//			sf.getCurrentSession().beginTransaction();
//			IRepaircaseDAO productDao = new RepaircaseDAO(sf);
//
//			
//			RepaircaseBean selects = productDao.select(1);
////			List<RepaircaseBean> selects = productDao.select();
//			System.out.println("selects="+selects);
//			
////			SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
////			java.util.Date date1 =  new Date();
////			java.util.Date date = null;
////			SimpleDateFormat sdFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
////			String time = sdFormat.format(new Date());
////			System.out.println(time);
////			java.sql.Timestamp nowdate = java.sql.Timestamp.valueOf(time);
////			try {
////				date = sdf.parse("2017.8.15");
////			} catch (ParseException e) {
////				// TODO Auto-generated catch block
////				e.printStackTrace();
////			}
////			CustomerBean a = sf.getCurrentSession().get(CustomerBean.class, "eeit9410");
////			RepaircaseBean bean = new RepaircaseBean();
////			bean.setRepaircase_budget("100");
////			bean.setRepaircase_type("水電維修");
////			bean.setRepaircase_title("水電師傅 須懂");
////			bean.setRepaircase_area("中正區");
////			bean.setRepaircase_address("台北市中正區林森南路");
////			bean.setRepaircase_place("須定期至指定公司");
////			bean.setRepaircase_repairdate(date);
////			bean.setRepaircase_context("123");
////			bean.setRepaircase_createdate(nowdate);
////			bean.setRepaircase_status("未處理");
////			bean.setRepaircase_score(3);
////			bean.setCustomerbean(a);
////			System.out.println(productDao.insert(bean));
////			
////			RepaircaseBean selects = productDao.select(8);
////			productDao.update(selects.getRepaircase_id(), "1000", "水電維修", "水電師傅 須懂", "中正區", "台北市中正區林森南路", "須定期至指定公司", date, "22354s67", null, null, null, null,  "未處理", null, 2);
////			productDao.delete(8);
//			
//			sf.getCurrentSession().getTransaction().commit();
//			sf.getCurrentSession().close();
//		} finally {
//			sf.close();
//		}
//	}
	
	@Override
	public RepaircaseBean select(Integer id) {
		return getSession().get(RepaircaseBean.class, id);
	}

	@Override
	public List<RepaircaseBean> select() {
		return this.getSession().createQuery("FROM RepaircaseBean", RepaircaseBean.class).getResultList();
	}

	@Override
	public RepaircaseBean insert(RepaircaseBean bean) {
		
		if(bean!=null) {
				this.getSession().save(bean);
				return bean;
		}
		return null;
		
	}

	@Override
	public RepaircaseBean update(Integer repaircase_id, String repaircase_budget, String repaircase_type,
			String repaircase_title, String repaircase_area, String repaircase_address, String repaircase_place,
			Date repaircase_repairdate, String repaircase_context, byte[] repaircase_img1,	byte[] repaircase_img2,
			byte[] repaircase_img3, byte[] repaircase_media, String repaircase_status, Date repaircase_finday, Integer repaircase_score) {
		
		RepaircaseBean bean = this.select(repaircase_id);
		if(bean!=null) {
			bean.setRepaircase_budget(repaircase_budget); 
			bean.setRepaircase_type(repaircase_type);
			bean.setRepaircase_title(repaircase_title); 
			bean.setRepaircase_area(repaircase_area); 
			bean.setRepaircase_address(repaircase_address); 
			bean.setRepaircase_place(repaircase_place);
			bean.setRepaircase_repairdate(repaircase_repairdate);
			bean.setRepaircase_context(repaircase_context);
			bean.setRepaircase_img1(repaircase_img1); 
			bean.setRepaircase_img2(repaircase_img2); 
			bean.setRepaircase_img3(repaircase_img3); 
			bean.setRepaircase_media(repaircase_media);
			
			bean.setRepaircase_status(repaircase_status); 
			bean.setRepaircase_finday(repaircase_finday); 
			bean.setRepaircase_score(repaircase_score);
		}
		return bean;
	}
	
	
	@Override
	public boolean delete(Integer id) {
		RepaircaseBean bean = this.select(id);
		if(bean!=null) {
			this.getSession().delete(bean);
			return true;
		}
		return false;
	}

}
