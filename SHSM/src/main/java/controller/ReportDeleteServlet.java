package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hibernate.HibernateUtil;
import model.dao.ReportDAOHibernate;


@WebServlet("/administrator/ReportDeleteServlet")
public class ReportDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ReportDAOHibernate reportDao;
    public ReportDeleteServlet() {

    }
	@Override
	public void init() throws ServletException {
		reportDao=new ReportDAOHibernate(HibernateUtil.getSessionFactory());
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
			int ReportId = Integer.parseInt(request.getParameter("ReportId"));
			System.out.println(ReportId);
			reportDao.delete(ReportId);

			
			
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {

		doGet(request, response);
	}

}
