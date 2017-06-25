package controller;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Blob;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.hibernate.annotations.GenerationTime;

import hibernate.HibernateUtil;
import model.BiddingBean;
import model.BiddingPk;
import model.BiddingService;
import model.CompanyBean;
import model.dao.BiddingDAOHibernate;
@MultipartConfig(
		location="",
		fileSizeThreshold=1024*1024,
		maxFileSize=1024*1024*500,
		maxRequestSize=1024*1024*500*5
		)
@WebServlet("/TinymapManufactory/CreateBiddingServlet")
public class CreateBiddingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private InputStream is=null;
	private BiddingService biddingService;
    public CreateBiddingServlet() {

    }
	@Override
	public void init() throws ServletException {
		biddingService=new BiddingService(new BiddingDAOHibernate(HibernateUtil.getSessionFactory()));
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		response.setHeader("content-type", "text/html;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession(false);
		CompanyBean bean = (CompanyBean)session.getAttribute("compuser");
		
		String temp1=request.getParameter("id");
		String amount=request.getParameter("amount");
		String content=request.getParameter("context");
		String submit=request.getParameter("enter"); 
		String type=request.getParameter("select"); 
		System.out.println(temp1);
		System.out.println(amount);
		System.out.println(content);
		System.out.println(bean.getCom_id());
		System.out.println(type);
		
		Map<String, String> error = new HashMap<String,String>();
		request.setAttribute("error", error);
		
		if("確定投標".equals(submit)){
			if(amount==null || amount.trim().length()==0){
				if(content==null || content.trim().length()==0){
				error.put("column", "金額及內容欄位要輸入");
				}
			}
		}
		if(error!=null && !error.isEmpty()){
			out.write("欄位不可為空,請重新輸入");
			return;
		}
		
		int repaircase_id=0;
		if(temp1!=null){
		try {
			repaircase_id=Integer.parseInt(temp1);
		} catch (NumberFormatException e) {
			e.printStackTrace();
		}
		}


//		Blob blob=null;
//		Part part = request.getPart("img");
//		if(part!=null){
//			if(part.getContentType()!=null){
//				 is = part.getInputStream();
//				 blob = HibernateUtil.getSessionFactory().getCurrentSession().getLobHelper().createBlob(is,-1);
//			}
//			
//		}
		

		BiddingBean biddingBean = new BiddingBean();
		BiddingPk bpk = new BiddingPk();
		bpk.setCom_id(bean.getCom_id());
		bpk.setRepaircase_Id(repaircase_id);
		biddingBean.setBiddingPk(bpk);
		biddingBean.setBidding_amount(amount);
		biddingBean.setBidding_context(content);
//		biddingBean.setBidding_img(blob);
		
		
		
//		System.out.println(strMsg);
		if(type.equals("select")){
			BiddingBean result = biddingService.select(bpk);
			System.out.println(result);
			if(result!=null)
			out.write("已投標");
		}else{
			boolean strMsg = biddingService.returnInsertStatus(biddingBean);

			if(strMsg==true){
				out.write("投標完成");
			}else{
				out.write("投標失敗");
			}
		}
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {

		doGet(request, response);
	}

}
