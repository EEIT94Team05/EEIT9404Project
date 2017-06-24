package controller;

import java.io.IOException;
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
import model.dao.CustomerDAO;

@WebServlet("/controller/regisercustomerservlet")
public class regisercustomerservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public regisercustomerservlet() {
	}

	private CustomerService customerservice;
	private CustomerDAO custmoerDAO;

	@Override
	public void init() throws ServletException {
		custmoerDAO = new CustomerDAO(HibernateUtil.getSessionFactory());
	}
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");

		HttpSession session = request.getSession();
		// 接收資料
		String member_user = request.getParameter("member_user");
		String member_name = request.getParameter("member_name");
		String member_mail = request.getParameter("member_mail");
		String member_password = request.getParameter("member_password");
		String member_adress = request.getParameter("member_adress");
		String member_phone = request.getParameter("member_phone");
		String member_chackbox = request.getParameter("member_chackbox");
		String member_date = request.getParameter("member_date");
		System.out.println(member_name);
		System.out.println(member_mail);
		System.out.println(member_password);
		System.out.println(member_adress);
		System.out.println(member_phone);

		// 驗證資料
		Map<String, String> errors = new HashMap<String, String>();
		request.setAttribute("errors", errors);

		// 轉換資料
		if (member_date != null && member_date.trim().length() != 0) {
			errors.put("member_date", "請輸入日期");
		}
		if (member_chackbox != null && member_chackbox.trim().length() != 0) {
			errors.put("member_chackbox", "請輸入性別");
		}
		if (member_name != null && member_name.trim().length() != 0) {
			errors.put("member_name", "請輸入名稱");
		}
		
		if (member_name != null && member_name.trim().length() != 0) {
			errors.put("member_name", "請輸入名稱");
		}
		if (member_mail != null && member_name.trim().length() != 0) {
			errors.put("member_mail", "請輸入email");
		}
		if (member_password != null && member_name.trim().length() != 0) {
			errors.put("member_password", "請輸入密碼");
		}
		if (member_adress != null && member_name.trim().length() != 0) {
			errors.put("member_adress", "請輸入地址");
		}
		if (member_phone != null && member_name.trim().length() != 0) {
			errors.put("member_phone", "請輸入電話");
		}

		// 呼叫Model
		CustomerBean custbean = (CustomerBean) session.getAttribute("custuser");
		CustomerBean bean = new CustomerBean();
		bean.setCus_id(custbean.getCus_id());
		bean.setCus_name(member_name);
		bean.setCus_email(member_mail);
		bean.setCus_password(member_password);
		bean.setCus_address(member_adress);
		bean.setCus_phone(member_phone);
		System.out.println(bean);

		// 根據Model執行結果呼叫View
		CustomerBean result = customerservice.insert(bean);
		if (result == null) {
			errors.put("action", "Insert失敗");
		} else {
			request.setAttribute("insert", result);
		}
		request.getRequestDispatcher("").forward(request, response);

	}

}
