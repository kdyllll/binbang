package com.binbang.admin.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.binbang.admin.model.service.AdminService;
import com.binbang.host.model.vo.Host;

/**
 * Servlet implementation class SearchHostListServlet
 */
@WebServlet("/admin/searchHostList")
public class SearchHostListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchHostListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("호스트 검색");
		String type=request.getParameter("searchType");
		String keyword=request.getParameter("searchKeyword");
		List<Host> list= new AdminService().searchHostList(type, keyword);
		for(Host h:list) {
			System.out.println(h);
		}
		
		request.setAttribute("list", list);
		request.getRequestDispatcher("/views/admin/hostList.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
