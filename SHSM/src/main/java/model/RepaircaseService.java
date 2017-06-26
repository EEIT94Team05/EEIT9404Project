package model;

import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import hibernate.HibernateUtil;
import model.dao.BiddingDAOHibernate;
import model.dao.RepaircaseDAO;

public class RepaircaseService {
	private RepaircaseDAO repaircasedao;
	public RepaircaseService(RepaircaseDAO repaircasedao) {
		this.repaircasedao = repaircasedao;
	}
	
	public List<RepaircaseBean> select(RepaircaseBean bean){
		List<RepaircaseBean> result = null;
		if(bean!=null && bean.getRepaircase_id()!=null){
			RepaircaseBean temp = repaircasedao.select(bean.getRepaircase_id());
			if(temp!=null) {
				result = new ArrayList<RepaircaseBean>();
				result.add(temp);
			}
		}else {
			result = repaircasedao.select(); 
		}
		return result;
	}
	
//	public static void main(String[] args) {
//		
//		try {
//			HibernateUtil.getSessionFactory().getCurrentSession().beginTransaction();
//		
//			RepaircaseService service = new RepaircaseService(
//					new RepaircaseDAO(HibernateUtil.getSessionFactory()));
//			RepaircaseBean a = new RepaircaseBean();
//			List<RepaircaseBean> beans = service.select(a);
//			System.out.println("beans="+beans);		
//		
//			HibernateUtil.getSessionFactory().getCurrentSession().getTransaction().commit();
//			HibernateUtil.getSessionFactory().getCurrentSession().close();
//		} finally {
//			HibernateUtil.closeSessionFactory();
//		}
//	}
	
	public RepaircaseBean insert(RepaircaseBean bean){
		RepaircaseBean result = null;
		if(bean!=null) {
			bean.setRepaircase_createdate(getTime());
			result = repaircasedao.insert(bean);
		}
		return result;
	}
	
	public RepaircaseBean update(RepaircaseBean bean){
		RepaircaseBean result = null;
		if(bean!=null && bean.getRepaircase_id()!=0){
			result = repaircasedao.update(bean.getRepaircase_id(), bean.getRepaircase_budget(), 
										  bean.getRepaircase_type(), bean.getRepaircase_title(), 
										  bean.getRepaircase_area(), bean.getRepaircase_address(), 
										  bean.getRepaircase_place(), bean.getRepaircase_repairdate(), 
										  bean.getRepaircase_context(), bean.getRepaircase_img1(), 
										  bean.getRepaircase_media(), bean.getRepaircase_status(), 
										  bean.getRepaircase_finday(), bean.getRepaircase_score());
		}
		return result;
	}
	
	public boolean delete(RepaircaseBean bean){
		boolean result = false;
		if(bean!=null) {
			result = repaircasedao.delete(bean.getRepaircase_id());
		}
		return result;
	}
	public List<RepaircaseBean> selectComRepaircase(String com_id){
		List<RepaircaseBean> result = new ArrayList<RepaircaseBean>();
		BiddingDAOHibernate bdao = new BiddingDAOHibernate(HibernateUtil.getSessionFactory());
		List<BiddingBean> bean = bdao.selectComRepaircase(com_id);
		int i=0;
		while(i<bean.size()){
			result.add(repaircasedao.select(bean.get(i).getBiddingPk().getRepaircase_Id()));
			i++;
		}
		return result;
	}
	public java.sql.Timestamp getTime(){
		SimpleDateFormat cdformat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		java.sql.Timestamp repaircase_createdate = null;
		String time = cdformat.format(new Date());
		repaircase_createdate = java.sql.Timestamp.valueOf(time);
		return repaircase_createdate;
	}
	
	public RepaircaseBean selectBidding(Integer id){
		RepaircaseBean result = null;
		
		if(id!=null && id!=0){
			result = repaircasedao.select(id);

		}
		return result;
	}
	
	public boolean checkbidding(Integer repaircase_id, String com_id){
		boolean result = false;
		RepaircaseBean bean = repaircasedao.select(repaircase_id);
		if(bean!=null && bean.getRepaircase_status().equals("招標中")){
			bean.setCom_id(com_id);
			bean.setRepaircase_status("處理中");
			RepaircaseBean rebean = repaircasedao.checkbidding(bean);
			
				result = true;
			
		}
		return result;
	}
	
	public boolean CusFincase(Integer repaircase_id, Integer repaircase_score){
		if(repaircase_id!=null && repaircase_score!=null){
			RepaircaseBean bean = repaircasedao.select(repaircase_id);
			if(bean!=null){
				bean.setRepaircase_score(repaircase_score);
				RepaircaseBean result = repaircasedao.update(
						bean.getRepaircase_id(), 
						bean.getRepaircase_budget(), 
						bean.getRepaircase_type(), 
						bean.getRepaircase_title(), 
						bean.getRepaircase_area(), 
						bean.getRepaircase_address(), 
						bean.getRepaircase_place(), 
						bean.getRepaircase_repairdate(), 
						bean.getRepaircase_context(), 
						bean.getRepaircase_img1(), 
						bean.getRepaircase_media(), 
						bean.getRepaircase_status(), 
						bean.getRepaircase_finday(), 
						bean.getRepaircase_score());
				if(result.getRepaircase_score().equals(bean.getRepaircase_score())){
					return true;
				}
			}
			
		}
		return false;
	}
}
