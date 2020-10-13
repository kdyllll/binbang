package com.binbang.house.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.binbang.house.model.service.HouseService;
import com.binbang.house.model.vo.Review;
import com.binbang.member.model.vo.Member;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * Servlet implementation class HouseReviewEndServlet
 */
@WebServlet("/review/reviewEnd")
public class HouseReviewEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HouseReviewEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		if(!ServletFileUpload.isMultipartContent(request)) {
			request.setAttribute("msg", "공지사항 작성 오류![form:enctype에러 관리자에게 문의하세요]");
			request.setAttribute("loc", "/");
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
			return;
		}
   
      
      String path=getServletContext().getRealPath("/upload/review"); //이러면 프로젝트가 저장되어있는 경로로 지정됨 업로드폴더로
		//2.업로드 파일의 최대 크기를 설정함
      	File dir = new File(path); // 이게 위에 업로드 파일이 안만들어졌을때 자동으로 만들어 주는 로직
      	if(!dir.exists()) dir.mkdirs(); //이게 위에 업로드 파일이 안만들어졌을때 자동으로 만들어 주는 로직
		int maxSize=1024*1024*10;//10메가 바이트가됨
		//3.파일에 대한 인코딩값 설정(UTF-8)
		String encode="UTF-8";
		//4.파일명을 다시 재정의 할수 있는 갹채(메소드) 대입
		//cos.jar에서 기본제공하는 파일명 rename객체가 있음.
		DefaultFileRenamePolicy rename=new DefaultFileRenamePolicy();
//		중복값이 있으면 이름그대로 중복값있으면 숫자가 붙음
		
		
		//cos.jar에서 제공하는 multpartRequest객체를 생성하면 업로드됨
		
		MultipartRequest mr=new MultipartRequest(request, path,maxSize,encode,rename);
		
		//multipartRequest 객체를 생성한후 파라미터값을 MultipartRequest로 가져롸야함
		//HttpServletRequest를 사용하지 않음
		
		
		Review r=new Review();
		r.setHouseNo(mr.getParameter("houseNo"));
		r.setMemberNo(mr.getParameter("memberNo"));
		r.setHouseGrade(Double.parseDouble(mr.getParameter("houseGrade")));
		r.setCommentTitle(mr.getParameter("commentTitle"));
		r.setCommentContents(mr.getParameter("commentContents"));
		r.setFilePath(mr.getFilesystemName("upload"));
		
		int result=new HouseService().insertReview(r);
		
		
		
      //result가 0보다 크면(1이면) 등록성공, 아니면 등록 실패
      //결과에 따라 메세지를 출력하고 메인화면으로 이동

		String msg="";
		String loc="/house/review";
		msg=result>0?"공지사항등록성공":"공지사항등록실패";
		request.setAttribute("msg",msg);
		request.setAttribute("loc",loc);
		request.getRequestDispatcher("/views/common/msg.jsp")
		.forward(request, response);
	}
	
	
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
