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
public class MemberChangePasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberChangePasswordServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String newPassword=request.getParameter("new_password");
		String userId=request.getParameter("userId");
		
		int result=new MemberService().findPassword(userId,newPassword);
		
		String msg="";
		String loc="/member/updatePassword?userId="+userId;
		String script="";
		if(result>0) {
			msg="패스워드 수정완료";
		}else if(result==-1){
			msg="현재 비밀번호가 일치하지 않습니다.";	
		}else {
			msg="비밀번호 변경 실패";
		}
		
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
		request.setAttribute("script", script);
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
