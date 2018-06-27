package com.report.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.report.beans.Bugreport;
import com.report.controller.CommandAction;
import com.report.dao.bugreportDAO;

public class ImportantAction implements CommandAction {

	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {

		int idx = Integer.parseInt(request.getParameter("number"));
		Bugreport report = bugreportDAO.getInstance().GetReport(idx);

		int count = report.getImportant();
		
		if( count == 0) {
			count+=1;
			report.setCount(count);
			bugreportDAO.getInstance().setImportantCheck(report);			
		}
		else {
			count-=1;
			report.setCount(count);
			bugreportDAO.getInstance().setImportantCheck(report);		
		}
		
		request.setAttribute("url", "content.do?number="+idx);

		return "redirect2.jsp";
	}

}
