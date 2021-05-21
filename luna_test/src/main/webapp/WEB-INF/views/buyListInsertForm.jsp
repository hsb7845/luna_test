<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
	isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구매 추가</title>

<style>
	.cls1 {
	    font-size: 40px;
	    text-align: center;
	}
</style>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
$(function(){
	$("#main").click(function(){
		location.href='.do'
	});
})
</script>

</head>
<body>
<%@ include file="header.jsp" %>
<p class="cls1">구매 추가</p>
	<form method="post" action="buyListInsert.do">
	<table>
		<tr>
			<th>아이디</th>
			<td><input type="text" name="id"></td>
		</tr>
		<tr>
			<th>운송장번호</th>
			<td><input type="text" name="trackingNum"></td>
		</tr>
		<tr>
			<th>배송현황</th>
			<td><input type="text" name="delStatus"></td>
		</tr>
		<tr>
			<th>받는이</th>
			<td><input type="text" name="name"></td>
		</tr>
		<tr>
			<th>주소</th>
			<td><input type="text" name="address"></td>
		</tr>
		<tr>
			<th>전화번호</th>
			<td><input type="text" name="phone"></td>
		</tr>
		<tr>
			<th>총금액</th>
			<td><input type="text" name="totalPrice"></td>
		</tr>

		<tr>
			<td colspan="2">
				<input type="submit" value="작성">
				<input type="button" value="메인" id="main">
			</td>
		</tr>
		<%@ include file="footer.jsp" %>
	</table>
	</form>
</body>
</html>