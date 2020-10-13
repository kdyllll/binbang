package com.binbang.booking.controller;

import java.io.IOException;

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
		String finalPoint=request.getParameter("finalPoint");
		House h=new HouseService().HouseDetail(no);
		
		Booking b=new HouseService().insertReservation(no);
		String lastPoint = totalPoint + totalPoints;
		/*
		 * Member m3 = new Member(); m3.setMemberNo(request.getParameter("m"));
		 * m3.setTotalPoint(Integer.parseInt(request.getParameter("finalPoint")));
		 */
		int m=new HouseService().insertPoint(memberNo, lastPoint);
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
	   

		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
