<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="set.SetDAO" %>
<%@ page import="set.SetDTO" %>
<%@ page import="java.io.PrintWriter"%>

<%
	request.setCharacterEncoding("UTF-8");
	int idx = 0;
	String fixed=null;
	String userfix=null;
	String userID = null;
	
	if(request.getParameter("idx") != null){
		idx = Integer.parseInt(request.getParameter("idx"));
	}
	if(request.getParameter("a") != null){
		fixed = request.getParameter("a");
	}
	if(request.getParameter("fixText") != null){
		userfix = request.getParameter("fixText");
	}
	if(request.getParameter("userID") != null){
		userID = request.getParameter("userID");
	}
	System.out.println(idx+ " " + fixed + "   " + userfix + " " + userID);
	
	
	
	SetDAO setDAO = new SetDAO();
	
	int result = setDAO.fix(idx, fixed, userfix, userID);

	if(result== -1){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('저장 실패')");
		script.println("</script>");
		script.close();
		return;	
	}else{
		//session.setAttribute("userID", userID);
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('저장 완료')");
		script.println("</script>");
		script.close();
		return;
	} 
	
/* 	UserDAO userDAO = new UserDAO();
	int result = userDAO.join(new UserDTO(userID, userName, userPassword));
	System.out.println(result);
	if(result== -1){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('이미 존재하는 아이디입니다.')");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		return;	
	}else{
		//session.setAttribute("userID", userID);
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('가입이 완료되었습니다.')");
		script.println("location.href = 'userLogin.jsp';");
		script.println("</script>");
		script.close();
		return;
	} */
%>