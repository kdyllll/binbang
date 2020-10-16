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
 * Servlet implementation class MypagePrivateServlet
 */
@WebServlet(name="passwordCheck", urlPatterns="/mypage/mypagePrivate")
public class MypagePrivateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MypagePrivateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//입력한 password
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		//가져온 password
		Member m=new MemberService().selectMember(email,password);
	
		String msg="";
		String loc="";
		
		//비교구문
		if(m!=null) {
			request.getRequestDispatcher("/views/member/myPagePrivate.jsp").forward(request, response);							
		}else{
			msg = "패스워드가 일치하지 않습니다";
			loc="/mypage/myPage";
			request.setAttribute("msg", msg);
			request.setAttribute("loc", loc);
			request.getRequestDispatcher("/views/common/printMsg.jsp").forward(request, response);
		}								
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
