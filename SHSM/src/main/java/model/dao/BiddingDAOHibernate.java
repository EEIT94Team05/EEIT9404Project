package model.dao;

import java.util.List;

import org.hibernate.SessionFactory;

import model.BiddingBean;
import model.BiddingDAO;
import model.BiddingPk;

public class BiddingDAOHibernate implements BiddingDAO {
	private SessionFactory sessionFactory;
	
	@Override
	public BiddingBean select(BiddingPk biddingPk) {
		return null;
	}

	@Override
	public List<BiddingBean> select() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public BiddingBean insert(BiddingBean bean) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public BiddingBean update(BiddingBean bean) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean delete(BiddingPk biddingPk) {
		// TODO Auto-generated method stub
		return false;
	}

}
