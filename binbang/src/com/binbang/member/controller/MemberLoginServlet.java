package com.binbang.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.binbang.member.model.service.MemberService;
import com.binbang.member.model.vo.Member;

/**
 * Servlet implementation class MemberLoginServlet
 */
@WebServlet(name="login",urlPatterns="/member/login")
public class MemberLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberLoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String userId = request.getParameter("userId");
		String userPw = request.getParameter("password");
		String saveId=request.getParameter("saveId");
		
		//Id저장
		if(saveId!=null) {
			Cookie c= new Cookie("saveId",userId);
			c.setMaxAge(24*60*60);
			response.addCookie(c);
		}else{
			Cookie c= new Cookie("saveId","");
			c.setMaxAge(0);
			response.addCookie(c);
		}		
		
		Member m= new MemberService().selectMember(userId,userPw);
		
		String msg = "";
		String loc = "";
		
		if(m!=null) {
			HttpSession session = request.getSession();
			session.setAttribute("m", m);
	        response.sendRedirect(request.getContextPath()+"/mainMove");
		}else {
			System.out.println("아이디나 패스워드 일치하지 않음");
			msg = "아이디나 패스워드가 일치하지 않습니다";
			loc="/member/moveLoginPage";
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
