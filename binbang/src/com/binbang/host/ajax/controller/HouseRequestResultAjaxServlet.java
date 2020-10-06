package com.binbang.host.ajax.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.binbang.booking.model.service.BookingService;
import com.binbang.booking.model.vo.Booking;
import com.binbang.member.model.vo.Member;

/**
 * Servlet implementation class HouseRequestResultAjaxServlet
 */
@WebServlet("/host/houseRequestResultAjax")
public class HouseRequestResultAjaxServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HouseRequestResultAjaxServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession(false);
		Member m = (Member)session.getAttribute("m");
		List<Booking> list = new BookingService().selectHouseRequestResultList(m.getHostNo());
		request.setAttribute("list", list);
		request.getRequestDispatcher("/ajax/house/houseRequestResult.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
