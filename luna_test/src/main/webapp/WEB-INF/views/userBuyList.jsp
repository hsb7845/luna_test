<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 구매 목록</title>
</head>
<body>
<%@ include file="header.jsp" %>
<h1 align="center">내 구매목록</h1>
<table border="1">
	<tr>
		<th>이미지</th>
		<th colspan="2">상품명</th>
		<th>가격</th>
		<th>구매날짜</th>
		<th></th>
	</tr>
	<c:forEach items="${list }" var="i">
		<tr>
			<td>${i.image.imgname }</td>
			<td colspan="2"><a href="buyDetail.do?bdseq=${i.bdseq }">${i.pboard.ptitle }<br>${i.selOpt }</a></td>
			<td>${i.price }</td>
			<td><fmt:formatDate value="${i.blDTO.buyDate }" pattern="yyyy년MM월dd일 hh:mm:ss" /></td>
			<td><button onclick="location.href='insertrboardform.do?pseq=${i.pboard.pseq}';">리뷰작성</button>
		</tr>
	</c:forEach>
	<%@ include file="footer.jsp" %>
</table>
</body>
</html>