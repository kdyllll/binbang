package com.binbang.host.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.binbang.house.model.service.HouseService;
import com.binbang.house.model.vo.House;

/**
 * Servlet implementation class HouseChangePageServlet
 */
@WebServlet("/host/houseChangePage")
public class HouseChangePageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HouseChangePageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String houseNo = request.getParameter("houseNo");
		System.out.println(houseNo);
		//house
		House hList = new HouseService().selectHouseOne(houseNo);
		 List fList = new HouseService().selectFilterList(houseNo);
		 String[] mainPic = new HouseService().selectMainPicture(houseNo);
		 List subPics = new HouseService().selectPictures(houseNo);


		request.setAttribute("fList", fList);
		request.setAttribute("hList", hList);
		request.setAttribute("mainPic", mainPic[0]);
		request.setAttribute("subPics", subPics);
		request.getRequestDispatcher("/views/host/houseChange.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
