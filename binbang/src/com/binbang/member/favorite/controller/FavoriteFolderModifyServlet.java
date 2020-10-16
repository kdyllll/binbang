package com.binbang.member.favorite.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.binbang.member.model.service.FavoriteService;
import com.binbang.member.model.vo.Favorite;

/**
 * Servlet implementation class FavoriteFolderModifyServlet
 */
@WebServlet("/favorite/modifyFolder")
public class FavoriteFolderModifyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public FavoriteFolderModifyServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String folderNo = request.getParameter("folderNo");
		System.out.println("너 folder" + folderNo);
		String folderName = request.getParameterValues("folderName")[1];
		System.out.println(folderName);
		String memberNo = request.getParameter("memberNo");
		System.out.println("너 Member" + memberNo);

		Favorite f = new Favorite();
		f.setFolderNo(folderNo);
		f.setFolderName(folderName);
		f.setMemberNo(memberNo);

		int rs = new FavoriteService().modifyFolder(f);

		String msg=""; String loc="";
		  
		 if(rs>0) { 
			 msg="폴더수정 성공";
			 loc="/favorite/favoriteContents?folderNo="+folderNo; 
			}else { 
			msg="폴더수정 실패";
			loc="/favorite/favoriteContents"; }
		  
		 request.setAttribute("msg", msg); request.setAttribute("loc", loc);
		 request.getRequestDispatcher("/views/common/printMsg.jsp").forward(request,response);
		 

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
