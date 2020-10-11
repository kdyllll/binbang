package com.binbang.host.controller;

import java.io.IOException;
import java.sql.Date;
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

import com.binbang.booking.model.service.BookingService;
import com.binbang.house.model.service.HouseService;

/**
 * Servlet implementation class HouseRequestAcceptServlet
 */
@WebServlet("/host/houseRequestAccept")
public class HouseRequestAcceptServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HouseRequestAcceptServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String reservNo = request.getParameter("reservNo");
		int result = new BookingService().acceptBooking(reservNo);
		
		String houseName = request.getParameter("houseName");
		String checkIn = request.getParameter("checkIn");
		String checkOut = request.getParameter("checkIn");
		
		String userId = request.getParameter("email");				
		//임시변수
		String sendEmail=userId;
				
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
        
        
        //메일로 보낼 메세지
        try {
            MimeMessage msg = new MimeMessage(session);
            msg.setFrom(new InternetAddress(user, "BINBANG"));
            msg.addRecipient(Message.RecipientType.TO, new InternetAddress(sendEmail));
                        
            msg.setSubject(houseName+"숙소 예약이 완료되었습니다.");            
            msg.setText("안녕하세요 빈방입니다. 숙소" + houseName +"의 예약이 완료되었습니다.예약일은 "+checkIn+"~"+checkOut+"일 입니다." );            
            Transport.send(msg);            
            
        }catch (Exception e) {
            e.printStackTrace();
        }
		
		request.setAttribute("loc", "/host/houseRequestAjax");
		request.getRequestDispatcher("/host/hostDetail").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
