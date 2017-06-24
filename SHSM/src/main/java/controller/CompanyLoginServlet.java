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
import model.CompanyBean;
import model.CompanyService;
import model.dao.CompanyDAO;

@WebServlet(
		urlPatterns={"/Companylogin.controller"}

)
public class CompanyLoginServlet extends HttpServlet {
	private CompanyService companyservice;
	
	@Override
	public void init() throws ServletException {
		companyservice = new CompanyService(
				new CompanyDAO(HibernateUtil.getSessionFactory()));
	}
	@Override
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		
		
		
//接收資料
		String username = request.getParameter("username");
		String password = request.getParameter("password");
				
		
//驗證資料
//轉換資料
		Map<String, String> errors = new HashMap<String, String>();
		request.setAttribute("errors", errors);
		
		if(username==null || username.length()==0) {
			errors.put("acterror", "請輸入帳號");
		}
		if(password==null || password.length()==0) {
			errors.put("psderror", "請輸入密碼");
		}
		
		if(errors!=null && !errors.isEmpty()) {
			request.getRequestDispatcher(
					"/Manufacturers-logning.jsp").forward(request, response);
			return;		
		}		 	
//呼叫Model
		CompanyBean bean = companyservice.login(username, password);
//		if (bean != null) {
//			// OK, 將mb物件放入Session範圍內，識別字串為"LoginOK"，表示此使用者已經登入
//			session.setAttribute("LoginOK", bean);
//		} else {
//			// NG, userid與密碼的組合錯誤，放錯誤訊息"該帳號不存在或密碼錯誤"到 errorMsgMap 之內
//			// 對應的識別字串為 "LoginError"
//			errors.put("LoginError", "該帳號不存在或密碼錯誤");
//		}
		
//根據Model執行結果呼叫View
		if(bean==null) {
			errors.put("psderror", "登入失敗，請再次輸入帳號密碼");
			request.getRequestDispatcher(
					"/Manufacturers-logning.jsp").forward(request, response);
		} else {

			session.setAttribute("compuser", bean);
			session.setAttribute("company", bean);
			String path = request.getContextPath();
//			response.sendRedirect(path+"/member.jsp");
			response.sendRedirect(path+"/Manufacturers.jsp");//重新導向回首頁
		}
	}
	@Override
	protected void doPost(HttpServletRequest req,
			HttpServletResponse resp) throws ServletException, IOException {
		this.doGet(req, resp);
	}
}
