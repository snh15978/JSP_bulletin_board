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
		
		//System.out.println("������ : " + page + ", Ű���� : " + keyword + ", ��ưŸ�� : " + ButtonType + ", �˻�Ÿ�� : " + SearchType);
		
		if((SearchType == null || SearchType.equals("")) && (ButtonType == null||ButtonType.equals(""))) {
			//System.out.println("��ü");
			//SearchType="��ü";
			//System.out.println("�⺻");
			reportList = bugreportDAO.getInstance().getReportList(page);
		}
		if(keyword != null && (ButtonType == null||ButtonType.equals(""))) {
			//��ü
			if(SearchType.equals("��ü")) {
				//System.out.println("��ü");
				reportList = bugreportDAO.getInstance().getSearchList(page, keyword);
			}
			//�����ܾ�
			else if(SearchType.equals("�����ܾ�")) {
				//System.out.println("�����ܾ�");
				reportList = bugreportDAO.getInstance().getErrorList(page, keyword);
			}
			
			//��ġ��
			else if(SearchType.equals("��ġ��")) {
				//System.out.println("��ġ��");
				reportList = bugreportDAO.getInstance().getReplaceList(page, keyword);
			}
			
		}
		else if((keyword == null || keyword.equals("")) && ButtonType != null) {
			if(ButtonType.equals("������")) {
				//System.out.println("");
				reportList = bugreportDAO.getInstance().unReadList(page);
			}
			//�߿�
			else if(ButtonType.equals("�߿�")) {
				//System.out.println("�߿�");
				reportList = bugreportDAO.getInstance().importantList(page);
			}	
		}
		
		count = String.valueOf(bugreportDAO.getInstance().getUnreadCnt());
		
		//System.out.println("�Խñ� �� " + reportList.size());
		request.setAttribute("reportList", reportList);
		request.setAttribute("page", page);
		request.setAttribute("keyword", keyword);
		request.setAttribute("SearchType", SearchType);
		request.setAttribute("ButtonType", ButtonType);
		request.setAttribute("Count", count);
		return "list.jsp";
	}

}
