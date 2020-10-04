package com.binbang.admin.ajax.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.binbang.admin.model.service.AdminService;
import com.binbang.member.model.vo.Member;

/**
 * Servlet implementation class MemberListAjaxServlet
 */
@WebServlet("/admin/memberListAjax")
public class MemberListAjaxServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public MemberListAjaxServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		List<Member> list=new AdminService().selectMemberAll();
				
		String adminTitle = "회원 현황";

		String memberName = "이름";
		String category = "분류";
		String enrollDate = "가입일";

		ArrayList searchCategory = new ArrayList();
		searchCategory.add(memberName);
		searchCategory.add(category);
		searchCategory.add(enrollDate);

		ArrayList cell = new ArrayList();
		cell.add("cell1");
		cell.add("cell2");
		cell.add("cell2");
		cell.add("cell4");
		cell.add("cell2");
		cell.add("cell3");

		request.setAttribute("list", list);
		request.setAttribute("adminTitle", adminTitle);
		request.setAttribute("searchCategory", searchCategory);
		request.setAttribute("cell", cell);

		request.getRequestDispatcher("/views/admin/memberListAjax.jsp").forward(request, response);
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
