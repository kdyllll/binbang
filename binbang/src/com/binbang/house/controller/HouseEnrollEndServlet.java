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
		h.setHouseLocation(location);//숙소 위치
		h.setHousePnum(Integer.parseInt(mr.getParameter("pNum")));//숙소 최대인원
		h.setpObjects(mr.getParameter("personal"));//개인물건 유무
		h.setRoomNum(Integer.parseInt(mr.getParameter("roomNum")));//방갯수
		h.setBedNum(Integer.parseInt(mr.getParameter("bedNum")));//침대 갯수
		h.setBathNum(Integer.parseInt(mr.getParameter("bathNum")));//욕실 갯수
		h.setHouseComment(mr.getParameter("explain"));//설명
		h.setHouseGemsung(mr.getParameter("gemsung"));//감성글
		h.setAttention(mr.getParameter("attention"));//주의사항
		h.setInoutTime(mr.getParameter("checkTime"));//체크인아웃시간
		
		//성수기 기간
		String sDay1=mr.getParameter("startDay1");
		String sDay2=mr.getParameter("endDay1");
		if(sDay1!=null&&sDay2!=null) {
			h.setPeakDay1(dateCalculator(sDay1,sDay2));
		}else {
			h.setPeakDay1(null);
		}
		sDay1=mr.getParameter("startDay2");
		sDay2=mr.getParameter("endDay2");
		if(sDay1!=null&&sDay2!=null) {
			h.setPeakDay2(dateCalculator(sDay1,sDay2));
		}else {
			h.setPeakDay2(null);
		}
		sDay1=mr.getParameter("startDay3");
		sDay2=mr.getParameter("endDay3");
		if(sDay1!=null&&sDay2!=null) {
			h.setPeakDay3(dateCalculator(sDay1,sDay2));
		}else {
			h.setPeakDay3(null);
		}
		sDay1=mr.getParameter("startDay4");
		sDay2=mr.getParameter("endDay4");
		if(sDay1!=null&&sDay2!=null) {
			h.setPeakDay4(dateCalculator(sDay1,sDay2));
		}else {
			h.setPeakDay4(null);
		}
		sDay1=mr.getParameter("startDay5");
		sDay2=mr.getParameter("endDay5");
		if(sDay1!=null&&sDay2!=null) {
			h.setPeakDay5(dateCalculator(sDay1,sDay2));
		}else {
			h.setPeakDay5(null);
		}

		//요금들
		h.setPriceDay(Integer.parseInt(mr.getParameter("nonPeakDay")));
		h.setPriceWeekend(Integer.parseInt(mr.getParameter("nonPeakRest")));
		h.setPricePeakDay(Integer.parseInt(mr.getParameter("peakDay")));
		h.setPricePeakWeekend(Integer.parseInt(mr.getParameter("peakRest")));
		//필터
		String[] filter=mr.getParameterValues("filter"); 
	    String filters=String.join(",", filter);
		h.setFilter(filters);
		
		//사진파일
		String[] pic=new String[10];
		for(int i=0;i<10;i++) {
			String a="picture"+(i+1);
			pic[i]=mr.getParameter(a);
		}	
		h.setHousePicture(pic);//사진 새로운 이름들만 
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	public List dateCalculator(String day1,String day2) {
		//시작날짜 캘린더형
		List list=new ArrayList();
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
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
		Calendar c=Calendar.getInstance();
		Date date1;
		try {
			date1 = sdf.parse(day1);
			c.setTime(date1);
		}catch (ParseException e) {
				e.printStackTrace();
		}
		for(int i=0;i<day;i++) {
			c.add(Calendar.DATE,1);
			String days=sdf.format(c.getTime());
			list.add(days);
		}
		
		return list;
	}
	


}
