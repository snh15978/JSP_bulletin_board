package com.report.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.report.controller.CommandAction;
import com.report.dao.bugreportDAO;

public class DeleteAction implements CommandAction{

	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		int num = Integer.parseInt(request.getParameter("number"));
		
		bugreportDAO.getInstance().deleteArticle(num);
	 
		return "delete.jsp";
	}

}
