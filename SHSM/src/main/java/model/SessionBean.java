package model;

import java.io.Serializable;
import java.util.Arrays;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

@Entity
@Table(name="session")
public class SessionBean implements Serializable{
	@Id
	private String session_id;
	private java.util.Date session_date;
	private byte[] session_img;
	private String session_context;
	@ManyToOne
	@JoinColumn(name="cus_id")
	private CustomerBean customerBean;
	@ManyToOne
	@JoinColumn(name="com_id")
	private CompanyBean companyBean;
	
	public static void main(String[] args){
		Configuration config = new Configuration().configure();
		SessionFactory sessionFactory = config.buildSessionFactory();
		Session session = sessionFactory.getCurrentSession();
		
		try {
			session.beginTransaction();
			
			SessionBean sessionBean = new SessionBean();
						
			sessionBean.setSession_id("1");
			sessionBean.setSession_date(new java.util.Date());
			sessionBean.setSession_img(null);
			sessionBean.setSession_context("安安,你好,幾歲,給虧嗎?");
			
			sessionBean.setCompanyBean(session.get(CompanyBean.class, "eeit9450"));
			sessionBean.setCustomerBean(session.get(CustomerBean.class, "eeit9410"));
			
			session.save(sessionBean);
	
			session.getTransaction().commit();
		} catch (Exception e) {
			session.getTransaction().rollback();
		}finally{
			sessionFactory.close();
		}
					
	}

	@Override
	public String toString() {
		return "SessionBean [session_id=" + session_id + ", session_date=" + session_date + ", session_img="
				+ Arrays.toString(session_img) + ", session_context=" + session_context + ", CustomerBean="
				+ customerBean + ", com_id=" + companyBean + "]"+"\n";
	}

	public CustomerBean getCustomerBean() {
		return customerBean;
	}

	public void setCustomerBean(CustomerBean customerBean) {
		this.customerBean = customerBean;
	}

	public CompanyBean getCom_id() {
		return companyBean;
	}

	public void setCompanyBean(CompanyBean companyBean) {
		this.companyBean = companyBean;
	}

	public String getSession_id() {
		return session_id;
	}

	public void setSession_id(String session_id) {
		this.session_id = session_id;
	}

	public java.util.Date getSession_date() {
		return session_date;
	}

	public void setSession_date(java.util.Date session_date) {
		this.session_date = session_date;
	}

	public byte[] getSession_img() {
		return session_img;
	}

	public void setSession_img(byte[] session_img) {
		this.session_img = session_img;
	}

	public String getSession_context() {
		return session_context;
	}

	public void setSession_context(String session_context) {
		this.session_context = session_context;
	}
	
	
}
