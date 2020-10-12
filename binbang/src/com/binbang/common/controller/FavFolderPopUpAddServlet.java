package com.binbang.common.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.binbang.member.model.dao.FavoriteDao;
import com.binbang.member.model.service.FavoriteService;
import com.binbang.member.model.vo.Favorite;

/**
 * Servlet implementation class FavFolderPopUpAddServlet
 */
@WebServlet("/favFolderPopUpAdd")
public class FavFolderPopUpAddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FavFolderPopUpAddServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		Favorite f=new Favorite();
		f.setMemberNo(request.getParameter("memberNo"));
		f.setFolderName(request.getParameter("folderName"));
		int result=new FavoriteService().createFolder(f);
		String msg="";
		if(result>0) {
			msg="폴더가 추가되었습니다.";
		}else {
			msg="폴더 추가에 실패했습니다.";
		}
		response.setContentType("text/html; charset=euc-kr"); //한글이 인코딩
		PrintWriter out = response.getWriter(); //선언
		   
	   String str="";
	   str = "<script language='javascript'>";
	   str += "alert('"+ msg + "');";  
	   str += " window.opener.location.reload();"; //오프너 새로고침 
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
