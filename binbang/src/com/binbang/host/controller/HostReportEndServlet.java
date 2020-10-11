package com.binbang.host.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.binbang.host.model.service.HostService;
import com.binbang.member.model.vo.Complaint;
import com.binbang.member.model.vo.Member;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * Servlet implementation class HostReportEndServlet
 */
@WebServlet("/hostReportEnd")
public class HostReportEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HostReportEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if(!ServletFileUpload.isMultipartContent(request)) {
			request.setAttribute("msg", "공지사항작성 오류[form:enctype에러. 관리자에게 문의]");
			request.setAttribute("loc", "/");
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
			return;
		}
		
		String path = getServletContext().getRealPath("/upload/complaint");
		File dir = new File(path);
		//폴더만들기 => 폴더없으면 만들어줌
		if(!dir.exists()) dir.mkdirs();
	
		int maxSize = 1024*1024*50;
		DefaultFileRenamePolicy rename = new DefaultFileRenamePolicy();
		MultipartRequest mr = new MultipartRequest(request,path,maxSize,"UTF-8",rename);
			
		HttpSession session =request.getSession();
		Member m = (Member)session.getAttribute("m");
		//신고할집
		String houseNo = mr.getParameter("selHouseNo");
		//신고할카테고리
		String complaintCate = mr.getParameter("complaintCate");
		//신고이유
		String complaintDetail = mr.getParameter("complaintDetail");
		//호스트번호
		String hostNo = mr.getParameter("hostNo");
		//사진
		String complaintPic = mr.getFilesystemName("complaintPic");
		Complaint c = new Complaint();
		c.setHostNo(hostNo);
		c.setHouseNo(houseNo);
		c.setMemberNo(m.getMemberNo());
		c.setComplaintCategory(complaintCate);
		c.setComplaintDetail(complaintDetail);
		c.setComplaintPic(complaintPic);
		int result = new HostService().insertComplaint(c);
		System.out.println(result);
		
		String msg = "";
		if(result > 0) {
			msg = "신고접수가 완료되었습니다.";
		} else {
			msg = "신고접수에 실패하였습니다.";
		}
		response.setContentType("text/html; charset=euc-kr"); //한글이 인코딩
	   PrintWriter out = response.getWriter(); //선언
	   
	   String str="";
	   str = "<script language='javascript'>";
	   str += "alert('"+ msg + "');";  //오프너 새로고침
	   str += "self.close();";   // 창닫기
	   str += "</script>";
	   out.print(str);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
