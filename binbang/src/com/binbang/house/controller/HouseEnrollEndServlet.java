package com.binbang.house.controller;

import java.io.File;
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

import com.binbang.house.model.service.HouseService;
import com.binbang.house.model.vo.House;
import com.binbang.member.model.vo.Member;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * Servlet implementation class HouseEnrollEndServlet
 */
@WebServlet("/house/houseEnrollEnd")
public class HouseEnrollEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public HouseEnrollEndServlet() {
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

		String path = getServletContext().getRealPath("/upload/house");
		File dir=new File(path);
		if(!dir.exists()) dir.mkdirs();
		int maxSize = 1024 * 1024 * 50;
		String encode = "UTF-8";
		DefaultFileRenamePolicy rename = new DefaultFileRenamePolicy();
		MultipartRequest mr = new MultipartRequest(request, path, maxSize, encode, rename);

		House h = new House();
		h.setHostNo(mr.getParameter("loginHost"));// 호스트번호
		h.setHouseName(mr.getParameter("hName"));// 숙소이름
		h.setHouseType(mr.getParameter("hType"));// 숙소타입
		
		String location = mr.getParameter("roadAddress") + " " + mr.getParameter("detailAddress");
		h.setHouseLocation(location);// 숙소 위치
		
		h.setHousePnum(Integer.parseInt(mr.getParameter("pNum")));// 숙소 최대인원
		h.setpObjects(mr.getParameter("personal"));// 개인물건 유무
		h.setRoomNum(Integer.parseInt(mr.getParameter("roomNum")));// 방갯수
		h.setBedNum(Integer.parseInt(mr.getParameter("bedNum")));// 침대 갯수
		h.setBathNum(Integer.parseInt(mr.getParameter("bathNum")));// 욕실 갯수
		h.setHouseComment(mr.getParameter("explain"));// 설명
		h.setHouseGemsung(mr.getParameter("gemsung"));// 감성글
		h.setAttention(mr.getParameter("attention"));// 주의사항
		h.setInoutTime(mr.getParameter("checkTime"));// 체크인아웃시간
		h.setAmenity(mr.getParameter("amenity"));
		h.setEquipment(mr.getParameter("equipment"));
		
		// 성수기 기간
		String Day1 = mr.getParameter("startDay1");
		String Day2 = mr.getParameter("endDay1");
		String sDay = Day1.trim();
		String eDay = Day2.trim();
		if (!sDay.isEmpty() && !eDay.isEmpty()) {
			h.setPeakDay1(dateCalculator(sDay, eDay));
		} else {
			h.setPeakDay1(null);
		}
		Day1 = mr.getParameter("startDay2");
		Day2 = mr.getParameter("endDay2");
		sDay = Day1.trim();
		eDay = Day2.trim();
		if (!sDay.isEmpty() && !eDay.isEmpty()) {
			h.setPeakDay2(dateCalculator(sDay, eDay));
		} else {
			h.setPeakDay2(null);
		}
		Day1 = mr.getParameter("startDay3");
		Day2 = mr.getParameter("endDay3");
		sDay = Day1.trim();
		eDay = Day2.trim();
		if (!sDay.isEmpty() && !eDay.isEmpty()) {
			h.setPeakDay3(dateCalculator(sDay, eDay));
		} else {
			h.setPeakDay3(null);
		}
		Day1 = mr.getParameter("startDay4");
		Day2 = mr.getParameter("endDay4");
		sDay = Day1.trim();
		eDay = Day2.trim();
		if (!sDay.isEmpty() && !eDay.isEmpty()) {
			h.setPeakDay4(dateCalculator(sDay, eDay));
		} else {
			h.setPeakDay4(null);
		}
		Day1 = mr.getParameter("startDay5");
		Day2 = mr.getParameter("endDay5");
		sDay = Day1.trim();
		eDay = Day2.trim();
		if (!sDay.isEmpty() && !eDay.isEmpty()) {
			h.setPeakDay5(dateCalculator(sDay, eDay));
		} else {
			h.setPeakDay5(null);
		}

		// 요금들
		h.setPriceDay(Integer.parseInt(mr.getParameter("nonPeakDay")));
		h.setPriceWeekend(Integer.parseInt(mr.getParameter("nonPeakRest")));
		h.setPricePeakDay(Integer.parseInt(mr.getParameter("peakDay")));
		h.setPricePeakWeekend(Integer.parseInt(mr.getParameter("peakRest")));
		// 필터
		String[] filter = mr.getParameterValues("filter");
		List filterList=new ArrayList();
		for(int i=0;i<filter.length;i++) {
			filterList.add(filter[i]);
		}
		h.setFilter(filterList);

		// 사진파일
		String[] pic = new String[10];
		for (int i = 0; i < 10; i++) {
			String a = "picture" + (i + 1);
			pic[i] = mr.getFilesystemName(a);
		}
		h.setHousePicture(pic);// 사진 새로운 이름들만

		List<Integer> results = new ArrayList<Integer>();
		results.add(new HouseService().insertHouse(h));
		h.setHouseNo(new HouseService().selectHouseNo(h));
		
		
		for (int i = 0; i < filter.length; i++) {
			results.add(new HouseService().insertFilter(h, filter[i]));
		}
		if (h.getPeakDay1() != null) {
			for (Object peak : h.getPeakDay1()) {
				String p = (String) peak;
				results.add(new HouseService().insertPeak(h, p, "S1"));
			}
		}
		if (h.getPeakDay2() != null) {
			for (Object peak : h.getPeakDay2()) {
				String p = (String) peak;
				results.add(new HouseService().insertPeak(h, p, "S2"));
			}
		}
		if (h.getPeakDay3() != null) {
			for (Object peak : h.getPeakDay3()) {
				String p = (String) peak;
				results.add(new HouseService().insertPeak(h, p, "S3"));
			}
		}
		if (h.getPeakDay4() != null) {
			for (Object peak : h.getPeakDay4()) {
				String p = (String) peak;
				results.add(new HouseService().insertPeak(h, p, "S4"));
			}
		}
		if (h.getPeakDay5() != null) {
			for (Object peak : h.getPeakDay5()) {
				String p = (String) peak;
				results.add(new HouseService().insertPeak(h, p, "S5"));
			}
		}
		
		String type = "";
		for (int i = 0; i < pic.length; i++) {
			if (pic[i] != null) {
				if (i == 0) {
					type = "M";
				} else {
					type = "S";
				}
				results.add(new HouseService().insertPicture(h, pic[i], type));

			}
		}

		String msg = "숙소 정보 등록에 성공했습니다.";
		String loc="/host/hostDetail";
		for(Integer a:results) {
			if(a<=0) {
				msg="숙소 정보 등록에 실패했습니다. 다시 시도하세요";
				loc="/house/houseEnroll";
				
			}
		}
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
		request.getRequestDispatcher("/views/common/printMsg.jsp").forward(request,response);	

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

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
			c.setTime(date1);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		for (int i = 0; i < day; i++) {
			c.add(Calendar.DATE, 1);
			String days = sdf.format(c.getTime());
			list.add(days);
		}

		return list;
	}

}
