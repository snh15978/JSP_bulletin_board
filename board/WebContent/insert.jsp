<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%@ page import="java.sql.*" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<%
	int count = 0;
	request.setCharacterEncoding("euc-kr");
	String strTitle = request.getParameter("strTitle");
	String inputStr = request.getParameter("inputWord");
	String errorIdx = request.getParameter("errorIdx");
	String errorWord = request.getParameter("errorWord");
	String replaceWord = request.getParameter("replaceWord");
	String comment = request.getParameter("comment");
	String reportTime = request.getParameter("reportTime");
	
	try {
	    String driverName = "oracle.jdbc.driver.OracleDriver"; //데이터베이스에 접속하기위한 드라이버를 로드합니다.
	    String url = "jdbc:mysql://164.125.36.46:3306/customers";            //접속 URL정보와 포트번호(oracle포트), sid(oracle버전)
	    
	    Class.forName("com.mysql.jdbc.Driver");
	    Connection con = DriverManager.getConnection(url,"root","skfkdlsvh46!");    // getCo... : 계정정보 url, id, pw
	    out.println("Oracle 데이터베이스 db에 성공적으로 접속했습니다");
	    
	    Statement stmt = con.createStatement();            // SQL 쿼리를 날리기위한 Statement 객체 생성

	    //String sql = "INSERT INTO BOARD "+"(IDX, TITLE, WRITER, REGDATE, COUNT, CONTENT) " + "VALUES (" + 2 +", '"+title+"', '"+writer+"', '"+regdate+"', '1', '"+content+"')";
	   	System.out.println("INSERT INTO bugreport(strTitle, inputStr, errorIdx, errorWord, replaceWord, comment, reportTime) VALUES (" + "'" + strTitle +"','" + inputStr + "','" +
	    		errorIdx + "','" + replaceWord + "','" + comment + "','" + reportTime + "');");
	   	
	    String sql = "INSERT INTO bugreport(strTitle, inputStr, errorIdx, errorWord, replaceWord, comment, reportTime) VALUES (" + "'" + strTitle +"','" + inputStr + "','" +
	    		errorIdx + "','" + errorWord + "','" + replaceWord + "','" + comment + "','" + reportTime + "');";
	    stmt.executeUpdate(sql);                                                // 쿼리를 실행합니다.
	    con.close();
	} catch (Exception e) {
	    out.println("Oracle 데이터베이스 db 접속에 문제가 있습니다. <hr>");
	    out.println(e.getMessage());
	    e.printStackTrace();
	}
%>
</head>
<body>
</body>
</html>