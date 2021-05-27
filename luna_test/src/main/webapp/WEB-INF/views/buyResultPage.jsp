<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="<c:url value='resources/js/jquery-3.6.0.min.js'/>"></script>
<script>
$(document).ready(function(){
	$("#goMyPage").click(function(){
		var id = $("input[name='id']").val();
		location.href="myPage.do";
	})
});
</script>
</head>
<%@ include file="header.jsp" %>

<body>
<form action="myPage.do" method="post">
<h1>상품 구매를 완료하였습니다.</h1>
<p>입금계좌 : ${bank }</p>
<p>입금액 : ${totalPrice }</p>
<button onclick="location.href='myPage.do?id=${id}';">마이페이지 이동</button>
<input type="hidden" name="id" value=${id }>
</form>
</body>
<%@ include file="footer.jsp" %>
</html>