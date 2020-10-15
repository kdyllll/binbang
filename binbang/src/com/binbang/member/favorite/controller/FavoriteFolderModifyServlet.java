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
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String folderNo=request.getParameter("folderNo");
		System.out.println(folderNo);
		String folderName=request.getParameter("folderName");
		System.out.println(folderName);		
		String memberNo=request.getParameter("memberNo");

		Favorite f = new Favorite();
		f.setFolderNo(request.getParameter("folderNo"));
		f.setFolderName(request.getParameter("folderName"));		
		f.setMemberNo(request.getParameter("memberNo"));
		
		int rs=new FavoriteService().modifyFolder(f);
		System.out.println("찍히니?!?!!?!?!?!?"+folderNo);
		
		String msg="";
		String loc="";
		
		if(rs>0) {
			msg="폴더수정 성공";
			loc="/favorite/favoriteContents";
		}else {
			msg="폴더수정 실패";
			loc="/favorite/favoriteContents";
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
