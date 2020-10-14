package com.binbang.booking.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.binbang.house.model.service.HouseService;
import com.binbang.house.model.vo.House;


/**
 * Servlet implementation class BookingServlet
 */
@WebServlet("/booking/booking")
public class BookingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BookingServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
			String no=request.getParameter("houseNo");
			String in=request.getParameter("checkIn");
			String out1=request.getParameter("checkOut");
			String price=request.getParameter("totalPrice");
			System.out.println(in);
			System.out.println(out1);
			if(in.equals("null") || out1.equals("null")) {
				request.setAttribute("msg", "메인화면에서 날짜검색을 해주세요");
				request.setAttribute("loc", "/mainMove");
				request.getRequestDispatcher("/views/common/printMsg.jsp").forward(request, response);
			}
			
			House h=new HouseService().HouseDetail(no);
			
			String msg="";
			String loc="";
			String path="/views/booking/booking.jsp";
			if(h==null) {
				msg="선택한 숙소가 존재하지 않습니다.";
				loc="/house/houseSearchList";
				path="/views/common/msg.jsp";
				request.setAttribute("msg",msg);
				request.setAttribute("loc",loc);
			}
		
			request.setAttribute("house",h);
			request.setAttribute("checkIn",in);
			request.setAttribute("checkOut",out1);
			request.setAttribute("totalPrice",price);

			request.getRequestDispatcher(path).forward(request, response);
		   
	
		   
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
