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
import com.binbang.host.model.vo.Host;

/**
 * Servlet implementation class HostAcceptListAjaxServlet
 */
@WebServlet("/admin/hostAcceptListAjax")
public class HostAcceptListAjaxServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HostAcceptListAjaxServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Host> list=new AdminService().acceptHost();
		
		String adminTitle = "호스트 승인";

		ArrayList cell = new ArrayList();
		cell.add("cell1");
		cell.add("cell3");
		cell.add("cell3");
		cell.add("cell3");
		cell.add("cell2");
		cell.add("cell2");

		request.setAttribute("list", list);
		request.setAttribute("adminTitle", adminTitle);
		request.setAttribute("cell", cell);

		request.getRequestDispatcher("/views/admin/memberListAjax.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
