package com.binbang.house.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
				
				House h=new HouseService().FilterDetail(no);
		
				String msg="";
				String loc="";
				String path="";
				if(h==null) {
					msg="선택한 숙소가 존재하지 않습니다.";
					loc="/house/houseSearch";
					path="/views/common/msg.jsp";
					request.setAttribute("msg",msg);
					request.setAttribute("loc",loc);
				}else {
					
					path="/views/house/houseDetail.jsp";
				}
				
				
				
				House h2=new HouseService().HouseDetail(no);
				List filterList=h2.getFilter();//여기에 숙소에대한 필터 이미지가 담겨온것임
		
				path="/views/house/houseDetail.jsp";
				
				//리뷰연결 
				List<Review> list=new HouseService().ReviewDetail(no);
				
				request.setAttribute("house",h);
				request.setAttribute("filterList",filterList);
				request.setAttribute("list",list);
				
	
				request.getRequestDispatcher(path).forward(request, response);

			System.out.println(list);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
