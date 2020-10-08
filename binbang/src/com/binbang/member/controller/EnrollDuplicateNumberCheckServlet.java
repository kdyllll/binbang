package com.binbang.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class EnrollDuplicateNumberCheckServlet
 */

@WebServlet("/member/duplicateNumberCheck")
public class EnrollDuplicateNumberCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EnrollDuplicateNumberCheckServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String AuthenticationKey = (String)request.getSession().getAttribute("AuthenticationKey");
		
		String num = request.getParameter("num");	
		System.out.println("num");
		
		String msg="";
		String loc="";
		
		if(AuthenticationKey==null||num==null||!AuthenticationKey.equals(num)) {
			msg="인증번호가 일치하지 않습니다";
			loc="/member/checkEmailDuplicateAjax";
			System.out.println("인증번호 일치x");
			return;
		}else {
			msg="인증이 완료되었습니다.";
			loc="/member/memberEnroll";
			System.out.println("인증번호 일치o");
		}
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
		request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
