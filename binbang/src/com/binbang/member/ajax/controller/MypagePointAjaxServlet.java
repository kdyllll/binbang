package com.binbang.member.ajax.controller;

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
 * Servlet implementation class MypageCouponAjaxServlet
 */
@WebServlet("/mypage/mypagePointAjax")
public class MypagePointAjaxServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MypagePointAjaxServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		  		  
		String memberNo= request.getParameter("memberNo");				
		
		List<Booking> list = new BookingService().reservePointList(memberNo);
		for(int i = 0 ; i< list.size(); i++) {
			System.out.println(list.get(i));
		}
		 request.setAttribute("list",list);
		request.getRequestDispatcher("/ajax/member/myPagePointAjax.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
