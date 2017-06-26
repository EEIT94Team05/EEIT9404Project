 package model;

import java.io.Serializable;
import java.sql.Blob;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

@Entity
@Table(name="company")
public class CompanyBean implements Serializable{
	@Id
//  @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name="com_id")
	private String com_id;
	private String com_password;
	private String com_name;
	private String com_address;
	private String com_phone;
	private String com_email;
	private String com_intr;
	private Blob com_img;
	private String com_contact;
	private String fax;
	private java.sql.Timestamp com_regist;
	@OneToMany
	@JoinColumn(name="com_id")
	private List<BiddingBean> biddingBean = new ArrayList<BiddingBean>();
	
	public static void main(String[] args) {
	Configuration config = new Configuration().configure("hibernate.cfg.xml");
	SessionFactory sf = config.buildSessionFactory();
	try {
		sf.getCurrentSession().beginTransaction();
		Session session = sf.getCurrentSession();
		
		CompanyBean select = session.get(CompanyBean.class, "eeit9458");
		System.out.println("select=" + select.getCom_id() + ", " +
									   select.getCom_name() + ", " +
									   select.getCom_contact() + ", " +
									   select.biddingBean);
		
//		CustomerBean insert = new CustomerBean();
//		insert.setCustid("Alex");
//		insert.setPassword("xxx".getBytes());
//		insert.setBirth(new java.util.Date());
//		insert.setEmail("alex@iii.org.tw");
//		session.save(insert);
		
			sf.getCurrentSession().getTransaction().commit();
			sf.getCurrentSession().close();
		} finally {
			sf.close();;
		}
  }
	
	@Override
	public String toString() {
		return "CompanyBean ["+ com_id+", "+com_password+", "+ com_name + biddingBean + "]";
	}
	public String getCom_id() {
		return com_id;
	}
	public void setCom_id(String com_id) {
		this.com_id = com_id;
	}
	public String getCom_password() {
		return com_password;
	}
	public void setCom_password(String com_password) {
		this.com_password = com_password;
	}
	public String getCom_name() {
		return com_name;
	}
	public void setCom_name(String com_name) {
		this.com_name = com_name;
	}
	public String getCom_address() {
		return com_address;
	}
	public void setCom_address(String com_address) {
		this.com_address = com_address;
	}
	public String getCom_phone() {
		return com_phone;
	}
	public void setCom_phone(String com_phone) {
		this.com_phone = com_phone;
	}
	public String getCom_email() {
		return com_email;
	}
	public void setCom_email(String com_email) {
		this.com_email = com_email;
	}
	public String getCom_intr() {
		return com_intr;
	}
	public void setCom_intr(String com_intr) {
		this.com_intr = com_intr;
	}
	public Blob getCom_img() {
		return com_img;
	}
	public void setCom_img(Blob com_img) {
		this.com_img = com_img;
	}
	public String getCom_contact() {
		return com_contact;
	}
	public void setCom_contact(String com_contact) {
		this.com_contact = com_contact;
	}
	public String getFax() {
		return fax;
	}
	public void setFax(String fax) {
		this.fax = fax;
	}
	public List<BiddingBean> getCompanybean() {
		return biddingBean;
	}
	public void setCompanybean(List<BiddingBean> biddingBean) {
		this.biddingBean = biddingBean;
	}

	public java.sql.Timestamp getCom_regist() {
		return com_regist;
	}

	public void setCom_regist(java.sql.Timestamp com_regist) {
		this.com_regist = com_regist;
	}
	
	
}
