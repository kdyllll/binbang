package com.binbang.member.favorite.controller;

import java.io.IOException;
import java.util.List;

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
 * Servlet implementation class MemberFavoriteContentsServlet
 */
@WebServlet("/favorite/favoriteContents")
public class FavoriteContentsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FavoriteContentsServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//해당 폴더의 파일을 찾는 logic				 
		String folderNo = request.getParameter("folderNo");
		System.out.println(folderNo);
		 
		Favorite f = new FavoriteService().selectFolderName(folderNo);
		System.out.println(f.getFolderName());						
											
		List<Favorite> list = new FavoriteService().selectFolder(folderNo);
		System.out.println(list);			 		
					
		request.setAttribute("list",list);								
		request.setAttribute("folderName",f.getFolderName());
		request.setAttribute("folderNo", folderNo); 
		request.getRequestDispatcher("/views/member/favoriteContents.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
