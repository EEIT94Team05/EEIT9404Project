package model;

import java.io.Serializable;

import javax.persistence.Embeddable;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.cfg.Configuration;


public class BiddingPk implements Serializable{
//	@Id
//	@ManyToOne
//	@JoinColumn(name="repaircase_Id")
	private Integer repaircase_Id;
//	@Id
//	@OneToOne
//	@JoinColumn(name="com_id")
	private String com_id;
	
	
	
	public Integer getRepaircase_Id() {
		return repaircase_Id;
	}
	public void setRepaircase_Id(Integer repaircase_Id) {
		this.repaircase_Id = repaircase_Id;
	}
	public String getCom_id() {
		return com_id;
	}
	public void setCom_id(String com_id) {
		this.com_id = com_id;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((com_id == null) ? 0 : com_id.hashCode());
		result = prime * result + ((repaircase_Id == null) ? 0 : repaircase_Id.hashCode());
		return result;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		BiddingPk other = (BiddingPk) obj;
		if (com_id == null) {
			if (other.com_id != null)
				return false;
		} else if (!com_id.equals(other.com_id))
			return false;
		if (repaircase_Id == null) {
			if (other.repaircase_Id != null)
				return false;
		} else if (!repaircase_Id.equals(other.repaircase_Id))
			return false;
		return true;
	}
	
//	public static void main(String[] args){
//		 Session session = new Configuration().configure().buildSessionFactory().getCurrentSession();
//		 try {
//			 session.beginTransaction();
//			 
//			 System.out.println(session.get(BiddingPk.class, new BiddingPk().repaircase_Id));
//			 
//			 session.getTransaction().commit();
//		} catch (HibernateException e) {
//			 session.getTransaction().rollback();
//			e.printStackTrace();
//		}finally{
//			 new Configuration().configure().buildSessionFactory().close();
//		}
//		
//	}
	
	
	
	
	
}
