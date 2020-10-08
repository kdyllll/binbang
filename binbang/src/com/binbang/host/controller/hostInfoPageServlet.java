package com.binbang.host.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.binbang.host.model.service.HostService;
import com.binbang.host.model.vo.Host;
import com.binbang.house.model.service.HouseService;
import com.binbang.house.model.vo.House;

/**
 * Servlet implementation class hostInfoPageServlet
 */
@WebServlet("/hostInfoPage")
public class hostInfoPageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public hostInfoPageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String hostNo = request.getParameter("hostNo");
		Host h = new HostService().selectHostInfo(hostNo);
		List<House> list= new HouseService().selectHostHouse(hostNo);
		System.out.println(list);
		request.setAttribute("host", h);
		request.setAttribute("list", list);
		request.getRequestDispatcher("/views/host/hostInfoPage.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
