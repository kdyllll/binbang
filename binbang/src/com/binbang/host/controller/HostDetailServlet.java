package com.binbang.host.controller;

import java.io.IOException;

import javax.mail.Session;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.binbang.host.model.service.HostService;
import com.binbang.host.model.vo.Host;

/**
 * Servlet implementation class HostDetailServlet
 */
@WebServlet("/host/hostDetail")
public class HostDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HostDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String memberNo = request.getParameter("memberNo");
		
		Host h = new HostService().selectHostOne(memberNo);
		System.out.println(h);
		request.setAttribute("host", h);
		request.getRequestDispatcher("/views/host/hostMypage.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
