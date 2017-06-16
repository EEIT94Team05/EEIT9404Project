package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hibernate.HibernateUtil;
import model.dao.CompanyDAO;

@WebServlet("/administrator/CompanyALLServlet")
public class CompanyALLServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private CompanyDAO companyDao;
    
    public CompanyALLServlet() {
    }

	@Override
	public void init() throws ServletException {
		companyDao=new CompanyDAO(HibernateUtil.getSessionFactory());
	}


	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		response.setContentType("text/plain; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.write(companyDao.selectAll());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {

		doGet(request, response);
	}

}
