package com.binbang.house.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
