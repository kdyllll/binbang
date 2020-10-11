//package com.binbang.house.controller;
//
//import java.io.IOException;
//
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
//import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;
//
//import com.binbang.house.model.service.HouseService;
//import com.binbang.member.model.vo.Member;
//
///**
// * Servlet implementation class HousePointEndServlet
// */
//@WebServlet("/House/pointEnd")
//public class HousePointEndServlet extends HttpServlet {
//	private static final long serialVersionUID = 1L;
//       
//    /**
//     * @see HttpServlet#HttpServlet()
//     */
//    public HousePointEndServlet() {
//        super();
//        // TODO Auto-generated constructor stub
//    }
//
//	/**
//	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
//	 */
//	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		// TODO Auto-generated method stub
//
//
//		if(!ServletFileUpload.isMultipartContent(request)) {
//			request.setAttribute("msg", "포인트 적립 오류![form:enctype에러 관리자에게 문의하세요]");
//			request.setAttribute("loc", "/");
//			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
//			return;
//		}
//      
//      
//      
//		
//		Member m=new Member();
//		Int m.setTotalPoint("totalPoint");
//		String no=request.getParameter("houseNo");
//		
//		int result=new HouseService().insertReview(m);
//		
//		
//		
//      //result가 0보다 크면(1이면) 등록성공, 아니면 등록 실패
//      //결과에 따라 메세지를 출력하고 메인화면으로 이동
//
//		String msg="";
//		String loc="/house/review";
//		msg=result>0?"공지사항등록성공":"공지사항등록실패";
//		request.setAttribute("msg",msg);
//		request.setAttribute("loc",loc);
//		request.getRequestDispatcher("/views/common/msg.jsp")
//		.forward(request, response);
//	}
//		
//		
//		
//		
//		
//		
//	}
//
//	/**
//	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
//	 */
//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		// TODO Auto-generated method stub
//		doGet(request, response);
//	}
//
//}
