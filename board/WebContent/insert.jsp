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
	    String driverName = "oracle.jdbc.driver.OracleDriver"; //�����ͺ��̽��� �����ϱ����� ����̹��� �ε��մϴ�.
	    String url = "jdbc:mysql://164.125.36.46:3306/customers";            //���� URL������ ��Ʈ��ȣ(oracle��Ʈ), sid(oracle����)
	    
	    Class.forName("com.mysql.jdbc.Driver");
	    Connection con = DriverManager.getConnection(url,"root","skfkdlsvh46!");    // getCo... : �������� url, id, pw
	    out.println("Oracle �����ͺ��̽� db�� ���������� �����߽��ϴ�");
	    
	    Statement stmt = con.createStatement();            // SQL ������ ���������� Statement ��ü ����

	    //String sql = "INSERT INTO BOARD "+"(IDX, TITLE, WRITER, REGDATE, COUNT, CONTENT) " + "VALUES (" + 2 +", '"+title+"', '"+writer+"', '"+regdate+"', '1', '"+content+"')";
	   	System.out.println("INSERT INTO bugreport(strTitle, inputStr, errorIdx, errorWord, replaceWord, comment, reportTime) VALUES (" + "'" + strTitle +"','" + inputStr + "','" +
	    		errorIdx + "','" + replaceWord + "','" + comment + "','" + reportTime + "');");
	   	
	    String sql = "INSERT INTO bugreport(strTitle, inputStr, errorIdx, errorWord, replaceWord, comment, reportTime) VALUES (" + "'" + strTitle +"','" + inputStr + "','" +
	    		errorIdx + "','" + errorWord + "','" + replaceWord + "','" + comment + "','" + reportTime + "');";
	    stmt.executeUpdate(sql);                                                // ������ �����մϴ�.
	    con.close();
	} catch (Exception e) {
	    out.println("Oracle �����ͺ��̽� db ���ӿ� ������ �ֽ��ϴ�. <hr>");
	    out.println(e.getMessage());
	    e.printStackTrace();
	}
%>
</head>
<body>
</body>
</html>