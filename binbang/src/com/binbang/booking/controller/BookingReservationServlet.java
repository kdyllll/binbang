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
		String price=request.getParameter("totalPrice");
		String totalPoint=request.getParameter("totalPoint");
		String totalPoints=request.getParameter("totalPoints");
		String guestName = request.getParameter("guestName");

		Booking b=new Booking();
		
		b.setMemberNo(memberNo);
		b.setHouseNo(no);
		b.setGuestName(request.getParameter("guestName"));

		b.setInsertCheckInDate(in);
		b.setInsertCheckOutDate(out1);

		b.setGuestPnum(Integer.parseInt(request.getParameter("guestPnum")));
		b.setPaymentOption(request.getParameter("paymentOption"));
		b.setPrice(Integer.parseInt(price));
		b.setPointMinus(Integer.parseInt(request.getParameter("pointMinus")));
		//booking넣기
		int result =new HouseService().insertReservation(no,b);
		
		/*
		String lastPoint = totalPoint + totalPoints;
		
		int m=new HouseService().insertPoint(memberNo, lastPoint);
		System.out.println(m);
		
		System.out.println("이건 m 이야"+lastPoint);
		System.out.println("레저베이션 서블릿"+memberNo);
		
		String msg="";
		String loc="";
		String path="/views/booking/reserveInfo.jsp";
		
		if(h==null) {
			msg="선택한 숙소가 존재하지 않습니다.";
			loc="/house/houseSearch";
			path="/views/common/msg.jsp";
			request.setAttribute("msg",msg);
			request.setAttribute("loc",loc);
		}
		
		request.setAttribute("checkIn",in);
		request.setAttribute("checkOut",out1);
		request.setAttribute("totalPrice",price);
		request.setAttribute("totalPoint",totalPoint);
		request.setAttribute("totalPoints",totalPoints);
		request.setAttribute("house",h);
		request.setAttribute("member",m);
		request.setAttribute("m",memberNo);
		request.setAttribute("booking",b);
		request.getRequestDispatcher(path).forward(request, response);
	   */

		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
