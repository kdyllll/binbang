package com.binbang.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.binbang.member.model.service.MemberService;
import com.binbang.member.model.vo.Member;

/**
 * Servlet implementation class MemberUpdateServlet
 */
@WebServlet("/member/memberUpdate")
public class MemberUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		Member m = new Member();
		m.setEmail(request.getParameter("email2"));
		m.setNickname(request.getParameter("nickname2"));
		m.setPhone(request.getParameter("phone2"));

		  String email= request.getParameter("email2");
		  System.out.println("넘어온 email:"+email);
		  String nickname= request.getParameter("nickname2");
		  System.out.println("넘어온 nickname:"+nickname);
		  String phone= request.getParameter("phone2");
		  System.out.println("넘어온 phone:"+phone);		  	
		  
		int rs=new MemberService().updateMember(m);
		
		String msg="";
		String loc="";
		
		if(rs>0) {
			msg="회원수정 성공!";			
			loc="/member/myPage?email="+m.getEmail();			
		}else {
			msg="회원수정 실패!";
			loc="/member/mypagePrivate?email="+m.getEmail();			
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
