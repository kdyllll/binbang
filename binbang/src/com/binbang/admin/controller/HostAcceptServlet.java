package com.binbang.admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.binbang.admin.model.service.AdminService;
import com.google.gson.Gson;

/**
 * Servlet implementation class HostAcceptServlet
 */
@WebServlet("/admin/moveHostAcceptList")
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
		//호스트 승인해주는 서블릿
		String memberNo = request.getParameter("memberNo");

		String hostAccept="";
		
		int result=new AdminService().acceptHost(memberNo);
		if(result>0) {
			hostAccept="호스트 승인이 완료되었습니다.";
		}else {
			hostAccept="호스트 승인에 실패하였습니다.";
		}
		
		response.setContentType("application/json;charset=utf-8");
		new Gson().toJson(hostAccept,response.getWriter());
		

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
