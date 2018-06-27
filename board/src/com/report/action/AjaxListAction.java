package com.report.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.report.beans.Bugreport;
import com.report.controller.CommandAction;
import com.report.dao.bugreportDAO;

public class AjaxListAction implements CommandAction{

	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		
		int page = 0;
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		ArrayList<Bugreport> reportList = bugreportDAO.getInstance().getReportList(page);
		request.setAttribute("reportList", reportList);
		//request.setAttribute("page", page);
		return "ajaxList.jsp";
	}

}
