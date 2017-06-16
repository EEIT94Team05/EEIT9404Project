package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.mapping.Map;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;

import hibernate.HibernateUtil;
import model.CustomerBean;
import model.dao.CustomerDAO;
import model.dao.ReportDAOHibernate;

@WebServlet("/administrator/CustomerALLServlet")
public class CustomerALLServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private CustomerDAO customerDao;
	

	@Override
	public void init() throws ServletException {
		customerDao=new CustomerDAO(HibernateUtil.getSessionFactory());
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {


//		response.setContentType("text/plain; charset=UTF-8");
//		PrintWriter out = response.getWriter();
//		out.print(customerDao.selectAll());
		
		response.setContentType("text/plain; charset=UTF-8");
		PrintWriter out = response.getWriter();

		 String result = customerDao.selectAll();
//		ReportDAOHibernate reportDao = new ReportDAOHibernate(HibernateUtil.getSessionFactory());
//		JSONArray result1 = reportDao.select();

//		System.out.println("CustomerALLServlet called");
		out.write(result);
//		out.write(result1.toString());
		out.close();
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		doGet(request, response);
	}

}
