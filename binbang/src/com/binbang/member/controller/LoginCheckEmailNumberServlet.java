package com.binbang.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

/**
 * Servlet implementation class FindPasswordAjaxServlet
 */
@WebServlet("/member/checkEmailNumber")
public class LoginCheckEmailNumberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginCheckEmailNumberServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String AuthenticationKey = (String)request.getSession().getAttribute("AuthenticationKey");
        String number = request.getParameter("number");
        
        String msg="";
		int result=0;
		
		JSONObject checkNumber= new JSONObject();
       
		if(AuthenticationKey!=null&&number!=null&&AuthenticationKey.equals(number)){	
        	System.out.println("인증번호 일치함"); 
        	msg="인증이 완료되었습니다";
            result=1;
		
        }else {
        	System.out.println("인증번호 일치하지 않음");
        	msg="인증번호가 일치하지 않습니다";

        }
		
		checkNumber.put("msg", msg);
        checkNumber.put("result", result);
        response.getWriter().print(checkNumber);
	}
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
