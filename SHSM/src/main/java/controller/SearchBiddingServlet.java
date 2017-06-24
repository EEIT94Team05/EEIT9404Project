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
import org.json.JSONArray;
import org.json.JSONObject;

import hibernate.HibernateUtil;
import model.BiddingBean;
import model.BiddingDAO;
import model.BiddingPk;
import model.BiddingService;
import model.CustomerBean;
import model.RepaircaseBean;
import model.RepaircaseService;
import model.dao.BiddingDAOHibernate;
import model.dao.RepaircaseDAO;

@MultipartConfig(
		location="",
		fileSizeThreshold=1024*1024,
		maxFileSize=1024*1024*500,
		maxRequestSize=1024*1024*500*5
		)

@WebServlet(
		urlPatterns={"/controller/SearchBidding.controller"}
)
public class SearchBiddingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private SimpleDateFormat sdFormat;
	private BiddingService biddingservice;
	private InputStream is=null;
	@Override
	public void init() throws ServletException {
		biddingservice = new BiddingService(
				new BiddingDAOHibernate(HibernateUtil.getSessionFactory()));
	}
	
	@Override
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json;charset=UTF-8");
		HttpSession session = request.getSession(false);
		PrintWriter out = response.getWriter();	
	
//接收資料
		String temp1 = request.getParameter("repaircase_Id");
		String com_id = request.getParameter("com_id");
		System.out.println(temp1);

		
//驗證資料
		Map<String, String> errors = new HashMap<String, String>();
		request.setAttribute("errors", errors);
		


//轉換資料
		int repaircase_id = 0;
		if (temp1!=null && temp1.length()!=0) {
			try {
				repaircase_id = Integer.parseInt(temp1);
			} catch (NumberFormatException e) {
				e.printStackTrace();
				errors.put("id", "Id欄位請輸入整數");
			}
		}
		
		
//呼叫Model
		BiddingPk biddingPk = new BiddingPk();
		biddingPk.setRepaircase_Id(repaircase_id);
		biddingPk.setCom_id(com_id);
		
		
//根據Model執行結果呼叫View
		BiddingBean result = biddingservice.select(biddingPk);
		System.out.println(result.getBidding_context());
		if(result==null) {
			errors.put("action", "Insert失敗");
		} else {
//			request.setAttribute("biddingbean", result);
//			System.out.println(result);
			JSONObject obj2;
			obj2 = new JSONObject();
			obj2.put("biddingPk", result.getBiddingPk());
			obj2.put("bidding_amount", result.getBidding_amount());
			obj2.put("bidding_date", result.getBidding_date());
			obj2.put("bidding_img", result.getBidding_img());
			obj2.put("bidding_context", result.getBidding_context());
			
//			System.out.println(jsonArray);
			out.println(obj2.toString());
		}
//		request.getRequestDispatcher(
//				"/Tinymap/click.jsp").forward(request, response);
	}
	@Override
	protected void doPost(HttpServletRequest req,
			HttpServletResponse resp) throws ServletException, IOException {
		this.doGet(req, resp);
	}

}
