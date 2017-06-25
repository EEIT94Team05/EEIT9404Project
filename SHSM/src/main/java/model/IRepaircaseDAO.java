package model;

import java.io.InputStream;
import java.sql.Blob;
import java.util.List;

public interface IRepaircaseDAO {
	RepaircaseBean select(Integer id);

	List<RepaircaseBean> select();

	RepaircaseBean insert(RepaircaseBean bean);

	RepaircaseBean update(Integer repaircase_id,
			String repaircase_budget,
			String repaircase_type,
			String repaircase_title,
			String repaircase_area,
			String repaircase_address,
			String repaircase_place,
			java.util.Date repaircase_repairdate,
			String repaircase_context,
			Blob repaircase_img1,
			byte[] repaircase_media,
			
			String repaircase_status,
			java.util.Date repaircase_finday,
			Integer repaircase_score);
	
	RepaircaseBean checkbidding(RepaircaseBean bean);

	boolean delete(Integer id);
}
