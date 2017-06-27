package controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Blob;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.hibernate.Hibernate;
import org.json.simple.JSONArray;
import org.json.simple.JSONValue;

import hibernate.HibernateUtil;
import model.CustomerBean;
import model.RepaircaseBean;
import model.RepaircaseService;
import model.ReportBean;
import model.dao.CustomerDAO;
import model.dao.RepaircaseDAO;


@WebServlet(
		urlPatterns={"/casepage/CusCaseSearchServlet.controller"}
)
public class CusCaseSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	private RepaircaseDAO repaircaseDAO;
	
	@Override
	public void init() throws ServletException {
		repaircaseDAO = new RepaircaseDAO(HibernateUtil.getSessionFactory());
	}
	
	@Override
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/plain; charset=UTF-8");
		HttpSession session = request.getSession(false);
		
	
//接收資料
		
//驗證資料
		Map<String, String> errors = new HashMap<String, String>();
		request.setAttribute("errors", errors);
		
//轉換資料
		CustomerBean bean = (CustomerBean)session.getAttribute("custuser");
		
//呼叫Model
		System.out.println(bean.getCus_id());
//根據Model執行結果呼叫View
		List<RepaircaseBean> result = repaircaseDAO.selectUserRepaircase(bean.getCus_id());
		if(result==null) {
			errors.put("action", "Insert失敗");
		} else {
//			request.setAttribute("cuscasebean", result);
			JSONArray array;
			String createdate = null,repairdate = null, findate = null;
			for(RepaircaseBean repaircase:result){
				createdate = sdf.format(repaircase.getRepaircase_createdate());
				repairdate = sdf.format(repaircase.getRepaircase_repairdate());
				if(repaircase.getRepaircase_finday()!=null){
					findate = sdf.format(repaircase.getRepaircase_finday());
				}
				
			}
			JSONArray array1 = new JSONArray();
			int i=0;
			while(i<result.size()){
				array = new JSONArray();
				array.add(result.get(i).getRepaircase_title()); 
				array.add(result.get(i).getRepaircase_type());
				array.add(repairdate);
				array.add(result.get(i).getRepaircase_budget()); 
				array.add(result.get(i).getRepaircase_address()); 
				array.add(result.get(i).getRepaircase_place());
//				array.add(result.get(i).getRepaircase_context());
//				array.add(result.get(i).getRepaircase_img1()); 
//				array.add(result.get(i).getRepaircase_media());
				array.add(result.get(i).getRepaircase_status());
				array.add(createdate);
				array.add(findate); 
				array.add(result.get(i).getRepaircase_score());
				array.add(result.get(i).getRepaircase_id());
				array1.add(array);
				i++;
			}
			HashMap<Object, Object> map = new HashMap<>();
			map.put("data",array1);
			PrintWriter out = response.getWriter();
			System.out.println(JSONValue.toJSONString(map));
			out.write(JSONValue.toJSONString(map));
		}
		
	}
	@Override
	protected void doPost(HttpServletRequest req,
			HttpServletResponse resp) throws ServletException, IOException {
		this.doGet(req, resp);
	}

}
