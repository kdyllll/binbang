package com.binbang.admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.binbang.admin.model.service.AdminService;
import com.binbang.member.model.vo.Complaint;
import com.google.gson.Gson;

/**
 * Servlet implementation class HostComplaintListPopup
 */
@WebServlet("/admin/hostComplaintListPopup")
public class HostComplaintListPopupServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HostComplaintListPopupServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String complaintNo=request.getParameter("complaintNo");
		System.out.println(complaintNo);
		Complaint com=new AdminService().hostComplainPopup(complaintNo);
		System.out.println(com);
//		request.setAttribute("com", com);
//		request.getRequestDispatcher("/views/admin/hostComplaintPopup.jsp").forward(request, response);
		response.setContentType("application/json;charset=utf-8");
		new Gson().toJson(com,response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
