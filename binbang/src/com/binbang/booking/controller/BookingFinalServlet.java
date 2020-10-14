package com.binbang.booking.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class BookingFinalServlet
 */
@WebServlet("/booking/bookingFinal")
public class BookingFinalServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BookingFinalServlet() {
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
		String totalPoint=request.getParameter("totalPoint");
		String oriPrice=request.getParameter("originalPrice");
		String totalPoints = request.getParameter("totalPoints");
		String memberNo=request.getParameter("m");
		String guestName = request.getParameter("guestName");
		System.out.println(no);
	
		request.setAttribute("houseNo",no);
		request.setAttribute("checkIn",in);
		request.setAttribute("checkOut",out1);
		request.setAttribute("totalPrice",price);
		request.setAttribute("oriPrice",oriPrice);
		request.setAttribute("totalPoint",totalPoint);
		request.setAttribute("totalPoints",totalPoints);
		request.setAttribute("guestName", guestName);
		request.setAttribute("m",memberNo);
		request.getRequestDispatcher("/views/booking/pay.jsp?houseNo="+no).forward(request,response);
		System.out.println("2번쨰"+no);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
