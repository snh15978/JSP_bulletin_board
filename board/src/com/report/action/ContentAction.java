package com.report.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.report.beans.Bugreport;
import com.report.controller.CommandAction;
import com.report.dao.bugreportDAO;

public class ContentAction implements CommandAction{

	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub

		int idx = Integer.parseInt(request.getParameter("number"));
		
		Bugreport report = bugreportDAO.getInstance().GetReport(idx);
		
		report.toString();
		request.setAttribute("report", report);

		return "content.jsp";
	}

}
