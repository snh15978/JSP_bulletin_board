<%@ page language="java" contentType="text/html; charset=EUC-KR"  pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head></head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<form action="insert.jsp" method="post" onsubmit="return formCheck();">
		���� : <input type="text" name="strTitle" /><br/>
		�Է´ܾ� : <input type="text" name="inputWord" /><br/>
		������ȣ : <input type="text" name="errorIdx" /><br/>
		�����ܾ� : <input type="text" name="errorWord" /><br/>
		��ġ�� : <input type="text" name="replaceWord" /><br/>
		�ǰ� : <input type="text" name="comment" /><br/>
		��¥ : <input type="text" name="reportTime" /><br/>
		<input type="submit" />
	</form>
	<script>
		alert(document.forms[0].title.name);
		
		function formCheck(){
			var length = document.forms[0].length-1; 
			// submit�� ������ ��� input�±��� ������ ������
			 
			for(var i = 0; i < length; i++){     // ������ ���鼭
			 
			    if(document.forms[0][i].value == null || document.forms[0][i].value == ""){
			 
			        alert(document.forms[0][i].name + "��/�� �Է��ϼ���."); // ���â�� ����
			 
			        document.forms[0][i].focus();           // null�� �±׿� ��Ŀ���� ��
			 
			        return false;
			 
			    }//end if
			 
			}//end for			
		}
	</script>
</body>
</html>