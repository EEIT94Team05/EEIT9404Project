package controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import hibernate.HibernateUtil;
import model.CustomerBean;
import model.RepaircaseBean;
import model.RepaircaseService;
import model.dao.RepaircaseDAO;

@WebServlet(
		urlPatterns={"/casepage/CusFinCaseServlet.controller"}
)
public class CusFinCaseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private SimpleDateFormat sdFormat;
	private RepaircaseService repaircaseservice;
	private InputStream is=null;
	@Override
	public void init() throws ServletException {
		repaircaseservice = new RepaircaseService(
				new RepaircaseDAO(HibernateUtil.getSessionFactory()));
	}
	
	
	@Override
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession(false);
		
	
//接收資料
		String temp1 = request.getParameter("id");
		String temp9 = request.getParameter("score");
		System.out.println(temp1);
		System.out.println(temp9);
		
//驗證資料
		Map<String, String> errors = new HashMap<String, String>();
		request.setAttribute("errors", errors);
		


//轉換資料
		Integer repaircase_id = 0;
		if (temp1!=null && temp1.length()!=0) {
			try {
				repaircase_id = Integer.parseInt(temp1);
			} catch (NumberFormatException e) {
				e.printStackTrace();
				errors.put("id", "Id欄位請輸入整數");
			}
		}
		Integer repaircase_score = 0;
		if (temp9!=null && temp9.length()!=0) {
			try {
				repaircase_score = Integer.parseInt(temp9);
			} catch (NumberFormatException e) {
				e.printStackTrace();
				errors.put("id", "Id欄位請輸入整數");
			}
		}
//呼叫Model
		CustomerBean custbean = (CustomerBean)session.getAttribute("custuser");
//		bean.setRepaircase_score(repaircase_score);
		

		
		
//根據Model執行結果呼叫View
		boolean result = repaircaseservice.CusFincase(repaircase_id, repaircase_score);
		System.out.println(result);
//		if(result==null) {
//			errors.put("action", "Insert失敗");
//		} else {
//			request.setAttribute("insert", result);
//		}
//		request.getRequestDispatcher(
//				"/Tinymap/click.jsp").forward(request, response);
	}
	@Override
	protected void doPost(HttpServletRequest req,
			HttpServletResponse resp) throws ServletException, IOException {
		this.doGet(req, resp);
	}

}
