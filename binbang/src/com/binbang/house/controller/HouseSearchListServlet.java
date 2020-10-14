package com.binbang.house.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
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
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String location = request.getParameter("search"); // 검색 장소
		String checkIn = (request.getParameter("checkIn")).trim();
		String checkOut = (request.getParameter("checkOut")).trim();
		List dayList = dateCalculator(checkIn, checkOut); // 숙박 날짜들
		String pNum = request.getParameter("peopleNum"); // 숙박 인원

		// paging처리하기
		int cPage;
		try {
			cPage = Integer.parseInt(request.getParameter("cPage"));
		} catch (NumberFormatException e) {
			cPage = 1;
		}
		int numPerPage = 9;

		// ------------------------------------------------------------------------
		// 검색 기준에 맞는 숙소 리스트
		List<House> house = new HouseService().selectHouseList(location, checkIn, checkOut, pNum, cPage, numPerPage);
		// 데이터 갯수 세기
		int totalData = house.size();
		// ------------------------------------------------------------------------

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
		HttpSession session = request.getSession(false);
		try {
			Member m = (Member) session.getAttribute("m");
			// 관심숙소 목록
			List<Favorite> favorite = new MemberService().selectFavList(m);
			
//			  for (Favorite ff : favorite) { System.out.println("관심숙소:" + ff); }
			 
			request.setAttribute("favorite", favorite);
			request.setAttribute("favoriteJson", new Gson().toJson(favorite));
		} catch (NullPointerException e) {

		}

		for (House h : house) {
			// 사진 House객체에 넣기
			h.setHousePicture(new HouseService().selectMainPicture(h));

			// 평균평점
			h.setAvgGrade(new HouseService().selectAvgGrade(h.getHouseNo()));

			// 성수기 기간 House객체에 넣기
			h.setPeakDay1(new HouseService().selectPeakDay(h, "S1"));
			h.setPeakDay2(new HouseService().selectPeakDay(h, "S2"));
			h.setPeakDay3(new HouseService().selectPeakDay(h, "S3"));
			h.setPeakDay4(new HouseService().selectPeakDay(h, "S4"));
			h.setPeakDay5(new HouseService().selectPeakDay(h, "S5"));
			List totalPeak = new ArrayList();
			totalPeak.addAll(h.getPeakDay1());
			totalPeak.addAll(h.getPeakDay2());
			totalPeak.addAll(h.getPeakDay3());
			totalPeak.addAll(h.getPeakDay4());
			totalPeak.addAll(h.getPeakDay5());
			h.setTotalPeak(totalPeak);

			// 필터
			h.setFilter(new HouseService().selectFilterList(h.getHouseNo()));
			//System.out.println(h.getFilter());
			
			//총 요금
			//총요금과 날짜 구하는 식
			int total=0;
			
			//주말인지 평일인지 //성수기인지 비수기인지
			money : for (Object o : dayList) {
				String day = (String) o; //숙박 날짜 하루하루		
				//요일 구하기
				SimpleDateFormat form = new SimpleDateFormat("yyyy/MM/dd");
				try {
					Date date = form.parse(day);				
					Calendar c = Calendar.getInstance();
					c.setTime(date);
					int dayNum = c.get(Calendar.DAY_OF_WEEK);//6,7이라면 금,토	//여기까지 요일 구하기
					if (dayNum == 6 || dayNum == 7) {//주말(금토)이라면
						if(h.getTotalPeak()!=null) {//성수기 기간이 있다면
							for (Object o1 : h.getTotalPeak()) { 
								String pDay = "20"+(String) o1;
								if (pDay.equals(day)) {//성수기(주말)라면
									total+=h.getPricePeakWeekend();
									continue money;
								}
							}
							total+=h.getPriceWeekend();//성수기 기간에 해당되지 않는다면
						}else{
							total+=h.getPriceWeekend();//성수기 기간이 없다면
						}
												
					}else{//평일이라면	
						if(h.getTotalPeak()!=null) {//성수기 기간이 있다면
							for (Object o1 : h.getTotalPeak()) { 
								String pDay = "20"+(String) o1;
								if (pDay.equals(day)) {//성수기(평일)라면
									total+=h.getPricePeakDay();
									continue money;
								}
							}
							total+=h.getPriceDay(); //성수기 기간에 해당되지 않는다면
						}else{
							total+=h.getPriceDay(); //성수기 기간이 없다면
						}
					}
				} catch (ParseException e) {
					e.printStackTrace();
				}
			}	
			h.setTotalPrice(total);	
	
			}
			

		request.setAttribute("house", house);
		request.setAttribute("checkIn", checkIn);
		request.setAttribute("checkOut", checkOut);
		request.setAttribute("houseJson", new Gson().toJson(house));
		request.setAttribute("dayJson", new Gson().toJson(dayList));
		request.getRequestDispatcher("/views/house/houseSearch.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

//	날짜 계산 로직(체크인 날짜부터 체크아웃 직전날짜까지 List로 담아줌)
	public List dateCalculator(String day1, String day2) {
		// 시작날짜 캘린더형
		String sDay = day1.trim();
		List list = new ArrayList();
		String[] Date = sDay.split("/");
		int[] Date2 = new int[Date.length];
		try {
			for (int i = 0; i < Date.length; i++) {
				Date2[i] = Integer.parseInt(Date[i]);
			}
		} catch (NumberFormatException e) {
			e.printStackTrace();
		}
		Calendar start = Calendar.getInstance();
		start.set(Calendar.YEAR, Date2[0]);
		start.set(Calendar.MONTH, Date2[1]);
		start.set(Calendar.DATE, Date2[2]);

		// 끝날짜 캘린더형
		String eDay = day2.trim();
		String[] eDate = eDay.split("/");
		int[] eDate2 = new int[eDate.length];
		try {
			for (int i = 0; i < eDate.length; i++) {
				eDate2[i] = Integer.parseInt(eDate[i]);
			}
		} catch (NumberFormatException e) {
			e.printStackTrace();
		}
		Calendar end = Calendar.getInstance();
		end.set(Calendar.YEAR, eDate2[0]);
		end.set(Calendar.MONTH, eDate2[1]);
		end.set(Calendar.DATE, eDate2[2]);

		Long cal = end.getTimeInMillis() - start.getTimeInMillis();
		int cal2 = (int) (cal / (1000 * 60 * 60));
		int cal3 = Math.abs(cal2);
		int day = cal3 / 24; // 날짜 수

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
		Calendar c = Calendar.getInstance();
		Date date1;
		try {
			date1 = sdf.parse(day1);
			c.setTime(date1);// 첫번째 체크인 날짜
		} catch (ParseException e) {
			e.printStackTrace();
		}

		for (int i = 0; i < day; i++) {
			String days = sdf.format(c.getTime());
			list.add(days);
			c.add(Calendar.DATE, 1);
		}

		return list;
	}

}
