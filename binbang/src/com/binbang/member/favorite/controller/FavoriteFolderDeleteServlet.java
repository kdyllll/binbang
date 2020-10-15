package com.binbang.member.favorite.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.binbang.member.model.service.FavoriteService;
import com.binbang.member.model.vo.Favorite;
import com.binbang.member.model.vo.Member;

/**
 * Servlet implementation class FavoriteFolderDeleteServlet
 */
@WebServlet("/favorite/deleteFolder")
public class FavoriteFolderDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FavoriteFolderDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 HttpSession session = request.getSession(false); 
		  Member m = (Member)session.getAttribute("m");
		String folderNo=request.getParameter("folderNo");	
		System.out.println(folderNo);
		String memberNo=request.getParameter("memberNo");
		System.out.println("구분"+m.getMemberNo());	
		
		
		int result=new FavoriteService().deleteFolder(folderNo);

		String msg="";
		String loc="";
		
		System.out.println(memberNo);
		if(result>0) {
			msg="삭제완료";								
			loc="/favorite/favoriteFolder?memberNo="+memberNo;
		}else {
			msg="삭제실패";
			loc="/favorite/favoriteContents";			
		}
		request.setAttribute("msg",msg);
		request.setAttribute("loc",loc);		
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
