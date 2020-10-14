package com.binbang.member.favorite.controller;

import java.io.IOException;
import java.io.PrintWriter;

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
		HttpSession session = request.getSession(false);
		Member m = (Member) session.getAttribute("m");
		String houseNo=request.getParameter("houseNo");
		String[] folder=request.getParameterValues("folderNo");
		if(folder!=null) {
			int result=0;
			//폴더 번호와 하우스번호 가지고, 조회해서 이미 있으면 -삭제 / 없으면 -삽입
			for(int i=0;i<folder.length;i++) {
	//			System.out.println(folder[i]);
				//조희
				Favorite f=new FavoriteService().selectContent(houseNo,folder[i],m.getMemberNo());
				if(f.getHouseNo()!=null) {
					//delete
					result=new FavoriteService().deleteContent(houseNo,folder[i]);
				}else {
					//insert
					result=new FavoriteService().insertContent(houseNo,folder[i]);
				}			
			}
			
			String msg="";
			if(result>0) {
				msg="관심숙소가 반영되었습니다.";
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
		}else {
			//아무것도 누르지않고 팝업창에서 확인을 눌렀다면 그냥 꺼주기!
			response.setContentType("text/html; charset=euc-kr"); //한글이 인코딩
			PrintWriter out = response.getWriter(); //선언	
			String str="";
			str = "<script language='javascript'>";
		    str += " window.opener.location.reload();"; //부모창 새로고침 
		    str += "self.close();";   // 창닫기
		    str += "</script>";
		    out.print(str);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
