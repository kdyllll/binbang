package com.binbang.house.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.binbang.booking.model.vo.Booking;
import com.binbang.house.model.service.HouseService;
import com.binbang.house.model.vo.House;
import com.binbang.house.model.vo.Review;





/**
 * Servlet implementation class HouseDetailMoveServlet
 */
@WebServlet("/house/houseDetailMove")
public class HouseDetailMoveServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HouseDetailMoveServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

			
				String no=request.getParameter("houseNo");
				String in=request.getParameter("checkIn");
				String out1=request.getParameter("checkOut");
				String price=request.getParameter("totalPrice");
				
				House h=new HouseService().HouseDetail(no);
	
				
				String msg="";
				String loc="";
				String path="/views/house/houseDetail.jsp";
				if(h==null) {
					msg="선택한 숙소가 존재하지 않습니다.";
					loc="/house/houseSearch";
					path="/views/common/msg.jsp";
					request.setAttribute("msg",msg);
					request.setAttribute("loc",loc);
				}
				
				List filterList=new HouseService().FilterDetail(no); //필터 리스트를 생성
				h.setFilter(filterList); // 필터리스트에 있는 아이콘을 하우스에 넣어줌 그래야 하우스 번호랑 맵핑 되서 하우스번호에 등록된 필터 아이콘들이 들어옴
				
				Double totalGrade = new HouseService().selectAvgGrade(no); //숙소 평균 내주는 기능
				
				
				

				
				Booking b =new HouseService().selectReservation(no);
		
				
				//리뷰연결 
				List<Review> list=new HouseService().ReviewDetail(no);
				
				
				
				request.setAttribute("house",h);
				request.setAttribute("checkIn",in);
				request.setAttribute("checkOut",out1);
				request.setAttribute("totalPrice",price);
				request.setAttribute("grade",totalGrade);
				request.setAttribute("booking",b);
				request.setAttribute("list",list);
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
