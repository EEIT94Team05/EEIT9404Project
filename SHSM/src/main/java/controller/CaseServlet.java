package controller;

import java.io.File;
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

import hibernate.HibernateUtil;
import model.CustomerBean;
import model.RepaircaseBean;
import model.RepaircaseService;
import model.dao.RepaircaseDAO;

@MultipartConfig(
		location="",
		fileSizeThreshold=1024*1024,
		maxFileSize=1024*1024*500,
		maxRequestSize=1024*1024*500*5
		)

@WebServlet(
		urlPatterns={"/map/createcase.controller"}
)
public class CaseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private SimpleDateFormat sdFormat;
	private RepaircaseService repaircaseservice;
	private InputStream is=null;
	@Override
	public void init() throws ServletException {
		repaircaseservice = new RepaircaseService(
				new RepaircaseDAO(HibernateUtil.getSessionFactory()));
	}
	
	public String getFileNameFromPart(Part part) {
		String header=part.getHeader("content-disposition");//取得檔案名稱
		String fileName = new File(header.substring(header.lastIndexOf("=")+2,header.length()-1)).getName();
		System.out.println("filename=" + fileName); // 測試用
		if(fileName.length()!=0){
			return fileName;
		}
		return null;

	}
	@Override
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession(false);
		
	
//接收資料
		String temp1 = request.getParameter("id");
		String repaircase_budget = request.getParameter("budget");
		String repaircase_type = request.getParameter("casetype");
		String repaircase_title = request.getParameter("casetitle");
		String repaircase_area = request.getParameter("casearea");
		String repaircase_address = request.getParameter("caseaddress");
		String repaircase_place = request.getParameter("caseplace");
		String temp2 = request.getParameter("repairdate");
		String repaircase_context = request.getParameter("context");
		String temp3 = request.getParameter("img1");
//		String temp4 = request.getParameter("img2");
//		String temp5 = request.getParameter("img3");
		String temp6 = request.getParameter("media");
		String temp7 = request.getParameter("createdate");
		String repaircase_status = request.getParameter("status");
		String temp8 = request.getParameter("finday");
		String temp9 = request.getParameter("score");
		
		
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
		
		java.util.Date repaircase_repairdate = null;
		System.out.println(temp2);
		sdFormat = new SimpleDateFormat("yyyy-MM-dd");
		if (temp2!=null && temp2.length()!=0) {
			try {
				repaircase_repairdate = sdFormat.parse(temp2);
			} catch (ParseException e) {
				e.printStackTrace();
				errors.put("make", "Make必須是擁有YYYY-MM-DD格式的日期");
			} 
		}
		System.out.println(repaircase_repairdate);
		
		Collection<Part> parts = request.getParts();
		
		if(parts!=null){
			for(Part part : parts){
			if("application/octet-stream".equals(part.getContentType()) ){
//				String filename = getFileNameFromPart(part);
//				part.write(filename);
				is = part.getInputStream();
				
			}
		}
		}
		
		
//		Blob repaircase_img1 = null;
//		if(temp3!=null && temp3.length()!=0) {
//			repaircase_img1 = temp3.getBytes();
//		}
//		Blob repaircase_img2 = null;
//		if(temp4!=null && temp4.length()!=0) {
//			repaircase_img2 = temp4.getBytes();	
//		}
//		Blob repaircase_img3 = null;
//		if(temp5!=null && temp5.length()!=0) {
//			repaircase_img3 = temp5.getBytes();	
//		}
		byte[] repaircase_media = null;
		if(temp6!=null && temp6.length()!=0) {
			repaircase_media = temp6.getBytes();	
		}
		
		SimpleDateFormat cdformat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		java.sql.Timestamp repaircase_createdate = null;
		if(temp7!=null && temp7.length()!=0) {
			String time = cdformat.format(temp7);
			repaircase_createdate = java.sql.Timestamp.valueOf(time);
		}
		System.out.println(repaircase_createdate);
		
		repaircase_status = "招標中";
		
		java.util.Date repaircase_finday = null;
		if (temp8!=null && temp8.length()!=0) {
			try {
				repaircase_finday = sdFormat.parse(temp8);
			} catch (ParseException e) {
				e.printStackTrace();
				errors.put("make", "Make必須是擁有YYYY-MM-DD格式的日期");
			} 
		}
		
		Integer repaircase_score = 0;
		if (temp8!=null && temp8.length()!=0) {
			try {
				repaircase_score = Integer.parseInt(temp8);
			} catch (NumberFormatException e) {
				e.printStackTrace();
				errors.put("id", "Id欄位請輸入整數");
			}
		}
//呼叫Model
		CustomerBean custbean = (CustomerBean)session.getAttribute("custuser");
		RepaircaseBean bean = new RepaircaseBean();
		bean.setRepaircase_id(repaircase_id);
		bean.setRepaircase_budget(repaircase_budget);
		bean.setRepaircase_type(repaircase_type);
		bean.setRepaircase_title(repaircase_title);
		bean.setRepaircase_area(repaircase_area);
		bean.setRepaircase_address(repaircase_address);
		bean.setRepaircase_place(repaircase_place);
		bean.setRepaircase_repairdate(repaircase_repairdate);
		bean.setRepaircase_context(repaircase_context);
//		bean.setRepaircase_img1(repaircase_img1);
//		bean.setRepaircase_img2(repaircase_img2);
//		bean.setRepaircase_img3(repaircase_img3);
		bean.setRepaircase_createdate(repaircase_createdate);
		bean.setRepaircase_status(repaircase_status);
		bean.setRepaircase_finday(repaircase_finday);
		bean.setRepaircase_score(repaircase_score);
		bean.setCustomerbean(custbean);
		
//根據Model執行結果呼叫View
		RepaircaseBean result = repaircaseservice.insert(bean);
		if(result==null) {
			errors.put("action", "Insert失敗");
		} else {
			request.setAttribute("insert", result);
		}
		request.getRequestDispatcher(
				"/map/Case.jsp").forward(request, response);
	}
	@Override
	protected void doPost(HttpServletRequest req,
			HttpServletResponse resp) throws ServletException, IOException {
		this.doGet(req, resp);
	}

}
