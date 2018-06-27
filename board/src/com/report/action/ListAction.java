package com.report.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.report.beans.Bugreport;
import com.report.controller.CommandAction;
import com.report.dao.bugreportDAO;

public class ListAction implements CommandAction{

	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		int page = 0;
		String SearchType = null;
		String keyword = null;
		String ButtonType= null;
		ArrayList<Bugreport> reportList = null;
		String count = null;
		
		if(request.getParameter("page") != null) {
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
		}
		
		//System.out.println("페이지 : " + page + ", 키워드 : " + keyword + ", 버튼타입 : " + ButtonType + ", 검색타입 : " + SearchType);
		
		if((SearchType == null || SearchType.equals("")) && (ButtonType == null||ButtonType.equals(""))) {
			//System.out.println("전체");
			//SearchType="전체";
			//System.out.println("기본");
			reportList = bugreportDAO.getInstance().getReportList(page);
		}
		if(keyword != null && (ButtonType == null||ButtonType.equals(""))) {
			//전체
			if(SearchType.equals("전체")) {
				//System.out.println("전체");
				reportList = bugreportDAO.getInstance().getSearchList(page, keyword);
			}
			//오류단어
			else if(SearchType.equals("오류단어")) {
				//System.out.println("오류단어");
				reportList = bugreportDAO.getInstance().getErrorList(page, keyword);
			}
			
			//대치어
			else if(SearchType.equals("대치어")) {
				//System.out.println("대치어");
				reportList = bugreportDAO.getInstance().getReplaceList(page, keyword);
			}
			
		}
		else if((keyword == null || keyword.equals("")) && ButtonType != null) {
			if(ButtonType.equals("안읽음")) {
				//System.out.println("");
				reportList = bugreportDAO.getInstance().unReadList(page);
			}
			//중요
			else if(ButtonType.equals("중요")) {
				//System.out.println("중요");
				reportList = bugreportDAO.getInstance().importantList(page);
			}	
		}
		
		count = String.valueOf(bugreportDAO.getInstance().getUnreadCnt());
		
		//System.out.println("게시글 수 " + reportList.size());
		request.setAttribute("reportList", reportList);
		request.setAttribute("page", page);
		request.setAttribute("keyword", keyword);
		request.setAttribute("SearchType", SearchType);
		request.setAttribute("ButtonType", ButtonType);
		request.setAttribute("Count", count);
		return "list.jsp";
	}

}
