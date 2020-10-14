package com.binbang.admin.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.binbang.admin.model.service.AdminService;

/**
 * Servlet implementation class HostComplainOutServlet
 */
@WebServlet("/admin/hostComplainOut")
public class HostComplainOutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HostComplainOutServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String hostNo=request.getParameter("hostNo");
		int result=new AdminService().hostOut(hostNo);
		
		String msg="";
		
		if(result>0) {
			msg="권한박탈 되었습니다.";
			result=2;
		}
		else {
			msg="권한 박탈에 실패하였습니다.";
		}
		
		/*
		 * HttpSession outResult = request.getSession();
		 * outResult.setAttribute("result", result);
		 */
		request.setAttribute("result", result);
		request.getRequestDispatcher("")
		/*
		 * request.setAttribute("msg", msg); request.setAttribute("loc",
		 * "/admin/hostComplainList");
		 * request.getRequestDispatcher("/views/common/printMsg.jsp").forward(request,
		 * response);
		 */
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
