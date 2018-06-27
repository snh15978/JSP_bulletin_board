<%@ page language="java" contentType="text/html; charset=EUC-KR"  pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head></head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<form action="insert.jsp" method="post" onsubmit="return formCheck();">
		제목 : <input type="text" name="strTitle" /><br/>
		입력단어 : <input type="text" name="inputWord" /><br/>
		오류번호 : <input type="text" name="errorIdx" /><br/>
		오류단어 : <input type="text" name="errorWord" /><br/>
		대치어 : <input type="text" name="replaceWord" /><br/>
		의견 : <input type="text" name="comment" /><br/>
		날짜 : <input type="text" name="reportTime" /><br/>
		<input type="submit" />
	</form>
	<script>
		alert(document.forms[0].title.name);
		
		function formCheck(){
			var length = document.forms[0].length-1; 
			// submit을 제외한 모든 input태그의 갯수를 가져옴
			 
			for(var i = 0; i < length; i++){     // 루프를 돌면서
			 
			    if(document.forms[0][i].value == null || document.forms[0][i].value == ""){
			 
			        alert(document.forms[0][i].name + "을/를 입력하세요."); // 경고창을 띄우고
			 
			        document.forms[0][i].focus();           // null인 태그에 포커스를 줌
			 
			        return false;
			 
			    }//end if
			 
			}//end for			
		}
	</script>
</body>
</html>