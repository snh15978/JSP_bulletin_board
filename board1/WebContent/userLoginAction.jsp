<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="user.UserDTO"%>
<%@ page import="user.UserDAO"%>
<%@ page import="java.io.PrintWriter"%>
<%
	request.setCharacterEncoding("UTF-8");
	String userID=null;
	String userPassword=null;
	
	if(request.getParameter("userID") != null){
		userID = request.getParameter("userID");
	}
	if(request.getParameter("userPassword") != null){
		userPassword = request.getParameter("userPassword");
	}

	
	if( userID == null || userPassword==null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('입력이 안 된 사항이 있습니다.')");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		return;
	}
	
	UserDAO userDAO = new UserDAO();
	int result = userDAO.login(userID, userPassword);
	if(result== -1){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('아이디가 존재하지 않습니다.')");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		return;	
	}
	else if(result== -2){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('데이터베이스 오류')");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		return;	
	}
	else if(result== 0){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('비밀번호 오류')");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		return;	
	}	
	else{
		PrintWriter script = response.getWriter();
		session.setAttribute("userID", userID);
		script.println("<script>");
		script.println("alert('로그인 성공!')");
		script.println("location.href = 'index.jsp'");
		script.println("</script>");
		script.close();
		return;
	}
%>