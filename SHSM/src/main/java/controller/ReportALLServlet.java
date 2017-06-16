package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hibernate.HibernateUtil;
import model.dao.ReportDAOHibernate;

@WebServlet("/administrator/ReportALLServlet")
public class ReportALLServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ReportDAOHibernate reportDao;
    @Override
	public void init() throws ServletException {
    	reportDao=new ReportDAOHibernate(HibernateUtil.getSessionFactory());

	}

	public ReportALLServlet() {

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		response.setContentType("text/plain; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.write(reportDao.selectAll());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		doGet(request, response);
	}

}
