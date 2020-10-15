package com.binbang.member.favorite.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.binbang.member.model.service.FavoriteService;
import com.binbang.member.model.service.MemberService;
import com.binbang.member.model.vo.Favorite;
import com.binbang.member.model.vo.Member;
import com.google.gson.Gson;

/**
 * Servlet implementation class FavoritePopUpServlet
 */
@WebServlet("/favorite/favoritePopUp")
public class FavoritePopUpServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FavoritePopUpServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String houseNo=request.getParameter("houseNo");
		request.setAttribute("houseNo", houseNo);
		HttpSession session = request.getSession(false);
		Member m = (Member) session.getAttribute("m");
			// 관심숙소 폴더목록
		List<Favorite> favFolder = new MemberService().selectFavAllList(m);
//		for(Favorite f:favFolder) {
//			System.out.println(f);
//		}
			//관심숙소 채우기
		List favCon=new ArrayList();//관심숙소 이름만 들어있는 리스트
		for(Favorite f:favFolder) {
			f.setFolderName(new FavoriteService().selectFolderName(f.getFolderNo()).getFolderName());
			f.setHouseList(new FavoriteService().selectConList(f.getFolderNo()));
		}

		request.setAttribute("member", m.getMemberNo());
		request.setAttribute("favorite", favFolder);
		
		request.getRequestDispatcher("/views/common/favoritePopUp.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
