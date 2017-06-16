package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TimeZone;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;

import hibernate.HibernateUtil;
import model.CustomerBean;
import model.RepaircaseBean;
import model.RepaircaseService;
import model.dao.RepaircaseDAO;

@WebServlet(
		urlPatterns={"/map/casesearch.controller"}
)
public class CaseSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private RepaircaseService repaircaseservice;
	
	@Override
	public void init() throws ServletException {
		repaircaseservice = new RepaircaseService(
				new RepaircaseDAO(HibernateUtil.getSessionFactory()));
	}
	
	@Override
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/plain; charset=UTF-8");
		PrintWriter out = response.getWriter();	
		List<RepaircaseBean> result = new ArrayList<RepaircaseBean>();
		RepaircaseBean bean = new RepaircaseBean();
		result = repaircaseservice.select(bean);
		System.out.println(result);
		int i = 0;
		JSONObject obj2;
		JSONArray jsonArray = new JSONArray();
		while(i<result.size()){
			RepaircaseBean data = result.get(i);
			obj2 = new JSONObject();
			obj2.put("repaircase_id", data.getRepaircase_id());
			obj2.put("repaircase_budget", data.getRepaircase_budget());
			obj2.put("repaircase_type", data.getRepaircase_type());
			obj2.put("repaircase_title", data.getRepaircase_title());
			obj2.put("repaircase_area", data.getRepaircase_area());
			obj2.put("repaircase_address", data.getRepaircase_address());
			obj2.put("repaircase_place", data.getRepaircase_place());
			obj2.put("repaircase_repairdate", data.getRepaircase_repairdate());
			obj2.put("repaircase_context", data.getRepaircase_context());
//			obj2.put("repaircase_img1", data.getRepaircase_img1());
//			obj2.put("repaircase_img2", data.getRepaircase_img2());
//			obj2.put("repaircase_img3", data.getRepaircase_img3());
			obj2.put("repaircase_media", data.getRepaircase_media());
			obj2.put("repaircase_createdate", data.getRepaircase_createdate());
			obj2.put("repaircase_status", data.getRepaircase_status());
			obj2.put("repaircase_finday", data.getRepaircase_finday());
			obj2.put("repaircase_score", data.getRepaircase_score());
			obj2.put("companybean", data.getCompanybean());
			jsonArray.put(obj2);
			i++;
		}
		System.out.println(jsonArray);
		out.println(jsonArray.toString());
		

	}
	@Override
	protected void doPost(HttpServletRequest req,
			HttpServletResponse resp) throws ServletException, IOException {
		this.doGet(req, resp);
	}

}
