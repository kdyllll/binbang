package com.binbang.member.controller;

import java.io.IOException;
import java.util.Properties;
import java.util.Random;

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

import com.binbang.member.model.service.MemberService;
import com.binbang.member.model.vo.Member;

/**
 * Servlet implementation class MemberCheckConfirmNumberServlet
 */
@WebServlet("/member/checkConfirmNumber")
public class LoginSendEmailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginSendEmailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
//		String email=null;
		String userId = request.getParameter("email");
		Member m=new MemberService().selectInfo(userId);
//		email= new MemberService().emailCheck(userId);
		System.out.println("서블릿"+userId);
		   
//		
//		String mesg="";
//		String loc="";
//		
//		if(m==null||!m.getEmail().equals(userId)) {
//			
//			mesg="아이디 정보가 일치하지 않습니다.";
//			loc="/member/findPassword";
//			
//			request.setAttribute("msg",mesg);
//			request.setAttribute("loc", loc);
//			request.getRequestDispatcher("/views/common/printMsg.jsp").forward(request, response);
//			System.out.println("아이디 일치하지않음");
//		} 
//		else {
//			System.out.println("아이디 일치함");
//			mesg="인증에 성공했습니다.";
//			loc="/member/changePassword";
//			request.setAttribute("msg",mesg);
//			request.setAttribute("loc", loc);
//			request.getRequestDispatcher("/views/common/printMsg.jsp").forward(request, response);
			
		if(m!=null && m.getEmail().equals(userId)) {	
	
		String host="smtp.naver.com";
		String user="tnrud2668@naver.com";
		String password="spdlqj7547";
		
		String sendEmail=m.getEmail();
		
		//smtp 서버 설정
		Properties props = new Properties();
        props.put("mail.smtp.host", host);
        props.put("mail.smtp.port", 465);
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.ssl.enable", "true");
        props.put("mail.smtp.starttls.enable","true");
        props.put("mail.smtp.ssl.trust", "smtp.naver.com"); 
//        props.put("mail.debug", "true"); 
        
        StringBuffer temp =new StringBuffer();
        Random rnd = new Random();
        for(int i=0;i<10;i++)
        {
            int rIndex = rnd.nextInt(3);
            switch (rIndex) {
            case 0:
                // a-z
                temp.append((char) ((int) (rnd.nextInt(26)) + 97));
                break;
            case 1:
                // A-Z
                temp.append((char) ((int) (rnd.nextInt(26)) + 65));
                break;
            case 2:
                // 0-9
                temp.append((rnd.nextInt(10)));
                break;
            }
        }
        String AuthenticationKey = temp.toString();
        System.out.println(AuthenticationKey);
        
        Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(user,password);
            }
        });
        
        try {
            MimeMessage msg = new MimeMessage(session);
            msg.setFrom(new InternetAddress(user, "BINBANG"));
            msg.addRecipient(Message.RecipientType.TO, new InternetAddress(sendEmail));
            
            //메일 제목
            msg.setSubject("빈방 인증 메일입니다.");
            //메일 내용
            msg.setText("안녕하세요 빈방입니다. 인증 번호는 "+temp+"입니다.");
            
            Transport.send(msg);
            System.out.println("이메일 전송");
            
        }catch (Exception e) {
            e.printStackTrace();// TODO: handle exception
        }
        HttpSession saveKey = request.getSession();
        saveKey.setAttribute("AuthenticationKey", AuthenticationKey);
        
        HttpSession saveId = request.getSession();
        saveId.setAttribute("userId", userId);
        
//        request.setAttribute(name, o);
        
		} else if((m==null||!m.getEmail().equals(userId))){
			
			System.out.println("아이디 일치하지않음");
//			String mesg="";
//			String loc="";
//		
//				
//			mesg="아이디 정보가 일치하지 않습니다.";
//			loc="/member/findPassword";
//			
			request.setAttribute("msg","아이디 정보가 일치하지 않습니다.");
			request.setAttribute("loc", "/member/findPassword");
			request.getRequestDispatcher("/views/common/printMsg.jsp").forward(request, response);
			
			
		}
//		request.getRequestDispatcher("/views/member.findPasswordAjax.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
