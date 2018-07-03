<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="user.UserDAO" %>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
	
	<!-- 부트스트랩 CSS 추가하기 -->
	<link rel="stylesheet" href="./css/bootstrap.min.css">
	<!-- 커스텀 CSS 추가하기 -->
	<link rel="stylesheet" href="./css/custom.css">
	
	<link href="//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
	<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
	<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>	
<title>Insert title here</title>
<style>
div.left{
	width: 20%;
	float : left;
	box-sizing: border-box;

}
div.right{
	width: 80%;
	float: right;
	box-sizing: border-box;
}
body{
	margin-top:50px;
}

.glyphicon { 
	margin-right:10px; 
}
	
.panel-body { 
	padding:0px; 
}

.panel-body table tr td {
 	padding-left: 15px;
 }
 
.panel-body .table {
	margin-bottom: 0px; 
}

</style>
</head>
<body>
<%
	String userID = null;
	if(session.getAttribute("userID") != null){
		userID = (String) session.getAttribute("userID");
	}
	if(userID != null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('이미 로그인이 되있습니다.')");
		script.println("location.href = 'index.jsp';");
		script.println("</script>");
		script.close();
		return;	
	}
%>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
<%
	if(userID == null){
%>
		<a class="navbar-brand" href="userJoin.jsp">가입</a>
	    <a class="navbar-brand" href="userLogin.jsp">로그인</a> 
<%
	}
	else{
%>
		<a class="navbar-brand" href="userLogout.jsp">로그아웃</a>
<%
	}
%>
	</nav>
	
	<section class="container mt-3" style="max-width: 560px;">
		<form method="post" action="./userLoginAction.jsp">
			<div class="form-group">
				<label>아이디</label>
				<input type="text" name="userID" class="form-control">
			</div>
			<div class="form-group">
				<label>비밀번호</label>
				<input type="password" name="userPassword" class="form-control">
			</div>
			<button type="submit" class="btn btn-primary">로그인</button>
		</form>
	</section>
	
	<!-- 제이쿼리 자바스크립트 추가하기 -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
</body>

</html>