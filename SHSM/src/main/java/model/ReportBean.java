package model;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import model.dao.ReportDAOHibernate;

@Entity
@Table(name="report")
public class ReportBean implements Serializable{
	@Id
	private String report_id;
	private String report_case;
	private java.util.Date report_date;
	private String reporter;
	private String case_id;
	
	public static void main(String[] args){
		Configuration config = new Configuration().configure();
		SessionFactory sessionFactory = config.buildSessionFactory();
		Session session = sessionFactory.getCurrentSession();
		try {
			session.beginTransaction();
			
//			ReportBean bean = session.get(ReportBean.class, "1");
//			System.out.println(bean);
			
//			ReportBean insert = new ReportBean();
//			insert.setReport_id("2");
//			insert.setReport_case("根本沒修好");
//			insert.setReport_date(new java.util.Date());
//			insert.setReporter("洪韌康");
//			insert.setCase_id("2");
//			session.save(insert);
			
			
			ReportDAOHibernate reportDao = new ReportDAOHibernate(sessionFactory);
			List<ReportBean> reportBean = reportDao.select();
			System.out.println(reportBean);
			
//			ReportBean select = reportDao.select("2");
//			ReportBean update = reportDao.update(select);
//			update.setReport_case("到底在修什麼東西");
//			update.setReport_date(new java.util.Date());
//			update.setReporter("陳韋嘉");
//			update.setCase_id("3");
			
//			boolean delete = reportDao.delete("2");
//			System.out.println(delete);
			
			
			session.getTransaction().commit();
		} catch (Exception e) {
			session.getTransaction().rollback();
		}
		
	}
	
	
	@Override
	public String toString() {
		return "ReportBean [report_id=" + report_id + ", report_case=" + report_case + ", report_date=" + report_date
				+ ", reporter=" + reporter + ", case_id=" + case_id + "]"+"\n";
	}
	public String getReport_id() {
		return report_id;
	}
	public void setReport_id(String report_id) {
		this.report_id = report_id;
	}
	
	public String getReport_case() {
		return report_case;
	}
	public void setReport_case(String report_case) {
		this.report_case = report_case;
	}
	public java.util.Date getReport_date() {
		return report_date;
	}
	public void setReport_date(java.util.Date report_date) {
		this.report_date = report_date;
	}
	public String getReporter() {
		return reporter;
	}
	public void setReporter(String reporter) {
		this.reporter = reporter;
	}
	public String getCase_id() {
		return case_id;
	}
	public void setCase_id(String case_id) {
		this.case_id = case_id;
	}
	
	
	
	
}
