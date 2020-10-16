package com.binbang.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.binbang.member.model.service.MemberService;

/*
 * Servlet implementation class MemberDeleteServlet
 */
@WebServlet("/mypage/memberDelete")
public class MemberDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */

	public MemberDeleteServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String email = request.getParameter("email2");
		int result = new MemberService().deleteMember(email);
		String msg = "";
		String loc = "";

		if (result > 0) {
			msg = "탈퇴완료";
			loc = "/mainMove";
			HttpSession session = request.getSession(false);
			if (session != null) {
				session.invalidate();
			}
		} else {
			msg = "탈퇴실패";
			loc = "/mypage/myPage";
		}
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);

		request.getRequestDispatcher("/views/common/printMsg.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
