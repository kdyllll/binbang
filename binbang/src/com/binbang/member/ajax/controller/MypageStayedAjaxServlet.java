package com.binbang.member.ajax.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.binbang.booking.model.service.BookingService;
import com.binbang.booking.model.vo.Booking;
import com.binbang.house.model.service.HouseService;
import com.binbang.house.model.vo.House;
import com.binbang.member.model.vo.Member;

/**
 * Servlet implementation class MypageMainAjaxServlet
 */
@WebServlet("/member/mypageStayedAjax")
public class MypageStayedAjaxServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MypageStayedAjaxServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*
		 * HttpSession session = request.getSession(false); Member m =
		 * (Member)session.getAttribute("m"); List<Booking> reserveList = new
		 * BookingService().reserveDoneList(m.getMemberNo());
		 * System.out.println(reserveList); request.setAttribute("reserveList",
		 * reserveList);
		 */
		request.getRequestDispatcher("/ajax/member/myPageStayedAjax.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
