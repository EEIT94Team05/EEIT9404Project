package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;

import hibernate.HibernateUtil;
import model.CompanyBean;
import model.CustomerBean;
import model.dao.CompanyDAO;


@WebServlet(
		urlPatterns={"/casepage/ComDetailServlet.controller"}
)
public class ComDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	private CompanyDAO companydao;
	
	@Override
	public void init() throws ServletException {
		companydao = new CompanyDAO(HibernateUtil.getSessionFactory());
	}
	
	@Override
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/json; charset=UTF-8");
		HttpSession session = request.getSession(false);
		
		
//接收資料
		String compid = request.getParameter("id");
//驗證資料
		Map<String, String> errors = new HashMap<String, String>();
		request.setAttribute("errors", errors);
		
//轉換資料
		
		
//呼叫Model
		
//根據Model執行結果呼叫View
		CompanyBean result = companydao.select(compid);
		if(result==null) {
			errors.put("action", "Insert失敗");
		} else {
//			request.setAttribute("cuscasebean", result);
			JSONObject array;
			String cus_regist = null;
			
			array = new JSONObject();
			array.put("com_name",result.getCom_name());
			array.put("com_contact",result.getCom_contact());
			array.put("com_address",result.getCom_address());
			array.put("com_email",result.getCom_email());
			array.put("com_phone",result.getCom_phone());
			array.put("Fax",result.getFax());
			PrintWriter out = response.getWriter();
			System.out.println(array.toString());
			out.print(array);
		}
		
	}
	@Override
	protected void doPost(HttpServletRequest req,
			HttpServletResponse resp) throws ServletException, IOException {
		this.doGet(req, resp);
	}

}
