package model;

import java.io.Serializable;

import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
@Entity
@IdClass(BiddingPk.class)
@Table(name="bidding")
public class BiddingBean implements Serializable{
	@Id
	private BiddingPk biddingPk;
	
	private String bidding_amount;
	private java.sql.Timestamp bidding_date;
	private String bidding_context;
	private byte[] bidding_img;
	
//	@EmbeddedId
	public BiddingPk getBiddingPk() {
		return biddingPk;
	}
	public void setBiddingPk(BiddingPk biddingPk) {
		this.biddingPk = biddingPk;
	}
	public String getBidding_amount() {
		return bidding_amount;
	}
	public void setBidding_amount(String bidding_amount) {
		this.bidding_amount = bidding_amount;
	}
	public java.sql.Timestamp getBidding_date() {
		return bidding_date;
	}
	public void setBidding_date(java.sql.Timestamp bidding_date) {
		this.bidding_date = bidding_date;
	}
	public String getBidding_context() {
		return bidding_context;
	}
	public void setBidding_context(String bidding_context) {
		this.bidding_context = bidding_context;
	}
	public byte[] getBidding_img() {
		return bidding_img;
	}
	public void setBidding_img(byte[] bidding_img) {
		this.bidding_img = bidding_img;
	}
	
	public static void main(String[] args){
		Configuration config = new Configuration().configure();
		SessionFactory sessionFactory = config.buildSessionFactory();
		Session session = sessionFactory.getCurrentSession();
		
		try {
			session.beginTransaction();
			
			BiddingBean bb = new BiddingBean();
			BiddingBean select = session.get(BiddingBean.class, bb);
			System.out.println("select=" + select);

			session.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
		}finally{
			sessionFactory.close();
		}
	}
	
	
	
}
