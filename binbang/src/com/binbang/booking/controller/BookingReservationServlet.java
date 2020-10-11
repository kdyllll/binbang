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
		
		String no=request.getParameter("houseNo");
		String in=request.getParameter("checkIn");
		String out1=request.getParameter("checkOut");
		String price=request.getParameter("totalPrice");
		
		House h=new HouseService().HouseDetail(no);
		Booking b=new HouseService().selectReservation(no);
		
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
		request.setAttribute("house",h);
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
