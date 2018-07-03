<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.io.PrintWriter" %>
<%@ page import="user.UserDAO" %>
<%@ page import="set.SetDAO" %>
<%@ page import="set.SetDTO" %>
<%@ page import="page.PageDAO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.net.URLEncoder" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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

div.right{
	width: 90%;
}

.green{
	background-color:lightgreen;
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
<%
	request.setCharacterEncoding("UTF-8");
	String selectName="";
	int pageNumber = 0;
	String userID = null;
	
	if(request.getParameter("selectName") !=null){
		selectName=request.getParameter("selectName");
	}

	if(request.getParameter("pageNumber") !=null){
		try{
			pageNumber=Integer.parseInt(request.getParameter("pageNumber"));
		} catch(Exception e){
			System.out.println("번호 오류");
		}
	}
	System.out.println("페이지넘버: " + pageNumber);
	
	if(session.getAttribute("userID") != null){
		userID = (String) session.getAttribute("userID");
	}
	
	
%>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
<%
	if(userID == null){
%>
		<a class="navbar-brand" href="userJoin.jsp">가입</a>
	    <a class="navbar-brand" href="userLogin.jsp">로그인</a> 
<%
	}else{
%>
		<a class="navbar-brand" href="userLogout.jsp">로그아웃</a>
<%
	}
%>
		<form method="get" action="./index.jsp" class="form-inline mt-3">
			<select name="selectName" class="form-control form-control-lg">
				<option value="test" <%if(selectName.equals("test")) out.println("selected"); %>>test</option>
				<option value="당신옆이좋아_4회" <%if(selectName.equals("당신옆이좋아_4회")) out.println("selected"); %>>당신옆이좋아_4회</option>
				<option value="대화셋_전체" <%if(selectName.equals("대화셋_전체")) out.println("selected"); %>>대화셋_전체</option>
				<option value="2005-질문말뭉치" <%if(selectName.equals("2005-질문말뭉치")) out.println("selected"); %>>2005-질문말뭉치</option>
				<option value="2006_대화체텍스트" <%if(selectName.equals("2006_대화체텍스트")) out.println("selected"); %>>2006_대화체텍스트</option>
				<option value="text_kr_drama" <%if(selectName.equals("text_kr_drama")) out.println("selected"); %>>text_kr_drama</option>
				<option value="text_comminity" <%if(selectName.equals("text_comminity")) out.println("selected"); %>>text_comminity</option>
			</select>
			<button type="submit" class="btn btn-primary mx-1 mt-2">이동</button>
		</form>
	</nav>
	
	<section class="container">


		
		<div class="right">
		<!-- 오류문장, 검사결과 문장, 수정 텍스트칸, 수정 버튼, 수정한 사람 목록 -->
			<h4><%=selectName%></h4>
			<%
				System.out.println(selectName);
				int totalPageCnt = new PageDAO().getCnt(selectName);
				System.out.println(totalPageCnt);
				ArrayList<SetDTO> setList = new ArrayList<SetDTO>();
				setList = new SetDAO().getList(selectName,pageNumber);
				if(setList != null){
					System.out.println("row 수 : " + setList.size());
					for(int i=0;i<setList.size();i++){
						if(i==10) break;
						SetDTO set = setList.get(i);
						if(set.getFixedTime() != null){
			%>
			<div class="card bg-light mt-3 col-20 ">
				<div class="card-body mt-3" id = "set_<%= set.getIdx() %>">
					<div class="col-xs-7" >
						<strong>#<%= set.getIdx() %></strong><br>
						<strong>오류 문장 :</strong> <span id="src<%= set.getIdx() %>"><%= set.getSrc() %></span><br>
						<strong>교정 문장 :</strong> <span id="fix<%= set.getIdx() %>"><%= set.getUserFixed() %></span><br>
						<input class="form-control" value="<%= set.getUserFixed()%>" type="text" id="userfix<%= set.getIdx() %>">
						<%
						if(session.getAttribute("userID") != null){
							userID = (String) session.getAttribute("userID");
						}
						%>
						<button id="set_<%= set.getIdx() %>" type="submit" class="btn btn-default btn btn-success" onclick='fixed(<%= set.getIdx() %>, fix<%= set.getIdx() %>,userfix<%= set.getIdx() %>,"<%= userID %>", name<%= set.getIdx() %>, date<%= set.getIdx() %>)'>저장</button>
						수정자 및 수정 날짜 : <span id="name<%= set.getIdx() %>"><%= set.getLastFixer() %></span>, <span id="date<%= set.getIdx() %>"><fmt:formatDate value="<%= set.getFixedTime() %>" pattern="yyyy-MM-dd HH:mm:ss" /></span>
						
					</div>
				</div>	
			</div>	
			<%
						}else{
						%>
			<div class="card bg-light mt-3 col-20 ">
				<div class="card-body mt-3">
					<div class="col-xs-7">
						<strong>#<%= set.getIdx() %></strong><br>
						<strong>오류 문장 :</strong> <span id="src<%= set.getIdx() %>"><%= set.getSrc() %></span><br>
						<strong>교정 문장 :</strong> <span id="fix<%= set.getIdx() %>"><%= set.getUserFixed() %></span><br>
						<input class="form-control" value="<%= set.getUserFixed() %>" type="text" id="userfix<%= set.getIdx() %>">
						<%
						if(session.getAttribute("userID") != null){
							userID = (String) session.getAttribute("userID");
						}
						%>
						<button id="set_<%= set.getIdx() %>" type="submit" class="btn btn-default" onclick='fixed(<%= set.getIdx() %>, fix<%= set.getIdx() %>,userfix<%= set.getIdx() %>,"<%= userID %>", name<%= set.getIdx() %>, date<%= set.getIdx() %>, set_<%= set.getIdx() %>)'>저장</button>
						수정자 및 수정 날짜 : <span id="name<%= set.getIdx() %>"><%= set.getLastFixer() %></span>, <span id="date<%= set.getIdx() %>"><fmt:formatDate value="<%= set.getFixedTime() %>" pattern="yyyy-MM-dd HH:mm:ss" /></span>
						
					</div>
				</div>	
			</div>									
						<% 
						}
						
						
					}
				}
			%>															
		</div>
	<div class="row">
		<div class="col-xs-6 col-sm-4">
			<ul class="pagination justify-content-center mt-3">
				<li class="page-item">
				<%
					if(pageNumber <=0){
				%>
				<a class="page-link disabled">이전</a>
				<%
					}else{
				%>
					<li class="page-item"><a class="page-link" href="index.jsp?selectName=<%= URLEncoder.encode(selectName,"UTF-8") %>&pageNumber=<%= pageNumber - 1 %>">이전</a>
				<%
					}
				%>
				</li>
				<%
					if(pageNumber-1 == 0){
				%>		
					<li class="page-item"><a class="page-link" href="index.jsp?selectName=<%= URLEncoder.encode(selectName,"UTF-8") %>&pageNumber=<%= pageNumber - 1 %>"><%= pageNumber - 1 + 1 %></a></li>
					<li class="page-item active"><a class="page-link" href="index.jsp?selectName=<%= URLEncoder.encode(selectName,"UTF-8") %>&pageNumber=<%= pageNumber %>"><%= pageNumber + 1 %></a></li>
					<li class="page-item"><a class="page-link" href="index.jsp?selectName=<%= URLEncoder.encode(selectName,"UTF-8") %>&pageNumber=<%= pageNumber + 1 %>"><%= pageNumber + 1 + 1 %></a></li>
					<li class="page-item"><a class="page-link" href="index.jsp?selectName=<%= URLEncoder.encode(selectName,"UTF-8") %>&pageNumber=<%= pageNumber + 2 %>"><%= pageNumber + 2 + 1 %></a></li>
					<li class="page-item"><a class="page-link" href="index.jsp?selectName=<%= URLEncoder.encode(selectName,"UTF-8") %>&pageNumber=<%= pageNumber + 3 %>"><%= pageNumber + 3 + 1 %></a></li>					
					
				<%
					}else if(pageNumber - 2 >= 0){
				%>		
					<li class="page-item"><a class="page-link" href="index.jsp?selectName=<%= URLEncoder.encode(selectName,"UTF-8") %>&pageNumber=<%= pageNumber - 2 %>"><%= pageNumber - 2 + 1 %></a></li>
					<li class="page-item"><a class="page-link" href="index.jsp?selectName=<%= URLEncoder.encode(selectName,"UTF-8") %>&pageNumber=<%= pageNumber - 1 %>"><%= pageNumber - 1 + 1 %></a></li>
					<li class="page-item active"><a class="page-link" href="index.jsp?selectName=<%= URLEncoder.encode(selectName,"UTF-8") %>&pageNumber=<%= pageNumber %>"><%= pageNumber + 1 %></a></li>
					<li class="page-item"><a class="page-link" href="index.jsp?selectName=<%= URLEncoder.encode(selectName,"UTF-8") %>&pageNumber=<%= pageNumber + 1 %>"><%= pageNumber + 1 + 1 %></a></li>
					<li class="page-item"><a class="page-link" href="index.jsp?selectName=<%= URLEncoder.encode(selectName,"UTF-8") %>&pageNumber=<%= pageNumber + 2 %>"><%= pageNumber + 2 + 1 %></a></li>				
				<%
					}else{
				%>
					<li class="page-item active"><a class="page-link" href="index.jsp?selectName=<%= URLEncoder.encode(selectName,"UTF-8") %>&pageNumber=<%= pageNumber %>"><%= pageNumber + 1 %></a></li>
					<li class="page-item"><a class="page-link" href="index.jsp?selectName=<%= URLEncoder.encode(selectName,"UTF-8") %>&pageNumber=<%= pageNumber + 1 %>"><%= pageNumber + 1 + 1 %></a></li>
					<li class="page-item"><a class="page-link" href="index.jsp?selectName=<%= URLEncoder.encode(selectName,"UTF-8") %>&pageNumber=<%= pageNumber + 2 %>"><%= pageNumber + 2 + 1 %></a></li>
					<li class="page-item"><a class="page-link" href="index.jsp?selectName=<%= URLEncoder.encode(selectName,"UTF-8") %>&pageNumber=<%= pageNumber + 3 %>"><%= pageNumber + 3 + 1 %></a></li>
					<li class="page-item"><a class="page-link" href="index.jsp?selectName=<%= URLEncoder.encode(selectName,"UTF-8") %>&pageNumber=<%= pageNumber + 4 %>"><%= pageNumber + 4 + 1 %></a></li>				
				<%
					}
				%>					
				<li>
				<%
					if(pageNumber < totalPageCnt -1){
				%>
					<li class="page-item"><a class="page-link" href="index.jsp?selectName=<%= URLEncoder.encode(selectName,"UTF-8") %>&pageNumber=<%= pageNumber + 1 %>">다음</a>
				<%
					}else{
				%>	
					<a class="page-link disabled">다음</a>
				<%
					}
				%>		
				</li>
			</ul>
		</div>
		
		<div class="row">
			<div class="col-xs-6 col-sm-4">
				<p class="mt-3">총 페이지 : <%=totalPageCnt %></p>
			</div>			
			<div class="col-xs-6 col-sm-4">
				<input type="text" id="pageinput" class="form-control justify-content-center mt-3" value="<%=pageNumber + 1%>" >
			</div>
			<div class="col-xs-6 col-sm-4">
				<button class="btn btn-default justify-content-center mt-3" onclick='go("<%=selectName%>")'>이동</button>
			</div>
		</div>
	</div>
	</section>

<!-- 제이쿼리 자바스크립트 추가하기 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
	
<script type= text/javascript>

	Number.prototype.padLeft = function(base, chr)
	{
		   var len = (String(base || 10).length - String(this).length)+1;
		   return len > 0? new Array(len).join(chr || '0')+this : this;
	}

	
	function fixed(idx, fixed, userFix, userID, idField, dateField, buttonID)
	{
	    var d = new Date,
	    	dformat = [d.getFullYear(),
	    				(d.getMonth()+1).padLeft(),
	    				d.getDate().padLeft()].join('-')+
	    				' ' + 
	    				[d.getHours().padLeft(),
	    				d.getMinutes().padLeft(),
	    				d.getSeconds().padLeft()].join(':');
	    
		if(userID == "null" || userID == null){
			alert("로그인하시기 바랍니다.");
		} else{
			var fixText = $(fixed).text();
			var a = $(userFix).val(); 
  			$.ajax({
				   type:'post',
				   url:'userFixedAction.jsp',
				   data: {idx:idx, a:a, fixText:fixText, userID:userID},
				   datatype: "json",
				   success:function(data){
						console.log("성공");
						$(fixed).text(a);
						$(userFix).val(a); //텍스트필드 초기화
						$(idField).text(userID);
						$(dateField).text(dformat);
						var selected = $(buttonID).hasClass("btn btn-success");
						if(!selected){
							$(buttonID).addClass("btn btn-success");
						}
				   }
			});
		}
	}

	function go(division){
		var pageNum = $('#pageinput').val() - 1;
		var url = "index.jsp?selectName=" + division + "&pageNumber=" + pageNum;
		console.log(url);
		location.href=url;
	}
	
</script>
	
</body>

</html>