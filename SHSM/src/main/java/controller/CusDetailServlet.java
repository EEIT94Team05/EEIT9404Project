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
import java.util.List;
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
import org.json.JSONObject;
import org.json.simple.JSONArray;
import org.json.simple.JSONValue;

import hibernate.HibernateUtil;
import model.CustomerBean;
import model.RepaircaseBean;
import model.RepaircaseService;
import model.ReportBean;
import model.dao.CustomerDAO;
import model.dao.RepaircaseDAO;


@WebServlet(
		urlPatterns={"/casepage/CusDetailServlet.controller"}
)
public class CusDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	private CustomerDAO customerDAO;
	
	@Override
	public void init() throws ServletException {
		customerDAO = new CustomerDAO(HibernateUtil.getSessionFactory());
	}
	
	@Override
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/json; charset=UTF-8");
		HttpSession session = request.getSession(false);
		
		
//接收資料
		String custid = request.getParameter("id");
//驗證資料
		Map<String, String> errors = new HashMap<String, String>();
		request.setAttribute("errors", errors);
		
//轉換資料
		
		
//呼叫Model
		
//根據Model執行結果呼叫View
		CustomerBean result = customerDAO.select(custid);
		if(result==null) {
			errors.put("action", "Insert失敗");
		} else {
//			request.setAttribute("cuscasebean", result);
			JSONObject array;
			String cus_regist = null;
			
			array = new JSONObject();
			array.put("cus_name",result.getCus_name());
			array.put("cus_address",result.getCus_address());
			array.put("cus_email",result.getCus_email());
			array.put("cus_phone",result.getCus_phone());
			array.put("sex",result.getSex());
			
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
