package com.binbang.house.ajax.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.binbang.house.model.service.HouseService;
import com.binbang.house.model.vo.House;
import com.binbang.member.model.service.MemberService;
import com.binbang.member.model.vo.Favorite;
import com.binbang.member.model.vo.Member;

/**
 * Servlet implementation class HouseSearchAjaxServlet
 */
@WebServlet("/house/houseSearchAjax")
public class HouseSearchAjaxServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HouseSearchAjaxServlet() {
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
		
		//하우스 목록 검색한 기준에 맞춰 가져와야함(일단은 임시로 다 가져오기)
		List<House> house=new HouseService().selectHouseAll();
		
		
		
		//관심숙소 목록
		List<Favorite> favorite=new MemberService().selectFavList(m);	
		
		for(House h:house) {
			//사진 House객체에 넣기
			h.setHousePicture(new HouseService().selectMainPicture(h));
			
			
			//평균평점
			h.setAvgGrade(new HouseService().selectAvgGrade(h.getHouseNo()));
			
			//성수기 기간 House객체에 넣기
			h.setPeakDay1(new HouseService().selectPeakDay(h,"S1"));
			h.setPeakDay2(new HouseService().selectPeakDay(h,"S2"));
			h.setPeakDay3(new HouseService().selectPeakDay(h,"S3"));
			h.setPeakDay4(new HouseService().selectPeakDay(h,"S4"));
			h.setPeakDay5(new HouseService().selectPeakDay(h,"S5"));
		}
		
		request.setAttribute("house", house);
		request.setAttribute("favorite", favorite);
			
		request.getRequestDispatcher("/ajax/house/houseSearchAjax.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
