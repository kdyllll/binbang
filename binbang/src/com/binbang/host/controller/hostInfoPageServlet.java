package com.binbang.host.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.binbang.booking.model.vo.Booking;
import com.binbang.host.model.service.HostService;
import com.binbang.host.model.vo.Host;
import com.binbang.house.model.service.HouseService;
import com.binbang.house.model.vo.House;
import com.binbang.house.model.vo.Review;
import com.binbang.member.model.vo.Member;

/**
 * Servlet implementation class hostInfoPageServlet
 */
@WebServlet("/hostInfoPage")
public class hostInfoPageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public hostInfoPageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session =request.getSession();
		Member m = (Member)session.getAttribute("m");
		String hostNo = request.getParameter("hostNo");
		System.out.println(hostNo);
		Host h = new HostService().selectHostInfo(hostNo);
		//house
		List<House> list= new HouseService().selectHostHouse(hostNo);
		//리뷰
		List<Review> reviewList = new HostService().selectHostReview(hostNo);
		//로그인한 멤버가 이 호스트의 숙소들 중 이용한 숙소
		List<House> myHouse = null;
		if(m!=null) {
			myHouse = new HouseService().selectmyHouse(hostNo, m.getMemberNo());
		}
		System.out.println("h :"+h);
		System.out.println(list);
		request.setAttribute("host", h);
		request.setAttribute("list", list);
		request.setAttribute("myHouse", myHouse);
		System.out.println(myHouse);
		request.setAttribute("reviewList", reviewList);
		request.getRequestDispatcher("/views/host/hostInfoPage.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
