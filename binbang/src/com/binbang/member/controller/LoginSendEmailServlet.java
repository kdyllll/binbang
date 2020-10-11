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

import org.json.simple.JSONObject;

import com.binbang.member.model.service.MemberService;
import com.binbang.member.model.vo.Member;
import com.google.gson.Gson;

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
		

		String userId = request.getParameter("email");
		Member m=new MemberService().selectInfo(userId);
		System.out.println("서블릿"+userId);
		
		JSONObject emailConfirm= new JSONObject();
		
		int result=0;
		String mesg="";
		String loc="";

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
//  		props.put("mail.debug", "true"); 
	        
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
	        
	        System.out.println("인증번호 발송");
	        mesg="인증번호가 발송되었습니다.";
			result=1;
			
        
		} else if((m==null||!m.getEmail().equals(userId))){
			
			System.out.println("아이디 일치하지않음");
	
			mesg="아이디 정보가 일치하지 않습니다.";
			result=0;
			
		}
		emailConfirm.put("msg",mesg);
		emailConfirm.put("result",result);
		response.getWriter().print(emailConfirm);
//		response.setContentType("application/json;charset=utf-8");
//		new Gson().toJson(emailConfirm,response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
