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
		location.href="myPage.do?id="+$("input[name='id']").val();
	})
});
</script>
</head>
<%@ include file="header.jsp" %>

<body>
<form>
<h1>상품 구매를 완료하였습니다.</h1>
<p>입금계좌 : ${bank }</p>
<p>입금액 : ${totalPrice }</p>
<button id="goMyPage">마이페이지 이동</button>
<input type="hidden" name="id" value=${id }>
</form>
</body>
<%@ include file="footer.jsp" %>
</html>