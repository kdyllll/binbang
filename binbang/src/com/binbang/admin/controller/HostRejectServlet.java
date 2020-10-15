package com.binbang.admin.controller;

import java.io.File;
import java.io.IOException;
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

import com.binbang.admin.model.service.AdminService;
import com.google.gson.Gson;

/**
 * Servlet implementation class HostRejectServlet
 */
@WebServlet("/admin/hostReject")
public class HostRejectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HostRejectServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String memberNo = request.getParameter("memberNo");
		String memberId = request.getParameter("memberId");
		String fileName= request.getParameter("idPic");
	
		String path = getServletContext().getRealPath("/upload/host/"+fileName);
		String msgg="";
		
		int result=new AdminService().deleteHost(memberNo);
		
		if(result>0) {
			
			File file = new File(path);
			if( file.exists() ){ 
				if(file.delete()){ 
					System.out.println("파일삭제 성공"); 
				}else{ 
					System.out.println("파일삭제 실패"); 
				} 
			}else{ 
				System.out.println("파일이 존재하지 않습니다."); 
			}
			
			String host="smtp.naver.com";
			String user="tnrud2668@naver.com";
			String password="spdlqj7547";
			
			String sendEmail=memberId;
			
			//smtp 서버 설정
			Properties props = new Properties();
	        props.put("mail.smtp.host", host);
	        props.put("mail.smtp.port", 465);
	        props.put("mail.smtp.auth", "true");
	        props.put("mail.smtp.ssl.enable", "true");
	        props.put("mail.smtp.starttls.enable","true");
	        props.put("mail.smtp.ssl.trust", "smtp.naver.com");
	        
	        Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
	            protected PasswordAuthentication getPasswordAuthentication() {
	                return new PasswordAuthentication(user,password);
	            }
	        });
	        
	        try {
	            MimeMessage msg = new MimeMessage(session);
	            msg.setFrom(new InternetAddress(user, "BINBANG"));
	            msg.addRecipient(Message.RecipientType.TO, new InternetAddress(sendEmail));
	            
	            msg.setSubject("빈방입니다. 호스트 승인 거절 안내드립니다.");
	            msg.setText("안녕하세요 빈방입니다.\n\r 아쉽지만 호스트 승인이 거절되었습니다. 다음과 같은 항목을 확인해주세요. \n\r \n\r "
	            		+ "- 적절하지 않은 신분증 사진 또는 프로필 사진 입력  \n\r - 이전에 호스트 블랙리스트가 된 이력이 있을 경우  \n\r \n\r "
	            		+ "블랙리스트가 아닌 경우 다시 호스트 등록 신청이 가능합니다.");
	            
	            Transport.send(msg);
	            System.out.println("호스트 거절 이메일 전송");
	            
	        }catch (Exception e) {
	            e.printStackTrace();
	        }
	        msgg="호스트 승인 거절이 완료되었습니다.";
		}else {
			msgg="호스트 승인 거절에 실패하였습니다.";
		}
		
		request.setAttribute("msg", msgg);
		request.setAttribute("loc", "/admin/hostAcceptList");
		request.getRequestDispatcher("/views/common/printMsg.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
