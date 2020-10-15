package com.binbang.notice.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.binbang.notice.model.service.NoticeService;
import com.binbang.notice.model.vo.Notice;

/**
 * Servlet implementation class PrevNoticeViewServlet
 */
@WebServlet("/notice/prevNoticeView")
public class PrevNoticeViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PrevNoticeViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String noticeNo=request.getParameter("noticeNo");
		Notice n=new NoticeService().prevNotice(noticeNo); 
		 
		 if(n==null || n.getNoticeTitle().equals("null")) {
			 request.setAttribute("msg","이전 글이 없습니다."); 
			 request.setAttribute("loc","/notice/noticeList");
			 request.getRequestDispatcher("/views/common/printMsg.jsp").forward(request,response);
		 
		  } else{ 
		  	request.setAttribute("notice",n);
		  	request.getRequestDispatcher("/views/notice/noticeDetail.jsp").forward(request, response);
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
