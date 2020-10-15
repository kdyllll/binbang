package com.binbang.booking.controller;

import java.io.IOException;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
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
 * Servlet implementation class BookingReservationServlet
 */
@WebServlet("/booking/reservation")
public class BookingReservationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BookingReservationServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
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
		int pnum = Integer.parseInt(request.getParameter("pnum").trim());
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
		//booking넣기
		int result =new BookingService().insertReservation(b);
		//멤버에 적립금 너기
		int m=new BookingService().insertPoint(memberNo, totalPoint, totalPoints);
		//숙소이름
		
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
