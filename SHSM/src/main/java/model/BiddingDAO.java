package model;

import java.util.List;

public interface BiddingDAO {
	BiddingBean select(BiddingPk biddingPk);
	List<BiddingBean> select();
	BiddingBean insert(BiddingBean bean);
	BiddingBean update(BiddingBean bean);
	boolean delete(BiddingPk biddingPk);
}
