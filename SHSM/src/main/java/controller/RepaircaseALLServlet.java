package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Blob;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;
import org.json.simple.JSONValue;

import hibernate.HibernateUtil;
import model.RepaircaseBean;
import model.dao.RepaircaseDAO;


@WebServlet("/casepage/RepaircaseALLServlet")
public class RepaircaseALLServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private RepaircaseDAO repaircaseDao;
    private SimpleDateFormat sdf;
    public RepaircaseALLServlet() {
    }

	@Override
	public void init() throws ServletException {
		repaircaseDao=new RepaircaseDAO(HibernateUtil.getSessionFactory());
		sdf = new SimpleDateFormat("yyyy-MM-dd");
	}


	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
			request.setCharacterEncoding("UTF-8");
			response.setContentType("text/plain;charset=UTF-8");
			PrintWriter out = response.getWriter();
			String temp1 = request.getParameter("repaircase_id");
			
			int repaircase_id=0;
			try {
				repaircase_id=Integer.parseInt(temp1);
			} catch (NumberFormatException e) {
				e.printStackTrace();
			}
			
			RepaircaseBean bean = repaircaseDao.select(repaircase_id);
			
			JSONObject jsonObj=null;
			String date=null;
			if(bean!=null){
			date = sdf.format(bean.getRepaircase_repairdate());
			jsonObj = new JSONObject();
				jsonObj.put("repaircase_id", bean.getRepaircase_id());
				jsonObj.put("repaircase_type", bean.getRepaircase_type());
				jsonObj.put("repaircase_budget", bean.getRepaircase_budget());
				jsonObj.put("repaircase_title", bean.getRepaircase_title());
				jsonObj.put("repaircase_address", bean.getRepaircase_address());
				jsonObj.put("repaircase_place", bean.getRepaircase_place());
				jsonObj.put("repaircase_repairdate", bean.getRepaircase_repairdate());
				jsonObj.put("repaircase_context", bean.getRepaircase_context());
				
			}
			out.println(jsonObj);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
