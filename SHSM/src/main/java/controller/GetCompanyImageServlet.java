package controller;

import java.io.IOException;
import java.io.OutputStream;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hibernate.HibernateUtil;
import model.CompanyBean;
import model.CompanyService;
import model.dao.CompanyDAO;

@WebServlet("/controller/GetCompanyImageServlet")
public class GetCompanyImageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private CompanyService companyService;
    public GetCompanyImageServlet() {
    }
    
	@Override
	public void init() throws ServletException {
		companyService=new CompanyService(new CompanyDAO(HibernateUtil.getSessionFactory()));
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("id");
		
		 CompanyBean companyBean = companyService.select(id);
		 
		 if(companyBean==null){
			 System.out.println("無此資料");
		 }else{
			 byte[] buf=null;
			 try {
				int blob = (int) companyBean.getCom_img().length();
				buf = companyBean.getCom_img().getBytes(1, blob);
			} catch (SQLException e) {
			
				e.printStackTrace();
			}
			 response.setContentType("image/jpeg");
			 OutputStream out = response.getOutputStream();
			 if(buf!=null)
			 for(int i=0;i<buf.length;i++){
				 out.write(buf[i]);
			 }
		 }

	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {

		doGet(request, response);
	}

}
