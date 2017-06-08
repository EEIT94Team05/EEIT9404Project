package model;

import java.util.ArrayList;
import java.util.List;

public class RepaircaseService {
	IRepaircaseDAO repaircasedao;
	public RepaircaseService(IRepaircaseDAO repaircasedao) {
		this.repaircasedao = repaircasedao;
	}
	
	public List<RepaircaseBean> select(RepaircaseBean bean){
		List<RepaircaseBean> result = null;
		if(bean!=null && bean.getRepaircase_id()!=0){
			RepaircaseBean temp = repaircasedao.select(bean.getRepaircase_id());
			if(temp!=null) {
				result = new ArrayList<RepaircaseBean>();
				result.add(temp);
			}
		}
		return result;
	}
	
	public RepaircaseBean insert(RepaircaseBean bean){
		RepaircaseBean result = null;
		if(bean!=null) {
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
										  bean.getRepaircase_img2(), bean.getRepaircase_img3(), 
										  bean.getRepaircase_media(), bean.getRepaircase_status(), 
										  bean.getRepaircase_finday(), bean.getRepaircase_score(), bean.getCompanybean());
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
}
