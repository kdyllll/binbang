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

import com.binbang.admin.model.service.AdminService;
import com.binbang.member.model.vo.Complaint;

/**
 * Servlet implementation class HostComplainRejectServlet
 */
@WebServlet("/admin/hostComplainReject")
public class HostComplainRejectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HostComplainRejectServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String memberEmail=request.getParameter("memberEmail");
		String hostNo=request.getParameter("hostNo");
		String hostEmail=new AdminService().selectHostEmail(hostNo);
	
		
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
            MimeMessage msg = new MimeMessage(session);
            msg.setFrom(new InternetAddress(user, "BINBANG"));
            msg.addRecipient(Message.RecipientType.TO, new InternetAddress(memberEmail));
            
            msg.setSubject("신고 처리에 대해 안내드립니다.");
            msg.setText("안녕하세요 빈방입니다.\n\r 신고 처리에 대해 해당 호스트에게 연락 및 경고 조치를 취했습니다. \n\r 기타 문의사항이 있으시면 관리자(TEL.1234-5678)에게 연락바랍니다.\n\r 보다 더 나은 빈방이 되도록 노력하겠습니다. 감사합니다. ");
            
            Transport.send(msg);
            System.out.println("회원에게 신고 거절 이메일 전송");
            
            //호스트에게
            MimeMessage msg2 = new MimeMessage(session);
            msg2.setFrom(new InternetAddress(user, "BINBANG"));
            msg2.addRecipient(Message.RecipientType.TO, new InternetAddress(hostEmail));
            
            msg2.setSubject("신고 접수에 대해 안내드립니다.");
            msg2.setText("안녕하세요 빈방입니다.\n\r 호스트님께 신고가 접수되어 안내드립니다. \n\r 해당 신고사항은 거절 처리가 되었음을 알려드립니다.\n\r 기타 문의사항이 있으시면 관리자(TEL.1234-5678)에게 연락바랍니다.\n\r 호스트님과 함께 더 나은 빈방을 만들어 나가길 바랍니다. 감사합니다. ");
            
            Transport.send(msg2);
            System.out.println("호스트에게 신고 거절 이메일 전송");
            
        }catch (Exception e) {
            e.printStackTrace();
        }
        
        String complaintNo=request.getParameter("complaintNo");
        String msg="거절";
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
