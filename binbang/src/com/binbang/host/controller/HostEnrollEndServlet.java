package com.binbang.host.controller;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.binbang.host.model.service.HostService;
import com.binbang.host.model.vo.Host;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * Servlet implementation class HostEnrollEndServlet
 */
@WebServlet("/host/hostEnrollEnd")
public class HostEnrollEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HostEnrollEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		if(!ServletFileUpload.isMultipartContent(request)) {
			request.setAttribute("msg", "요청정보가 이상합니다. 관리자에게 문의하세요");
			request.setAttribute("loc", "/host/hostEnroll");
			request.getRequestDispatcher("/views/common/printMsg.jsp").forward(request, response);;
			return;
		}
		String path = getServletContext().getRealPath("/upload/host");
		String encode = "UTF-8";
		int maxSize = 1024*1024*50;
		DefaultFileRenamePolicy rename = new DefaultFileRenamePolicy();
		MultipartRequest mr = new MultipartRequest(request,path,maxSize,encode,rename);
		
		Host host = new Host();
		host.setIdCard(mr.getFilesystemName("uploadId"));
		host.setProfilePic(mr.getFilesystemName("uploadProfile"));
		host.setIntro(mr.getParameter("hostCon"));
		host.setMemberNo(mr.getParameter("memberNo"));
		
		int result = new HostService().hostEnroll(host);
		
		String msg = "";
		String loc ="";
		if(result > 0 ) {
			msg="등록에 성공하였습니다. 관리자의 승인을 기다려주세요.";
			loc ="/mainMove";
			
		} else {
			msg = "등록에 실패하였습니다. 다시시도해주세요";
			loc = "/host/hostEnroll";
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
