package com.binbang.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.binbang.member.model.service.MemberService;

/**
 * Servlet implementation class MemberChangePasswordServlet
 */
@WebServlet(name="changePassword",urlPatterns="/member/changePassword")
public class LoginChangePasswordEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginChangePasswordEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String newPassword=request.getParameter("password");
		String userId=(String)request.getSession().getAttribute("userId");
		System.out.println(userId);
	
		
		int result=new MemberService().updatePassword(userId,newPassword);
		System.out.println(result);
		
		String msg="";
		String loc="/member/updatePassword?userId="+userId;
		if(result>0) {
			msg="비밀번호 수정이 완료되었습니다.";
		}else {
			msg="비밀번호 변경을 실패하였습니다.";
		}
		
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
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
