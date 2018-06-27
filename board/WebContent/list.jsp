<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="com.report.beans.Bugreport" %> 
<%@ page import="java.util.ArrayList" %> 
<%@ page import="java.net.URLEncoder"%>
<!DOCTYPE html>
<html>
<head>
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
	
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta charset="utf-8">
	<title>사용자 의견</title>
	
	<!-- 부트스트랩 CSS 추가하기 -->
	<link rel="stylesheet" href="./css/bootstrap.min.css">
	<!-- 커스텀 CSS 추가하기 -->
	<link rel="stylesheet" href="./css/custom.css">
	
	<script type="text/javascript">

	
	function openContent(number){
		 $.ajax({
		   	type:'post',
		   	url:'count.do',
		   	data: ({number:number}),
		  	success:function(data){
				$('#content').html(data);
		   	}
		});
	}
	</script>
<style>
.list {
  float: left;
  width: 49%;
  height : 70vh;
  overflow-y:scroll;
}
.content {
  float: right;
  width: 49%;
  height : 70vh;
  overflow-y:scroll;
}
.font-bold{
	font-weight: 1000;
	font-size: small;
	font-color: #000000;
}

.defaultfont{
	font-size: small;
	font-color: #EE82EE;
}
.asdf{
	font-color: black !important;
}
body {
overflow:hidden
}
.button{
	background-color: #e7e7e7; color: black;
}
.active{
	background-color:#abc;
}
.read{
	background-color:#ffffff;
}
</style>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		      <a class="navbar-brand" href="index.jsp">사용자 의견</a>      
	</nav>
<!-- 오른쪽 메인 부분  -->
<div class="main">
		<form method="get" action="./list.do" class="form-inline mt-3">
			<button class="btn btn-primary mx-1 mt-2" type="submit" name="ButtonType" value="안읽음">안 읽은 글</button>
			<button class="btn btn-primary mx-1 mt-2" type="submit" name="ButtonType" value="중요">중요</button>
		</form>
			
		<form method="get" action="./list.do" class="form-inline mt-3">
			<select name="SearchType" class="form-control mx-1 mt-2">
				<option value="전체" selected>전체</option>
				<option value="오류단어">오류단어</option>
				<option value="대치어">대치어</option>
			</select>
	        <input type="text" name="keyword" class="form-control mx-1 mt-2" placeholder="내용을 입력하세요.">        
			<button type="submit" class="btn btn-primary mx-1 mt-2">검색</button>
			안 읽은 글 수 : <span id="unread">${Count}</span>
		</form>
		
	<div class="list">
		<table class="table table-bordered table-hover table-condensed">
			<tr>
				<th align="center">#</th>
				<th align="center">원문</th>
				<th align="center">오류단어</th>
				<th align="center">대치어</th>
				<th align="center">날짜</th>
				<!-- <th align="center">조회수</th> -->
	<!-- 			<th>조회수</th> -->
			</tr>
			<tbody class="test">
				<c:forEach items="${reportList}" var="report">
						<c:choose>
							<c:when test="${report.count == 0}">
								<tr class="active" onclick="openContent('${report.num}')">
									<td align="center"><p class="font-bold">${report.num}</p></td>
									<td align="center"><p class="font-bold">${report.strTitle}</p></td>
									<td align="center"><p class="font-bold">${report.errorWord}</p></td>
									<td align="center"><p class="font-bold">${report.replaceWord}</p></td>
									<td align="center"><p class="font-bold"><fmt:formatDate value="${report.reportTime}" pattern="yyyy-MM-dd hh:mm:ss" /></p></td>	
									<%-- <td align="center"><p class="font-bold">${report.count}</p></td> --%>		
								</tr>			
							</c:when>
							<c:otherwise>
								<tr class="read" onclick="openContent('${report.num}')">
									<td align="center"><p class="defaultfont">${report.num}</p></td>
									<td align="center"><p class="defaultfont">${report.strTitle}</p></td>
									<td align="center"><p class="defaultfont">${report.errorWord}</p></td>
									<td align="center"><p class="defaultfont">${report.replaceWord}</p></td>
									<td align="center"><p class="defaultfont"><fmt:formatDate value="${report.reportTime}" pattern="yyyy-MM-dd hh:mm:ss" /></p></td>	
									<%-- <td align="center"><p class="font-bold">${report.count}</p></td>--%>	
								</tr>			
							</c:otherwise>
						</c:choose>
				</c:forEach>
			</tbody>
		</table>
		<div class="text-center">
			<nav aria-label="Page navigation example">
				<ul class="pagination justify-content-center">
					<c:if test="${page > 0 }">
						<li class="page-item"><a class="page-link" href="list.do?ButtonType=${ButtonType}&SearchType=${SearchType}&keyword=${keyword}&page=${page-10}"><span aria-hidden="true">Prev</span></a></li>
					</c:if>
					<c:if test="${page == 0 }">
						<li class="page-item"><a class="page-link" href="#"><span aria-hidden="true">Prev</span><span class="sr-only">이전</span></a></li>
					</c:if>		
					<c:choose>
						<c:when test="${page-10 == 0 }"> 
							<li class="page-item"><a class="page-link" href="list.do?ButtonType=${ButtonType}&SearchType=${SearchType}&keyword=${keyword}&page=${page-10}"><fmt:parseNumber value="${(page-10)/10+1 }" type="number" integerOnly="True" /></a></li>				
							<li class="page-item active"><a class="page-link" href="list.do?ButtonType=${ButtonType}&SearchType=${SearchType}&keyword=${keyword}&page=${page}"><fmt:parseNumber value="${page/10+1 }" type="number" integerOnly="True" /></a></li>
							<li class="page-item"><a class="page-link" href="list.do?ButtonType=${ButtonType}&SearchType=${SearchType}&keyword=${keyword}&page=${page+10}"><fmt:parseNumber value="${(page+10)/10+1 }" type="number" integerOnly="True" /></a></li>
							<li class="page-item"><a class="page-link" href="list.do?ButtonType=${ButtonType}&SearchType=${SearchType}&keyword=${keyword}&page=${page+20}"><fmt:parseNumber value="${(page+20)/10+1 }" type="number" integerOnly="True" /></a></li>
							<li class="page-item"><a class="page-link" href="list.do?ButtonType=${ButtonType}&SearchType=${SearchType}&keyword=${keyword}&page=${page+30}"><fmt:parseNumber value="${(page+30)/10+1 }" type="number" integerOnly="True" /></a></li>
						</c:when>
						<c:when test="${page-20 >= 0}">
							<li class="page-item"><a class="page-link" href="list.do?ButtonType=${ButtonType}&SearchType=${SearchType}&keyword=${keyword}&page=${page-20}"><fmt:parseNumber value="${(page-20)/10+1 }" type="number" integerOnly="True" /></a></li>				
							<li class="page-item"><a class="page-link" href="list.do?ButtonType=${ButtonType}&SearchType=${SearchType}&keyword=${keyword}&page=${page-10}"><fmt:parseNumber value="${(page-10)/10+1 }" type="number" integerOnly="True" /></a></li>				
							<li class="page-item active"><a class="page-link" href="list.do?ButtonType=${ButtonType}&SearchType=${SearchType}&keyword=${keyword}&page=${page}"><fmt:parseNumber value="${page/10+1 }" type="number" integerOnly="True" /></a></li>
							<li class="page-item"><a class="page-link" href="list.do?ButtonType=${ButtonType}&SearchType=${SearchType}&keyword=${keyword}&page=${page+10}"><fmt:parseNumber value="${(page+10)/10+1 }" type="number" integerOnly="True" /></a></li>
							<li class="page-item"><a class="page-link" href="list.do?ButtonType=${ButtonType}&SearchType=${SearchType}&keyword=${keyword}&page=${page+20}"><fmt:parseNumber value="${(page+20)/10+1 }" type="number" integerOnly="True" /></a></li>				
						</c:when>
						<c:otherwise>
							<li class="page-item active"><a class="page-link" href="list.do?ButtonType=${ButtonType}&SearchType=${SearchType}&keyword=${keyword}&page=${page}"><fmt:parseNumber value="${page/10+1 }" type="number" integerOnly="True" /></a></li>
							<li class="page-item"><a class="page-link" href="list.do?ButtonType=${ButtonType}&SearchType=${SearchType}&keyword=${keyword}&page=${page+10}"><fmt:parseNumber value="${(page+10)/10+1 }" type="number" integerOnly="True" /></a></li>
							<li class="page-item"><a class="page-link" href="list.do?ButtonType=${ButtonType}&SearchType=${SearchType}&keyword=${keyword}&page=${page+20}"><fmt:parseNumber value="${(page+20)/10+1 }" type="number" integerOnly="True" /></a></li>
							<li class="page-item"><a class="page-link" href="list.do?ButtonType=${ButtonType}&SearchType=${SearchType}&keyword=${keyword}&page=${page+30}"><fmt:parseNumber value="${(page+30)/10+1 }" type="number" integerOnly="True" /></a></li>
							<li class="page-item"><a class="page-link" href="list.do?ButtonType=${ButtonType}&SearchType=${SearchType}&keyword=${keyword}&page=${page+40}"><fmt:parseNumber value="${(page+40)/10+1 }" type="number" integerOnly="True" /></a></li>				
						</c:otherwise>
					</c:choose>
					<c:if test="${fn:length( reportList ) < 10}"> 
						<li class="page-item"><a class="page-link" href="#"><span aria-hidden="true">Next</span></a></li>
					</c:if>
					<c:if test="${fn:length( reportList ) == 10}"> 
						<li class="page-item"><a class="page-link" href="list.do?ButtonType=${ButtonType}&SearchType=${SearchType}&keyword=${keyword}&page=${page+10}"><span aria-hidden="true">Next</span></a></li>
					</c:if>			
				</ul>
			</nav>
		</div>
	</div>
		<!-- 오른쪽 컨텐트 부분  -->
	<div class="content" id="content">
	게시글을 선택해주세요.
	</div>
</div>
<script>
 	function renewCnt(){
		$.ajax({
			type:"post",
			url:"Unread.do",
			success:function(data){
				console.log(data);
				$('#unread').text(data);
			}
		});
	}
	$('.test tr').click(function(){
		var selected = $(this).hasClass("read");
		if(!selected){
			$(this).addClass("read");
			var a = $("#unread").text();
			a= a-1;
			$("#unread").text(a);
		}
		
	});
</script>
	<!-- 제이쿼리 자바스크립트 추가하기 -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
</body>
</html>