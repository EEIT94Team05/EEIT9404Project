package controller;

import java.io.IOException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hibernate.HibernateUtil;
import model.dao.RepaircaseDAO;

@MultipartConfig(
		location="",
		fileSizeThreshold=1024*1024,
		maxFileSize=1024*1024*500,
		maxRequestSize=1024*1024*500*5
		)
@WebServlet("/casepage/RepaircaseUpdateServlet")
public class RepaircaseUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private RepaircaseDAO repaircaseDao;
    private SimpleDateFormat sdf;
    public RepaircaseUpdateServlet() {

    }
	@Override
	public void init() throws ServletException {
		repaircaseDao=new RepaircaseDAO(HibernateUtil.getSessionFactory());
		sdf=new SimpleDateFormat("yyyy-MM-dd");
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String temp = request.getParameter("repaircase_Id");
		String repaircase_type = request.getParameter("repaircase_type");
		String repaircase_budget = request.getParameter("repaircase_budget");
		String repaircase_title = request.getParameter("repaircase_title");
		String repaircase_address = request.getParameter("repaircase_address");
		String repaircase_place = request.getParameter("repaircase_place");
		String repaircase_context = request.getParameter("repaircase_context");
		String repairdate = request.getParameter("repaircase_repairdate");
		
		
		int repaircase_Id=0;
		try {
			repaircase_Id=Integer.parseInt(temp);
		} catch (NumberFormatException e) {
			e.printStackTrace();
		}
		
		Date time = null;
		System.out.println(repairdate);
		if(repairdate!=null && repairdate.length()!=0){
			try {
				time = sdf.parse(repairdate);
			} catch (ParseException e) {
				e.printStackTrace();
			}
			System.out.println(time);
		}
		

		repaircaseDao.updateagain(
				repaircase_Id,
				repaircase_budget,
				repaircase_type, 
				repaircase_title, 
				null, 
				repaircase_address,
				repaircase_place, 
				time,
				repaircase_context,
				null,
				null, 
				null,
				null,
				null);

	};
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {

		doGet(request, response);
	}

}
