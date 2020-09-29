package com.binbang.house.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.binbang.house.model.service.HouseService;
import com.binbang.house.model.vo.House;


//import com.binbang.member.model.service.BinbangService;



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


	
		request.getRequestDispatcher("/views/house/houseDetail.jsp").forward(request, response);

		//int no=Integer.parseInt(request.getParameter("no"));

		House h=new HouseService().BinbangDetail(no);
	
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
