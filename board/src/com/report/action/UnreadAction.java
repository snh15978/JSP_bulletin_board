package com.report.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.report.beans.Bugreport;
import com.report.controller.CommandAction;
import com.report.dao.bugreportDAO;

public class UnreadAction implements CommandAction{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		//int page = 0;
		String count = null;
		//String SearchType = null;
		//String keyword = null;
		//String ButtonType= null;
		//ArrayList<Bugreport> reportList = null;
		
/*		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		if(request.getParameter("keyword") != null) {
			keyword = request.getParameter("keyword");
		}
		if(request.getParameter("SearchType") != null) {
			SearchType = request.getParameter("SearchType");			
		}
		if(request.getParameter("ButtonType") != null) {
			ButtonType = request.getParameter("ButtonType");
		}*/
		
		count = String.valueOf(bugreportDAO.getInstance().getUnreadCnt());

		
		System.out.println("안 읽은 게시글 수 " + count);
/*		request.setAttribute("reportList", reportList);
		request.setAttribute("page", page);
		request.setAttribute("keyword", keyword);
		request.setAttribute("SearchType", SearchType);
		request.setAttribute("ButtonType", ButtonType);*/
		request.setAttribute("Count", count);
		return count;
	}

}
