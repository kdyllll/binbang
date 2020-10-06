package com.binbang.host.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.binbang.member.model.vo.Member;

/**
 * Servlet implementation class HostEnrollServlet
 */
@WebServlet("/hostEnroll")
public class HostEnrollServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HostEnrollServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session =request.getSession();
		Member m = (Member)session.getAttribute("m");
		if(m.getHostNo() != null) {
			request.setAttribute("msg", "관리자의 승인을 대기중입니다.");
			request.setAttribute("loc", "/mainMove");
			request.getRequestDispatcher("/views/common/printMsg.jsp").forward(request, response);
			return;
		}
		request.setAttribute("member", m);
		request.getRequestDispatcher("/views/host/hostRegist.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
