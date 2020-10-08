package com.binbang.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.binbang.member.model.service.MemberService;
import com.binbang.member.model.vo.Member;

/**
 * Servlet implementation class MemberPasswordUpdate
 */

/* mypage 비밀번호 변경 */
@WebServlet(name="updatePassword" ,urlPatterns="/member/memberPasswordUpdate")
public class MemberPasswordUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberPasswordUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	
		String oriPw=request.getParameter("ori_pw");//이전 비밀번호
		String newPw=request.getParameter("new_pw");//변경할 비밀번호
		String email=request.getParameter("email");
		
		int result=new MemberService().updatePassword(oriPw,newPw,email);
		
		String msg="";
		String loc="";
		
		if(result>0) {
			msg="Password 수정완료";
			loc="/member/updatePassword?email="+email;			
		}else {
			msg="Password 변경실패";
			loc="/member/mypagePrivate";
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
