package model;

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
			result=biddingDao.insert(bean);
		}
		return result;
	}
	
	public boolean delete(BiddingPk biddingPk){
		if(biddingPk!=null){
			biddingDao.delete(biddingPk);
			return true;
		}
		return false;
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
