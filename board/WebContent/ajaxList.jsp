<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<c:forEach items="${reportList}" var="report">
		<tr>
			<td>${report.num}</td>
			<td><a href='count.do?number=${report.num}'>${report.strTitle}</a></td>
			<td>${report.errorWord}</td>
			<td>${report.replaceWord}</td>
			<td>${report.reportTime}</td>
<%-- 			<td>${report.count}</td> --%>
		</tr>
	</c:forEach>