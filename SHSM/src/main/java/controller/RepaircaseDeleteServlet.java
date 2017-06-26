package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hibernate.HibernateUtil;
import model.dao.RepaircaseDAO;

@WebServlet("/casepage/RepaircaseDeleteServlet")
public class RepaircaseDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private RepaircaseDAO repaircaseDao;
    public RepaircaseDeleteServlet() {

    }

	@Override
	public void init() throws ServletException {
		repaircaseDao=new RepaircaseDAO(HibernateUtil.getSessionFactory());
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		int repaircase_Id = Integer.parseInt(request.getParameter("repaircase_Id"));
		repaircaseDao.delete(repaircase_Id);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		doGet(request, response);
	}

}
