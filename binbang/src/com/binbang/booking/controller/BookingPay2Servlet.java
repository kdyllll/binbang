package com.binbang.booking.controller;

import java.io.IOException;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.binbang.booking.model.service.BookingService;
import com.binbang.booking.model.vo.Booking;
import com.binbang.house.model.service.HouseService;
import com.binbang.house.model.vo.House;
import com.binbang.member.model.vo.Member;


/**
 * Servlet implementation class BookingPay2Servlet
 */
@WebServlet("/booking/bookingPayBank")
public class BookingPay2Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BookingPay2Servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @param session 
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub


		
		String memberNo=request.getParameter("m");
		String no=request.getParameter("houseNo");	
		String in=request.getParameter("checkIn");
		String out1=request.getParameter("checkOut");
		int price=Integer.parseInt(request.getParameter("totalPrice").trim());
		int totalPoint=Integer.parseInt(request.getParameter("totalPoint"));
//		내가 사용한 포인트
		int totalPoints=Integer.parseInt(request.getParameter("totalPoints"));
		String guestName = request.getParameter("guestName");
		int pnum = Integer.parseInt(request.getParameter("pNum").trim());
		Member m = (Member) request.getSession().getAttribute("m");
	    String pay = request.getParameter("pay").equals("card") ? "신용카드" : "무통장입금";
 
	    Booking b=new Booking();
		
		b.setMemberNo(memberNo);
		b.setHouseNo(no);
		b.setGuestName(guestName);		
		b.setInsertCheckInDate(in);
		b.setInsertCheckOutDate(out1);
		b.setGuestPnum(pnum);
		b.setPaymentOption(pay);
		b.setPrice(price);
		b.setPointMinus(totalPoints);
		b.setPointPlus(totalPoint);
		
		int result =new BookingService().insertReservation(b);
		int mm=new BookingService().insertPoint(memberNo, totalPoint, totalPoints);
			
		
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
	           
	           Session session1 = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
	               protected PasswordAuthentication getPasswordAuthentication() {
	                   return new PasswordAuthentication(user,password);
	               }
	           });
	           
	           try {
	               MimeMessage msg = new MimeMessage(session1);
	               msg.setFrom(new InternetAddress(user, "BINBANG"));
	               msg.addRecipient(Message.RecipientType.TO, new InternetAddress(sendEmail));
	               
	               msg.setSubject("무통장 입금 결제 안내메일입니다.");
	               msg.setText("안녕하세요 빈방입니다.\n\r 무통장 입금 계좌 안내입니다 \n\r예금주 : 인하준\n\r하나은행 207-910269-75307\n\r 총 결제 금액은 ￦"+price+"원 입니다" );
	               
	               Transport.send(msg);
	               System.out.println("이메일 전송");
	               

          }catch (Exception e) {
              e.printStackTrace();
          }
		
	
		
	    
		
		House houseName = new HouseService().selectHouseOne(no);
		request.setAttribute("guestName", guestName);
		request.setAttribute("houseName", houseName.getHouseName());
		request.setAttribute("in", in);
		request.setAttribute("out1", out1);
		request.setAttribute("pnum", pnum);
		request.setAttribute("pay", pay);
		request.setAttribute("price", price);
		request.setAttribute("totalPoint", totalPoint);
		

		request.getRequestDispatcher("/views/booking/reserveInfo.jsp").forward(request, response);
	
	}


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
