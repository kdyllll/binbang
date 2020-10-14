package com.binbang.house.ajax.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.binbang.house.model.service.HouseService;

/**
 * Servlet implementation class AutoCompleteAjaxServlet
 */
@WebServlet("/house/autoCompleteAjax")
public class AutoCompleteAjaxServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AutoCompleteAjaxServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String key=request.getParameter("key");
		List list=new HouseService().selectLocation(key);
		//csv방식으로 전송
		String csv="";
		
		for(int i=0;i<list.size();i++) {
			String address=(String)list.get(i); //경기도 군포시 군포로00길 00-00
			List addList=new ArrayList();
			addList.add(address.substring(0,address.indexOf(" ",address.indexOf(" ")+1)));
			//String[] loArr=address.split("\\s"); //[경기도,군포시,...]
			if(i!=0) csv+=",";
				for(Object o:addList) { //세번째 묶음까지만 인식하자
					csv+=(String)o;
				}	
		}
		response.setContentType("text/csv;charset=utf-8");
		response.getWriter().print(csv);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
