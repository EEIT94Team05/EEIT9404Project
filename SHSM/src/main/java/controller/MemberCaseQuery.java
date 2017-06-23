package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.SessionFactory;

import hibernate.HibernateUtil;
import model.CustomerBean;
import model.RepaircaseBean;
import model.dao.BiddingDAOHibernate;
import model.dao.RepaircaseDAO;

@WebServlet("/controller/MemberCaseQuery")
public class MemberCaseQuery extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private RepaircaseDAO RepaircaseDao; 
    public MemberCaseQuery() {
    }
    
	@Override
	public void init() throws ServletException {
		RepaircaseDao=new RepaircaseDAO(HibernateUtil.getSessionFactory());
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
			response.setCharacterEncoding("UTF-8");
			HttpSession session = request.getSession(false);
			CustomerBean custuser = (CustomerBean) session.getAttribute("custuser");
			
			List<RepaircaseBean> repaircases = RepaircaseDao.selectUserRepaircase(custuser.getCus_id());
			
			request.setAttribute("repaircase", repaircases);
			request.getRequestDispatcher("/member-casequery.jsp").forward(request, response);
			
			
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		doGet(request, response);
	}

}
