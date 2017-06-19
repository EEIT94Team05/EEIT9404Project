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
		urlPatterns={"/selectbidding.controller"}
)
public class CaseDetailServlet extends HttpServlet {
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
		//接收資料
		String id = request.getParameter("a");
		//驗證資料
		//轉換資料
		Integer repaircase_id = 0;
		if (id!=null && id.length()!=0) {
			try {
				repaircase_id = Integer.parseInt(id);
			} catch (NumberFormatException e) {
				e.printStackTrace();
				
			}
		}
		//呼叫Model
		//根據Model執行結果呼叫View
		RepaircaseBean result = repaircaseservice.selectBidding(repaircase_id);
		if(result==null) {
			System.out.println("NO");
		} else {
			request.setAttribute("selectBidding", result);
		}
		request.getRequestDispatcher(
				"/NewFile.jsp").forward(request, response);
	}
	@Override
	protected void doPost(HttpServletRequest req,
			HttpServletResponse resp) throws ServletException, IOException {
		this.doGet(req, resp);
	}

}
