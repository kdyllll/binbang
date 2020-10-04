package com.binbang.house.controller;

import java.io.IOException;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.binbang.house.model.vo.House;
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
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String path=getServletContext().getRealPath("/upload/house");
		int maxSize=1024*1024*50;
		String encode="UTF-8";
		DefaultFileRenamePolicy rename=new DefaultFileRenamePolicy();
		MultipartRequest mr=new MultipartRequest(request,path,maxSize,encode,rename);
		
		House h=new House();
		h.setHouseName(mr.getParameter("hName"));//숙소이름
		h.setHouseType(mr.getParameter("hType"));//숙소타입
		String location=mr.getParameter("roadAddress")+" "+mr.getParameter("detailAddress");
		h.setHouseLocation(location);
		h.setHousePnum(Integer.parseInt(mr.getParameter("pNum")));
		h.setpObjects(mr.getParameter("personal"));
		h.setRoomNum(Integer.parseInt(mr.getParameter("roomNum")));
		h.setBedNum(Integer.parseInt(mr.getParameter("bedNum")));
		h.setBathNum(Integer.parseInt(mr.getParameter("bathNum")));
		h.setHouseComment(mr.getParameter("explain"));
		h.setHouseGemsung(mr.getParameter("gemsung"));
		h.setAttention(mr.getParameter("attention"));
		h.setInoutTime(mr.getParameter("checkTime"));
		
		
		String sDay1=mr.getParameter("startDay1");
		String sDay2=mr.getParameter("endDay1");
		int days=dateCalculator(sDay1,sDay2);
		
		mr.getParameter("startDay2");
		mr.getParameter("endDay2");
		mr.getParameter("startDay3");
		mr.getParameter("endDay3");
		mr.getParameter("startDay4");
		mr.getParameter("endDay4");
		mr.getParameter("startDay5");
		mr.getParameter("endDay5");
		
		h.setPeakDay();
		h.setPriceDay(Integer.parseInt(mr.getParameter("nonPeakDay")));
		h.setPriceWeekend(Integer.parseInt(mr.getParameter("nonPeakRest")));
		h.setPricePeakDay(Integer.parseInt(mr.getParameter("peakDay")));
		h.setPricePeakWeekend(Integer.parseInt(mr.getParameter("peakRest")));
		String[] filter=mr.getParameterValues("filter");
	    String filters=String.join(",", filter);
		h.setFilter(filters);
		
		//사진파일 업로드
		
		h.setHousePicture();
		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	public int dateCalculator(String day1,String day2) {
		//시작날짜 캘린더형
		String[] Date=day1.split("/");
		int[] Date2=new int[Date.length];
		for(int i=0;i<Date.length;i++) {
			Date2[i]=Integer.parseInt(Date[i]);
		}
		Calendar start=Calendar.getInstance();
		start.set(Calendar.YEAR,Date2[0]);
		start.set(Calendar.MONTH,Date2[1]);
		start.set(Calendar.DATE,Date2[2]);
		
		//끝날짜 캘린더형
		String[] eDate=day2.split("/");
		int[] eDate2=new int[eDate.length];
		for(int i=0;i<eDate.length;i++) {
			eDate2[i]=Integer.parseInt(eDate[i]);
		}
		Calendar end=Calendar.getInstance();
		end.set(Calendar.YEAR,eDate2[0]);
		end.set(Calendar.MONTH,eDate2[1]);
		end.set(Calendar.DATE,eDate2[2]);
		
		Long cal=end.getTimeInMillis()-start.getTimeInMillis();
		int cal2=(int)(cal / (1000*60*60));
		int cal3=Math.abs(cal2);
		int day=cal3/24; //날짜 수
		
		return day;
		
	}

}
