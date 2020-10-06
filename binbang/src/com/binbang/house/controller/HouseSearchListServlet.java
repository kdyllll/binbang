package com.binbang.house.controller;

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
import com.google.gson.Gson;

/**
 * Servlet implementation class HouseSearchListServlet
 */
@WebServlet("/house/houseSearchList")
public class HouseSearchListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HouseSearchListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession(false);
		
		// paging처리하기
		int cPage;
		try {
			cPage = Integer.parseInt(request.getParameter("cPage"));

		} catch (NumberFormatException e) {
			cPage = 1;
		}
		int numPerPage = 9;
		
		//------------------------------------------------------------------------
		//하우스 목록 검색한 기준에 맞춰 가져와야함(일단은 임시로 다 가져오기)
		List<House> house=new HouseService().selectHouseAll(cPage, numPerPage);
		//데이터 갯수 세기
		int totalData = new HouseService().houseCount();
		//------------------------------------------------------------------------
		
		int totalPage = (int) Math.ceil((double) totalData / numPerPage);

		int pageBarSize = 5;

		int pageNo = ((cPage - 1) / pageBarSize) * pageBarSize + 1;
		int pageEnd = pageNo + pageBarSize - 1;

		String pageBar = "";
		if (pageNo == 1) {
			pageBar += " ◁ ";
		} else {
			pageBar += "<a href='" + request.getContextPath() + "/notice/noticeList?cPage=" + (pageNo - 1)
					+ "'> ◀ </a>";
		}

		while (!(pageNo > pageEnd || pageNo > totalPage)) {
			if (pageNo == cPage) {
				pageBar += "<span>" + pageNo + "</span>";
			} else {
				pageBar += "<a href='" + request.getContextPath() + "/notice/noticeList?cPage=" + pageNo + "'>" + pageNo
						+ "</a>";
			}
			pageNo++;
		}

		if (pageNo > totalPage) {
			pageBar += " ▷ ";
		} else {
			pageBar += "<a href='" + request.getContextPath() + "/notice/noticeList?cPage=" + pageNo + "'> ▶ </a>";
		}
		request.setAttribute("pageBar", pageBar);

		try {
		Member m = (Member)session.getAttribute("m");
		//관심숙소 목록
		List<Favorite> favorite=new MemberService().selectFavList(m);	
		for(Favorite ff:favorite) {
			System.out.println("관심숙소:"+ff);	
		}
		request.setAttribute("favorite", favorite);
		}catch(NullPointerException e) {
			
		}
		
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
		
		//총금액(여기서 받아주면 좋겠는데....음)
		
		//필터
		
		
		request.setAttribute("house", house);
		request.setAttribute("houseJson", new Gson().toJson(house));
		request.getRequestDispatcher("/views/house/houseSearch.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
