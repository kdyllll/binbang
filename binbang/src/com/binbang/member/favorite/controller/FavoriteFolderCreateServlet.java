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

/**
 * Servlet implementation class FavoriteFolderCreateServlet
 */
@WebServlet("/favorite/favoriteFolderCreate")
public class FavoriteFolderCreateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FavoriteFolderCreateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {			
		
		String memberNo=request.getParameter("memberNum");
		System.out.println(memberNo);
		String folderName=request.getParameter("folderName");
		System.out.println(folderName);
		
		Favorite f=new Favorite();
		f.setMemberNo(memberNo);
		f.setFolderName(folderName);				
		
		int result=new FavoriteService().createFolder(f);
		
		String msg="";
		String loc="/";
		
		if(result>0) {
			msg="폴더생성";
			loc="/member/favoriteFolder";
		}else {
			msg="폴더생성 실패";
		}
		
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
		request.getRequestDispatcher("/views/common/printMsg.jsp").forward(request,response);				
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
