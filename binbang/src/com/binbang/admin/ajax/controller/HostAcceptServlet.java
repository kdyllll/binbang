package com.binbang.admin.ajax.controller;

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
 * Servlet implementation class HostAcceptServlet
 */
@WebServlet("/admin/hostAccept")
public class HostAcceptServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HostAcceptServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String memberNo = request.getParameter("memberNo");
		System.out.println(memberNo);
		
		int result=new AdminService().acceptHost(memberNo);
		
		/*
		 * String msg=""; String loc="/views/admin/hostAcceptList.jsp";
		 * 
		 * if(result>0) { msg="승인되었습니다."; } else { msg="승인에 실패하였습니다."; }
		 * 
		 * request.setAttribute("msg", msg); request.setAttribute("loc", loc);
		 */
		List<Host> list=new AdminService().acceptHostList();
//		request.setAttribute(name, o);
		request.setAttribute("result", result);
		request.getRequestDispatcher("/admin/hostAcceptListAjax").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
