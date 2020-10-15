package com.binbang.member.favorite.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.binbang.member.model.dao.FavoriteDao;
import com.binbang.member.model.service.FavoriteService;
import com.binbang.member.model.vo.Favorite;
import com.binbang.member.model.vo.Member;

/**
 * Servlet implementation class FavFolderPopUpAddServlet
 */
@WebServlet("/favorite/favFolderPopUpAdd")
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
		HttpSession session = request.getSession(false);
		Member m = (Member) session.getAttribute("m");;
		f.setMemberNo(m.getMemberNo());
		f.setFolderName(request.getParameter("folderName"));
		
		String houseNo=request.getParameter("houseNo");
		System.out.println(houseNo);
		int result=new FavoriteService().createFolder(f);
		String msg="";
		if(result>0) {
			msg="폴더가 추가되었습니다.";
		}else {
			msg="폴더 추가에 실패했습니다.";
		}
		response.setContentType("text/html; charset=euc-kr"); 
		PrintWriter out = response.getWriter(); 		   
	    String str="";
	    str = "<script language='javascript'>";
	    str += "alert('"+ msg + "');";  
	    str+="location.replace('favoritePopUp?houseNo=";
	    str+=houseNo;
	    str+="');";
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
