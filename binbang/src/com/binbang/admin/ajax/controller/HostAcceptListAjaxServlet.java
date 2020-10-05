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
		System.out.println("서블릿 실행");
		List<Host> hostList=new AdminService().acceptHostList();
		for(Host h : hostList) {
			System.out.println("서블릿에서는 출력:"+h);
		}
//		String memberNo="";
//		for(Host h : list) {
//			memberNo=h.getMemberNo();
//		}
//		String adminTitle = "호스트 승인";
//
//		ArrayList cell = new ArrayList();
//		cell.add("cell1");
//		cell.add("cell3");
//		cell.add("cell3");
//		cell.add("cell3");
//		cell.add("cell2");
//		cell.add("cell2");
		
		request.setAttribute("hostList", hostList);
//		request.setAttribute("adminTitle", adminTitle);
//		request.setAttribute("cell", cell);
//		request.setAttribute("memberNo", memberNo);
//		request.getRequestDispatcher("/ajax/admin/hostAcceptList.jsp").forward(request, response);
		request.getRequestDispatcher("/views/admin/manager.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
