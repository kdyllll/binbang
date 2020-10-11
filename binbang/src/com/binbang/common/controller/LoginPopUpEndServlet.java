package com.binbang.common.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.binbang.member.model.service.MemberService;
import com.binbang.member.model.vo.Member;

/**
 * Servlet implementation class LoginPopUpEndServlet
 */
@WebServlet(name="loginPopUp",urlPatterns="/loginPopUpEnd")
public class LoginPopUpEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginPopUpEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String userId = request.getParameter("userId");
		String userPw = request.getParameter("password");
		Member m= new MemberService().selectMember(userId,userPw);
		
		String msg = "";
		String loc = "";
		
		if(m!=null) {
			HttpSession session = request.getSession();
			session.setAttribute("m", m);
			msg="로그인성공";
		}else {
			System.out.println("아이디나 패스워드 일치하지 않음");
			msg = "아이디나 패스워드가 일치하지 않습니다";	
		}
		response.setContentType("text/html; charset=euc-kr"); //한글이 인코딩
		PrintWriter out = response.getWriter(); //선언
		   
	   String str="";
	   str = "<script language='javascript'>";
	   str += "alert('"+ msg + "');";  //오프너 새로고침
	   str += " window.opener.location.reload();";   // 창닫기
	   str += "window.close();";   // 창닫기
	   str += "</script>";
	   out.print(str);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
