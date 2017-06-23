package controller;

import java.io.IOException;
import java.io.OutputStream;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hibernate.HibernateUtil;
import model.RepaircaseBean;
import model.RepaircaseService;
import model.dao.RepaircaseDAO;

@WebServlet("/controller/GetCaseImageServlet")
public class GetCaseImageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private RepaircaseService repaircaseservice;

    public GetCaseImageServlet() {

    }
    
	@Override
	public void init() throws ServletException {
		repaircaseservice = new RepaircaseService(
				new RepaircaseDAO(HibernateUtil.getSessionFactory()));
	}


	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		String id = request.getParameter("id");

		Integer repaircase_id = 0;
		if (id!=null && id.length()!=0) {
			try {
				repaircase_id = Integer.parseInt(id);
			} catch (NumberFormatException e) {
				e.printStackTrace();
				
			}
		}
		RepaircaseBean result = repaircaseservice.selectBidding(repaircase_id);
		if(result==null) {
			System.out.println("NO");
		} else {

			byte[] buf = null;

			try {
				if(result.getRepaircase_img1()!=null){
				int blob = (int)result.getRepaircase_img1().length();
				buf = result.getRepaircase_img1().getBytes(1, blob);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			response.setContentType("image/jpeg");   
			OutputStream out = response.getOutputStream();
			if(buf!=null)
            for (int i = 0; i < buf.length; i++) {
            		out.write(buf[i]);
             }     
            

		}
		
	}

	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		doGet(request, response);
	}

}
