package controller;

import java.io.IOException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import hibernate.HibernateUtil;
import model.CustomerBean;
import model.CustomerService;
import model.RepaircaseService;
import model.dao.CustomerDAO;
import model.dao.RepaircaseDAO;

@WebServlet("/regisercustomerservlet")
public class RegiserCustomerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private SimpleDateFormat sdFormat;
	
	public RegiserCustomerServlet() {
	}

	private CustomerService customerservice;

	@Override
	public void init() throws ServletException {
		sdFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		customerservice = new CustomerService(new CustomerDAO(HibernateUtil.getSessionFactory()));
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
		String member_user = request.getParameter("member_user");
		String member_password = request.getParameter("member_password");
		String member_name = request.getParameter("member_name");
		String member_mail = request.getParameter("member_mail");
		String member_adress = request.getParameter("member_adress");
		String member_phone = request.getParameter("member_phone");
		String member_chackbox = request.getParameter("member_chackbox");
		String member_regist = request.getParameter("member_regist");

		System.out.println(member_user);
		System.out.println(member_password);
		System.out.println(member_name);
		System.out.println(member_mail);
		System.out.println(member_adress);
		System.out.println(member_phone);
		System.out.println(member_chackbox);
		System.out.println(member_regist);

		// 驗證資料
		Map<String, String> errors = new HashMap<String, String>();
		request.setAttribute("errors", errors);
		// 轉換資料

		Date repaircase_repairdate = null;
		String date;
		Timestamp time = null;

		if (member_regist!=null && member_regist.length()!=0) {	
					try {
						repaircase_repairdate = sdFormat.parse(member_regist);
						date = sdFormat.format(repaircase_repairdate);
						time = java.sql.Timestamp.valueOf(date);	
						System.out.println(time);
					} catch (ParseException e) {
						e.printStackTrace();
					}
					
		}
		
		if (member_user != null && member_user.trim().length() != 0) {
			errors.put("member_user", "請輸入帳號");
		}
		if (member_password != null && member_password.trim().length() != 0) {
			errors.put("member_password", "請輸入密碼");
		}
		if (member_name != null && member_name.trim().length() != 0) {
			errors.put("member_name", "請輸入名稱");
		}
		if (member_mail != null && member_mail.trim().length() != 0) {
			errors.put("member_mail", "請輸入email");
		}
		if (member_adress != null && member_adress.trim().length() != 0) {
			errors.put("member_adress", "請輸入地址");
		}
		if (member_phone != null && member_phone.trim().length() != 0) {
			errors.put("member_phone", "請輸入電話");
		}
		if (member_chackbox != null && member_chackbox.trim().length() != 0) {
			errors.put("member_chackbox", "請輸入性別");
		}

		// 呼叫Model
		CustomerBean bean = new CustomerBean();
		bean.setCus_id(member_user);
		bean.setCus_password(member_password);
		bean.setCus_name(member_name);
		bean.setCus_address(member_adress);
		bean.setCus_phone(member_phone);
		bean.setCus_regist(time);
		bean.setCus_email(member_mail);
		bean.setSex(member_chackbox);

		System.out.println(bean);

		// 根據Model執行結果呼叫View
		CustomerBean result = customerservice.insert(bean);
		if (result == null) {
			request.getRequestDispatcher("/member-register.jsp").forward(request, response);
			errors.put("action", "Insert失敗");
		} else {
			session.setAttribute("custuser", result);

			String path = request.getContextPath();

			response.sendRedirect(path+"/member-login.jsp");//重新導向回首頁
		}
		
	}

}
