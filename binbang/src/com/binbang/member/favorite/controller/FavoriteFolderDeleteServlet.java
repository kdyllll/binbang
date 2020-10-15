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
		
		String folderNo=request.getParameter("folderNo");	
		System.out.println(folderNo);
		String memberNo=request.getParameter("memberNo");
		System.out.println(memberNo);	
		
		Favorite f = new Favorite();
		f.setFolderNo(folderNo);
		f.setFolderName(memberNo);
		
		int result=new FavoriteService().deleteFolder(f);

		String msg="";
		String loc="";
						
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
