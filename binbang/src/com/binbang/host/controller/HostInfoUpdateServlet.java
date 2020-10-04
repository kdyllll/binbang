package com.binbang.host.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.binbang.host.model.service.HostService;
import com.binbang.host.model.vo.Host;

/**
 * Servlet implementation class HostInfoChange
 */
@WebServlet("/host/hostInfoUpdate")
public class HostInfoUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HostInfoUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String hostIntro = request.getParameter("hostIntro");
		String memberNo = request.getParameter("memberNo");
		int result = new HostService().updateHostInfo(hostIntro, memberNo);
		
		String msg = "";

		if(result > 0) {
			msg = "호스트 정도 수정에 성공하였습니다";

		} else {
			msg = "호스트 정보 수정에 실패하였습니다.";
		}
		request.setAttribute("msg", msg);
		request.setAttribute("loc", "/host/hostDetail");
		request.getRequestDispatcher("/views/common/printMsg.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
