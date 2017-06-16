package model.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

import model.BiddingBean;
import model.BiddingDAO;
import model.BiddingPk;

public class BiddingDAOHibernate implements BiddingDAO {
	private SessionFactory sessionFactory;
	public BiddingDAOHibernate(SessionFactory sessionFactory){
		this.sessionFactory=sessionFactory;
	}
	public Session getSession(){
		return sessionFactory.getCurrentSession();
	}
	@Override
	public BiddingBean select(BiddingPk biddingPk) {
		return this.getSession().get(BiddingBean.class,biddingPk);
	}

	@Override
	public List<BiddingBean> select() {
		Query query = this.getSession().createQuery("from BiddingBean",BiddingBean.class);
		List<BiddingBean> list = query.list();
		return list;
	}

	@Override
	public BiddingBean insert(BiddingBean bean) {
		if(bean!=null){
			BiddingBean select = this.select(bean.getBiddingPk());
			if(select==null){
				this.getSession().save(bean);
				return bean;
			}
		}
		return null;
	}

	@Override
	public BiddingBean update(BiddingBean bean) {
		if(bean!=null){
			BiddingBean select = this.select(bean.getBiddingPk());
			if(select!=null){
				bean.setBidding_amount(select.getBidding_amount()); 
				bean.setBidding_date(select.getBidding_date());
				bean.setBidding_context(select.getBidding_context());
				bean.setBidding_img(select.getBidding_img());
			}
		}
		return null;
	}

	@Override
	public boolean delete(BiddingPk biddingPk) {
		BiddingBean bean = this.select(biddingPk);
		if(bean!=null){
			this.getSession().delete(bean);
			return true;
		}
		return false;
	}

}
