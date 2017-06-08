package model;

import java.util.List;

public interface ReportDAO {
//	private String report_id;
//	private String report_cause;
//	private java.util.Date report_date;
//	private String reporter;
//	private String case_id;
	ReportBean select(Integer report_id);
	List<ReportBean> select();
	ReportBean insert(ReportBean bean);
	ReportBean update(ReportBean bean);
	boolean delete(Integer report_id);
	
}
