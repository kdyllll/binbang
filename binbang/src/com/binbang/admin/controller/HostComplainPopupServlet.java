package com.binbang.admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.binbang.admin.model.service.AdminService;
import com.binbang.member.model.vo.Complaint;

/**
 * Servlet implementation class HostComplainPopupServlet
 */
@WebServlet("/admin/hostComplainPopup")
public class HostComplainPopupServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HostComplainPopupServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String complaintNo=request.getParameter("complaintNo");
		Complaint com=new AdminService().hostComplainPopup(complaintNo);
		request.setAttribute("com", com);
		request.getRequestDispatcher("/views/admin/complainPopup.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
