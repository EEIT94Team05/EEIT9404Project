package controller;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.Timestamp;
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
import model.CompanyBean;
import model.CompanyService;
import model.dao.CompanyDAO;
@MultipartConfig(
		location="",
		fileSizeThreshold=1024*1024,
		maxFileSize=1024*1024*500,
		maxRequestSize=1024*1024*500*5
		)
@WebServlet("/CompanyRegisteredServlet")
public class CompanyRegisteredServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private SimpleDateFormat sdFormat;
	private InputStream is=null;
	public CompanyRegisteredServlet() {
	}

	private CompanyService companyservice;

	@Override
	public void init() throws ServletException {
		sdFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		companyservice = new CompanyService(new CompanyDAO(HibernateUtil.getSessionFactory()));
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");

		HttpSession session = request.getSession();
		// 接收資料
		String com_id = request.getParameter("com_id");
		String com_password = request.getParameter("com_password");
		String com_name = request.getParameter("com_name");
		String com_address = request.getParameter("com_address");
		String com_phone = request.getParameter("com_phone");
		String com_email = request.getParameter("com_email");
		String com_intr = request.getParameter("com_intr");
//		String com_img = request.getParameter("com_img");
		String com_confact = request.getParameter("com_confact");
		String com_fax = request.getParameter("com_fax");
		String com_regist = request.getParameter("com_regist");
		System.out.println(com_id + "~" + com_password + "~" + com_name + "~" + com_address + "~" + com_phone + "~"
				+ com_email + "~" + com_intr + "~"  + com_confact + "~" + com_fax +"~"+com_regist);

		// 驗證資料
		Map<String, String> errors = new HashMap<String, String>();
		request.setAttribute("errors", errors);
		// 轉換資料

		java.util.Date repaircase_repairdate = null;
		String date;
		Timestamp time = null;
		if (com_regist != null && com_regist.length() != 0) {
			try {
				repaircase_repairdate = sdFormat.parse(com_regist);
				date = sdFormat.format(repaircase_repairdate);
				time = java.sql.Timestamp.valueOf(date);	
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}

		if (com_id == null || com_id.length() == 0) {
			errors.put("cus_id", "請輸入帳號");
		}
		if (com_password == null || com_password.length() == 0) {
			errors.put("cus_password", "請輸入密碼");
		}
		if (com_name == null || com_name.trim().length() == 0) {
			errors.put("cus_name", "姓名欄必須輸入");
		}
		if (com_address == null || com_address.trim().length() == 0) {
			errors.put("com_address", "地址欄必須輸入");
		}
		if (com_phone == null || com_phone.trim().length() == 0) {
			errors.put("com_phone", "電話號碼欄必須輸入");
		}
		if (com_email == null || com_email.trim().length() == 0) {
			errors.put("com_email", "EMail欄必須輸入");
		}
		if (com_fax == null || com_fax.trim().length() == 0) {
			errors.put("com_fax", "性別欄必須輸入");
		}
		if (com_intr == null || com_intr.trim().length() == 0) {
			errors.put("com_intr", "簡介");
		}
		if (com_confact == null || com_confact.trim().length() == 0) {
			errors.put("com_confact", "負責人");
		}
		Blob blobi=null;
		Collection<Part> parts = request.getParts();
		if(parts!=null){
			for(Part part : parts){
				System.out.println(part.getContentType());
				String header=part.getHeader("content-disposition");//取得檔案名稱
				System.out.println("header="+header);
			if("image/jpeg".equals(part.getContentType()) || "image/png".equals(part.getContentType())){
				is = part.getInputStream();
				System.out.println(part.getSize());
				blobi = HibernateUtil.getSessionFactory().getCurrentSession().getLobHelper().createBlob(is,-1);
			}	
		}
		}

		// 呼叫Model
		CompanyBean bean = new CompanyBean();
		bean.setCom_id(com_id);
		bean.setCom_password(com_password);
		bean.setCom_name(com_name);
		bean.setCom_address(com_address);
		bean.setCom_phone(com_phone);
		bean.setCom_email(com_email);
		bean.setCom_intr(com_intr);
		bean.setCom_img(blobi);
		bean.setCom_contact(com_confact);
		bean.setFax(com_fax);
		bean.setCom_regist(time);
		
		
		System.out.println(bean);

		// 根據Model執行結果呼叫View
		CompanyBean result = companyservice.insert(bean);
		if (result == null) {
			request.getRequestDispatcher("/Manufacturers-register.jsp").forward(request, response);
			errors.put("action", "Insert失敗");
		} else {
			session.setAttribute("compuser", result);
			String path = request.getContextPath();

			response.sendRedirect(path+"/Manufacturers-logning.jsp");
		}
	}
}
