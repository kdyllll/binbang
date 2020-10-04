package com.binbang.admin.ajax.controller;

import java.awt.List;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.binbang.member.model.vo.Member;

/**
 * Servlet implementation class ReserveListAjaxServlet
 */
@WebServlet("/admin/reserveListAjax")
public class ReserveListAjaxServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReserveListAjaxServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		

		
		String adminTitle="예약현황";
		
		String reserveName="예약자이름";
		String enrollDate="예약 날짜";
		String houseNo="숙소번호";
		
		ArrayList searchCategory= new ArrayList();
		searchCategory.add(reserveName);
		searchCategory.add(enrollDate);
		searchCategory.add(houseNo);
		
		ArrayList cell=new ArrayList();
		cell.add("cell1");
		cell.add("cell3");
		cell.add("cell3");
		cell.add("cell3");
		cell.add("cell2");
		cell.add("cell2");
		
		request.setAttribute("adminTilte", adminTitle);
		request.setAttribute("searchCategory", searchCategory);
		request.setAttribute("cell", cell);
		
		request.getRequestDispatcher("/views/admin/reserveListAjax.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
