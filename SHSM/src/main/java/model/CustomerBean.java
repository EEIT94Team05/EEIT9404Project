package model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

@Entity
@Table(name="customer")
public class CustomerBean implements Serializable{
	@Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name="cus_id")
	private String cus_id;
	private String cus_password;
	private String cus_name;
	private String cus_address;
	private String cus_phone;
	private java.sql.Timestamp cus_regist;
	private String cus_email;
	private String sex;
//	@OneToMany
//	@Column(name="repaircase_id")
//	private List<RepaircaseBean> repaircasebean = new ArrayList<RepaircaseBean>();
//	
	public static void main(String[] args) {
		Configuration config = new Configuration().configure("hibernate.cfg.xml");
		SessionFactory sf = config.buildSessionFactory();
		try {
			sf.getCurrentSession().beginTransaction();
			Session session = sf.getCurrentSession();
			
//			CustomerBean select = session.get(CustomerBean.class, "eeit9410");
//			System.out.println("select=" + select);
			
//			CustomerBean insert = new CustomerBean();
//			insert.setCustid("Alex");
//			insert.setPassword("xxx".getBytes());
//			insert.setBirth(new java.util.Date());
//			insert.setEmail("alex@iii.org.tw");
//			session.save(insert);
			
			sf.getCurrentSession().getTransaction().commit();
			sf.getCurrentSession().close();
		} finally {
			sf.close();;
		}
	}

	@Override
	public String toString() {
		return "cus_id=" + cus_id + ", cus_password=" + cus_password + ", cus_name=" + cus_name
				+ ", cus_address=" + cus_address + ", cus_phone=" + cus_phone + ", cus_regist=" + cus_regist
				+ ", cus_email=" + cus_email + ", sex=" + sex;
	}

	public String getCus_id() {
		return cus_id;
	}

	public void setCus_id(String cus_id) {
		this.cus_id = cus_id;
	}

	public String getCus_password() {
		return cus_password;
	}

	public void setCus_password(String cus_password) {
		this.cus_password = cus_password;
	}

	public String getCus_name() {
		return cus_name;
	}

	public void setCus_name(String cus_name) {
		this.cus_name = cus_name;
	}

	public String getCus_address() {
		return cus_address;
	}

	public void setCus_address(String cus_address) {
		this.cus_address = cus_address;
	}

	public String getCus_phone() {
		return cus_phone;
	}

	public void setCus_phone(String cus_phone) {
		this.cus_phone = cus_phone;
	}

	public java.sql.Timestamp getCus_regist() {
		return cus_regist;
	}

	public void setCus_regist(java.sql.Timestamp cus_regist) {
		this.cus_regist = cus_regist;
	}

	public String getCus_email() {
		return cus_email;
	}

	public void setCus_email(String cus_email) {
		this.cus_email = cus_email;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

//	public List<RepaircaseBean> getRepaircasebean() {
//		return repaircasebean;
//	}
//
//	public void setRepaircasebean(List<RepaircaseBean> repaircasebean) {
//		this.repaircasebean = repaircasebean;
//	}

	
	

}
