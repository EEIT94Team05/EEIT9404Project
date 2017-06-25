package model;

import java.io.InputStream;
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
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

@Entity
@Table(name="RepairCase")
public class RepaircaseBean implements Serializable{
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)  
	@Column(name="repaircase_id")
	private Integer repaircase_id;
	private String repaircase_budget;
	private String repaircase_type;
	private String repaircase_title;
	private String repaircase_area;
	private String repaircase_address;
	private String repaircase_place;
	private java.util.Date repaircase_repairdate;
	private String repaircase_context;
	private Blob repaircase_img1;
	private byte[] repaircase_media;
	private java.sql.Timestamp repaircase_createdate;
	private String repaircase_status;
	private java.util.Date repaircase_finday;
	private Integer repaircase_score;
	@ManyToOne
	@JoinColumn(name="cus_id")
	private CustomerBean customerbean;
	@OneToMany
	@JoinColumn(name="repaircase_id")
	private List<BiddingBean> biddingBean = new ArrayList<BiddingBean>();
//	@ManyToOne
//	@JoinColumn(name="com_id")
	private String com_id;
	
	
	public static void main(String[] args) {
		Configuration config = new Configuration().configure("hibernate.cfg.xml");
		SessionFactory sf = config.buildSessionFactory();
		try {
			sf.getCurrentSession().beginTransaction();
			Session session = sf.getCurrentSession();
			
			RepaircaseBean select = session.get(RepaircaseBean.class, 1);
			System.out.println("select=" + select.repaircase_id + ", " + 
										   select.repaircase_budget + ", " +
										   select.repaircase_type + ", " +
										   select.repaircase_title + ", " +
										   select.repaircase_area + ", " +
										   select.repaircase_address + ", " +
										   select.repaircase_place + ", " +
										   select.repaircase_repairdate + ", " +
										   select.repaircase_context + ", " +
										   select.repaircase_img1 + ", " +
//										   select.repaircase_img2 + ", " +
//										   select.repaircase_img3 + ", " +
										   select.repaircase_media + ", " +
										   select.repaircase_createdate + ", " +
										   select.repaircase_status + ", " +
										   select.repaircase_finday + ", " +
										   select.repaircase_score + ", " +
										   select.customerbean + ", "  +
										   select.biddingBean
										   );
			
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
		return "RepaircaseBean ["+ repaircase_id+", "+repaircase_type+", "+ repaircase_budget + repaircase_title + ", " +
				    repaircase_area + ", " +  repaircase_address + ", " + repaircase_place + ", " + repaircase_repairdate + ", " +
				    repaircase_context + ", " + repaircase_img1 + ", " + repaircase_media + ", " + repaircase_createdate + ", " + repaircase_status + ", " + repaircase_finday + ", " +
				    repaircase_score + ", " + customerbean + ", "  + biddingBean + "]"; }

	public Integer getRepaircase_id() {
		return repaircase_id;
	}

	public void setRepaircase_id(Integer repaircase_id) {
		this.repaircase_id = repaircase_id;
	}

	public String getRepaircase_budget() {
		return repaircase_budget;
	}

	public void setRepaircase_budget(String repaircase_budget) {
		this.repaircase_budget = repaircase_budget;
	}

	public String getRepaircase_type() {
		return repaircase_type;
	}

	public void setRepaircase_type(String repaircase_type) {
		this.repaircase_type = repaircase_type;
	}

	public String getRepaircase_title() {
		return repaircase_title;
	}

	public void setRepaircase_title(String repaircase_title) {
		this.repaircase_title = repaircase_title;
	}

	public String getRepaircase_area() {
		return repaircase_area;
	}

	public void setRepaircase_area(String repaircase_area) {
		this.repaircase_area = repaircase_area;
	}

	public String getRepaircase_address() {
		return repaircase_address;
	}

	public void setRepaircase_address(String repaircase_address) {
		this.repaircase_address = repaircase_address;
	}

	public String getRepaircase_place() {
		return repaircase_place;
	}

	public void setRepaircase_place(String repaircase_place) {
		this.repaircase_place = repaircase_place;
	}

	public java.util.Date getRepaircase_repairdate() {
		return repaircase_repairdate;
	}

	public void setRepaircase_repairdate(java.util.Date repaircase_repairdate) {
		this.repaircase_repairdate = repaircase_repairdate;
	}

	public String getRepaircase_context() {
		return repaircase_context;
	}

	public void setRepaircase_context(String repaircase_context) {
		this.repaircase_context = repaircase_context;
	}

	public Blob getRepaircase_img1() {
		return repaircase_img1;
	}

	public void setRepaircase_img1(Blob repaircase_img1) {
		this.repaircase_img1 = repaircase_img1;
	}


	public byte[] getRepaircase_media() {
		return repaircase_media;
	}

	public void setRepaircase_media(byte[] repaircase_media) {
		this.repaircase_media = repaircase_media;
	}

	public java.sql.Timestamp getRepaircase_createdate() {
		return repaircase_createdate;
	}

	public void setRepaircase_createdate(java.sql.Timestamp repaircase_createdate) {
		this.repaircase_createdate = repaircase_createdate;
	}

	public String getRepaircase_status() {
		return repaircase_status;
	}

	public void setRepaircase_status(String repaircase_status) {
		this.repaircase_status = repaircase_status;
	}

	public java.util.Date getRepaircase_finday() {
		return repaircase_finday;
	}

	public void setRepaircase_finday(java.util.Date repaircase_finday) {
		this.repaircase_finday = repaircase_finday;
	}

	public Integer getRepaircase_score() {
		return repaircase_score;
	}

	public void setRepaircase_score(Integer repaircase_score) {
		this.repaircase_score = repaircase_score;
	}
	
	
	public CustomerBean getCustomerbean() {
		return customerbean;
	}
	public void setCustomerbean(CustomerBean customerbean) {
		this.customerbean = customerbean;
	}


	public List<BiddingBean> getBiddingBean() {
		return biddingBean;
	}


	public void setBiddingBean(List<BiddingBean> biddingBean) {
		this.biddingBean = biddingBean;
	}


	public String getCom_id() {
		return com_id;
	}


	public void setCom_id(String com_id) {
		this.com_id = com_id;
	}



	
//	public String getCompanybean() {
//		return companybean;
//	}
//
//
//	public void setCompanybean(String companybean) {
//		this.companybean = companybean;
//	}

	
	
}
