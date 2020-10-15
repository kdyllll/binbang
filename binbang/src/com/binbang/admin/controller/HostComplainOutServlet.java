package com.binbang.admin.controller;

import java.io.IOException;
import java.util.List;
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

import com.binbang.admin.model.service.AdminService;
import com.binbang.member.model.vo.Complaint;

/**
 * Servlet implementation class HostComplainOutServlet
 */
@WebServlet("/admin/hostComplainOut")
public class HostComplainOutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HostComplainOutServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String hostNo=request.getParameter("hostNo");
		int result=new AdminService().hostOut(hostNo);
		
		
		String memberEmail=request.getParameter("memberEmail");
		String hostEmail=new AdminService().selectHostEmail(hostNo);
		
		if(result>0) {
			String host="smtp.naver.com";
			String user="tnrud2668@naver.com";
			String password="spdlqj7547";
			
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
	        	//신고한 회원에게
	            MimeMessage msg3 = new MimeMessage(session);
	            msg3.setFrom(new InternetAddress(user, "BINBANG"));
	            msg3.addRecipient(Message.RecipientType.TO, new InternetAddress(memberEmail));
	            
	            msg3.setSubject("신고 처리에 대해 안내드립니다.");
	            msg3.setText("안녕하세요 빈방입니다.\n\r 신고 처리에 대해 해당 호스트의 권한이 박탈 되었음을 알려드립니다. \n\r 불편을 끼쳐드려 죄송합니다.\n\r기타 문의사항이 있으시면 관리자(TEL.1234-5678)에게 연락바랍니다.\n\r 보다 더 나은 빈방이 되도록 노력하겠습니다. 감사합니다. ");
	            
	            Transport.send(msg3);
	            System.out.println("회원에게 신고  이메일 전송");
	            
	            //호스트에게
	            MimeMessage msg2 = new MimeMessage(session);
	            msg2.setFrom(new InternetAddress(user, "BINBANG"));
	            msg2.addRecipient(Message.RecipientType.TO, new InternetAddress(hostEmail));
	            
	            msg2.setSubject("호스트 권한이 박탈됨을 안내드립니다.");
	            msg2.setText("안녕하세요 빈방입니다.\n\r 호스트님께 신고가 접수되어 안내드립니다. \n\r\n\r 신고 내용에 따라 호스트 권한 박털 처리가 되었음을 알려드립니다.\n\r\n\r 권한 박탈 처리 기준은 다음과 같습니다.\n\r-총 신고 횟수가 10번이 된 경우 \n\r -숙소 이용객에게 큰 피해를 주거나 범죄 등과 관련된 경우  \n\r -허위 정보로 가입된 사실이 적발된 경우 등 \n\r호스트 권한이 박탈 된 경우 호스트 재등록은 불가능하나 회원으로 이용은 가능합니다. 기타 문의사항이 있으시면 관리자(TEL.1234-5678)에게 연락바랍니다.\n\r");
	            
	            Transport.send(msg2);
	            System.out.println("호스트 권한 박탈 이메일 전송");
	            
	        }catch (Exception e) {
	            e.printStackTrace();
	        }
		}
		
		String complaintNo=request.getParameter("complaintNo");
		String msg="권한박탈";
		int result2=new AdminService().acceptHostComplainState(complaintNo,msg);
		
		List<Complaint> list = new AdminService().complainList();
		request.setAttribute("list",list);
		request.getRequestDispatcher("/views/admin/hostComplainList.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
