package com.binbang.house.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.binbang.house.model.service.HouseService;
import com.binbang.house.model.vo.House;





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

		
		int no=Integer.parseInt(request.getParameter("no"));
		
		
		House h=new HouseService().HouseDetail(no);
				
				String msg="";
				String loc="";
				String path="";
				if(h==null) {
					//선택한 공지사항이 삭제됨.
					msg="선택한 공지사항이 존재하지 않습니다.";
					loc="/house/houseSearch";
					path="/views/common/msg.jsp";
					request.setAttribute("msg",msg);
					request.setAttribute("loc",loc);
				}else {
					request.setAttribute("house",h);
					path="/views/house/houseDetail.jsp";
				}
		
	
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
