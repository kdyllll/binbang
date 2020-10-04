package com.binbang.member.controller;

import java.io.IOException;
import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.binbang.member.model.service.MemberService;
import com.binbang.member.model.vo.Member;

/**
 * Servlet implementation class MemberCheckConfirmNumberServlet
 */
@WebServlet("/member/checkConfirmNumber")
public class MemberCheckConfirmNumberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberCheckConfirmNumberServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String userId = request.getParameter("userId");
		//Member m= new MemberService().memberCheckEmail();
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Properties prop=System.getProperties();
		prop.put("mail.smtp.user", "gkstnr2668");//서버 아이디만 쓰기
		prop.put("mail.smtp.host", "smtp.gmail.com");
		prop.put("mail.smtp.port","465");
		prop.put("mail.smtp.starttls.enable","true");
		prop.put("mail.smtp.auth", "true");
		prop.put("mail.smtp.socketFactory.port", "465");//465
		prop.put("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory");
		prop.put("mail.smtp.socketFactory.fallback", "false");
		
		Authenticator auth= new MyAuthentication();
		
		Session session = Session.getDefaultInstance(prop,auth);
		MimeMessage msg=new MimeMessage(session);
		
		try {
			msg.setSentDate(new Date());
			InternetAddress from = new InternetAddress("빈방");//보내는 사람
			msg.setFrom(from);
			String email=request.getParameter("userId");//이메일 수신자.사용자가 입력한 이메일
			InternetAddress to=new InternetAddress(email);
			msg.setRecipient(Message.RecipientType.TO, to);
			msg.setSubject("빈방 인증번호","UTF-8"); //이메일 제목
			String code=request.getParameter("confirmNumber");//인증번호 값 받기
			request.setAttribute("code",code);
			msg.setHeader("content-Type", "text/html");
			javax.mail.Transport.send(msg);
			System.out.println("전송!");
			
		}catch(AddressException e) {
			e.printStackTrace();
		}catch(MessagingException e) {
			e.printStackTrace();
		}
		request.getRequestDispatcher("/views/member/findPassword.jsp").forward(request, response);
	}
}

class MyAuthentication extends Authenticator{
	PasswordAuthentication pa;
	
	public MyAuthentication() {
		String id="gkstnr2668@gmail.com";
		String pw="whdgkq7547~";
		pa=new PasswordAuthentication(id, pw);
		
	}
	
	public PasswordAuthentication getPasswordAuthentication() {
		return pa;
	}
}
