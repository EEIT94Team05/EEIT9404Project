package controller;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.hibernate.annotations.GenerationTime;

import hibernate.HibernateUtil;
import model.BiddingBean;
import model.BiddingPk;
import model.BiddingService;
import model.dao.BiddingDAOHibernate;
@MultipartConfig(
		location="",
		fileSizeThreshold=1024*1024,
		maxFileSize=1024*1024*500,
		maxRequestSize=1024*1024*500*5
		)
@WebServlet("/CreateBiddingServlet")
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
		request.setCharacterEncoding("UTF-8");
		
		
		String temp1=request.getParameter("repaircaseid");
		String comid=request.getParameter("comid");
		String amount=request.getParameter("amount");
		String content=request.getParameter("context");
		String submit=request.getParameter("submit");
		
		HashMap<String, String> error = new HashMap<String,String>();
		request.setAttribute("error", error);
		
		if("submit".equals(submit)){
			if(amount==null||content==null){
				error.put("error", "金額、日期及內容欄位要輸入");
			}
		}
		int repaircaseid = 0;
		if(temp1!=null){
			repaircaseid=Integer.parseInt(temp1);
		}

		Blob blob=null;
		Part part = request.getPart("img");
		if(part!=null){
			 is = part.getInputStream();
			 blob = HibernateUtil.getSessionFactory().getCurrentSession().getLobHelper().createBlob(is,-1);
		}
		if(error!=null&&!error.isEmpty()){
			request.getRequestDispatcher("/testCreateBidding.jsp").forward(request, response);
			return;
		}

		BiddingBean biddingBean = new BiddingBean();
		BiddingPk bpk = new BiddingPk();
		bpk.setRepaircase_Id(repaircaseid);
		bpk.setCom_id(comid);
		biddingBean.setBiddingPk(bpk);
		biddingBean.setBidding_amount(amount);
		biddingBean.setBidding_context(content);
		biddingBean.setBidding_img(blob);
		
		
		biddingService.insert(biddingBean);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {

		doGet(request, response);
	}

}
