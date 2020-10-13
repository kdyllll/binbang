package com.binbang.member.favorite.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.binbang.member.model.service.FavoriteService;

/**
 * Servlet implementation class FavConPopUpAddServlet
 */
@WebServlet("/favorite/favConPopUp")
public class FavConPopUpServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FavConPopUpServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("서블릿실행");
		String houseNo=request.getParameter("houseNo");
		String[] addFolArr=request.getParameterValues("addFolerNo");
		String[] delFolArr=request.getParameterValues("addFolerNo");
		
		System.out.println(houseNo);
		System.out.println(addFolArr);
		System.out.println(delFolArr);
		

		int result=0;
		String msg="";
		if(result>0) {
			msg="관심숙소가 반영되었습니다..";
		}else {
			msg="관심숙소 추가/삭제에 실패했습니다.";
		}
		response.setContentType("text/html; charset=euc-kr"); //한글이 인코딩
		PrintWriter out = response.getWriter(); //선언		   
	    String str="";
	    str = "<script language='javascript'>";
	    str += "alert('"+ msg + "');";  
	    str += " window.opener.location.reload();"; //부모창 새로고침 
	    str += "self.close();";   // 창닫기
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
