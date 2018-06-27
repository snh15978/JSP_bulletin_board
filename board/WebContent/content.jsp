<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<!-- 부트스트랩 CSS 추가하기 -->
	<link rel="stylesheet" href="./css/bootstrap.min.css">
	<!-- 커스텀 CSS 추가하기 -->
	<link rel="stylesheet" href="./css/custom.css">
<title>Insert title here</title>
	<script type="text/javascript">
 	function checkImportant(number){
		 $.ajax({
			   type:'post',
			   url:'important.do',
			   data: ({number:number}),
			   success:function(data){
					var sharp = $("#favorite").text();
					//var text = $("#favtext").text();
				   	if (sharp == "★"){
						$("#favorite").text("☆");
						$("#favtext").text("중요");
					} 
				   	else{
						$("#favorite").text("★");
						$("#favtext").text("중요 취소");
					} 
			   }

		});
	} 

	</script>
</head>
<body>
			<br/>
			[ 원문 ]<br/>
		 	${report.inputStr}

			<br>
			[ 오류단어  ]<br/>
			${report.errorWord}
			<br/>
			<br/>
			[ 대치어 ]<br/>
			${report.replaceWord}
			<br/>
			[ 사용자 의견 ]<br/>
			${report.comment}
			<br/>
			
	<c:if test="${report.important == 0}">
		<span id="favorite">☆</span>
		<a href='#' onclick="checkImportant('${report.num}')"><span id="favtext">중요</span></a> 
		
	</c:if>
	
	<c:if test="${report.important >= 1}">
		<span id="favorite">★</span>
		<a href='#' onclick="checkImportant('${report.num}')"><span id="favtext">중요 취소</span></a>
		
	</c:if>
			
			
	<a href='delete.do?number=${report.num}'>게시글삭제</a>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
</body>
</html>