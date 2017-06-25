package model;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import model.dao.BiddingDAOHibernate;

public class BiddingService {
	private BiddingDAO biddingDao;
	public BiddingService(BiddingDAO biddingDao){
		this.biddingDao=biddingDao;
	}
	
	public BiddingBean select(BiddingPk biddingPk){
		if(biddingPk!=null && biddingPk.getCom_id()!=null && biddingPk.getRepaircase_Id()!=null){
			BiddingBean select = biddingDao.select(biddingPk);
			if(select!=null){
				return select;
			}
		}
		return null;
	}
	public BiddingBean insert(BiddingBean bean){
		BiddingBean result=null;
		if(bean!=null){
			bean.setBidding_date(getTime());
			result=biddingDao.insert(bean);
		}
		return result;
	}
	public boolean returnInsertStatus(BiddingBean bean){
		BiddingBean data = biddingDao.select(bean.getBiddingPk());
		if(data==null){
			bean.setBidding_date(getTime());
			if(bean.getBidding_context()!=null && bean.getBidding_amount()!=null){
				biddingDao.insert(bean);
				return true;
			}
			
		}
		return false;
	}

	public boolean delete(BiddingPk biddingPk){
		if(biddingPk!=null){
			biddingDao.delete(biddingPk);
			return true;
		}
		return false;
	}
	
	public java.sql.Timestamp getTime(){
		SimpleDateFormat cdformat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		java.sql.Timestamp date = null;
		String time = cdformat.format(new Date());
		date = java.sql.Timestamp.valueOf(time);
		return date;
	}
	public static void main(String[] args){
		Configuration config = new Configuration().configure();
		SessionFactory sessionFactory = config.buildSessionFactory();
		Session session = sessionFactory.getCurrentSession();
		BiddingPk biddingPk=new BiddingPk();
		try {
			session.beginTransaction();
		
			BiddingService biddingService = new BiddingService(new BiddingDAOHibernate(sessionFactory));
			
			
			biddingPk.setRepaircase_Id(1);
			biddingPk.setCom_id("eeit9454");
			boolean select = biddingService.delete(biddingPk);
			//BiddingBean select = biddingService.select(biddingPk);
			System.out.println(select);
			
			session.getTransaction().commit();
		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();
		}finally{
			sessionFactory.close();
		}
				
	}
}
