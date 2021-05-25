<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구매/결제 페이지</title>
<style>
.cmd{
	    max-width: 480px;
	    margin: 0 auto; /* 화면 가운데로 */
	    background-color: #fff;
	    height: 100%;
	    padding: 20px;
	    box-sizing: border-box;
	
	}
</style>
</head>
<body>
	<h1>구매/결제</h1>
	<form method="post" action=".do">
	<table>
		<tr>
			<th>이미지</th><th>상품명</th><th>판매가</th><th>수량</th><th>합계</th>
		</tr>
		<c:if test="${dto!=null }">
			
		</c:if>		
		<tr>
			<th>배송지 정보</th>
			<td><input type="radio" name="fruit" value="sameInfo" /> 구매자와 동일정보
				<input type="radio" name="fruit" value="newInfo" checked="checked" /> 새로 입력</td>
		</tr>
		<tr>
			<th>받는 이</th>
			<td><input type="text" name="addressee"></td>
		</tr>
		<tr>
			<th>전화번호</th>
			<td><input type="number" name="phone"></td>
		</tr>
		<tr>
			<th>주소</th>
			<td><input type="text" name="address"></td>
		</tr>
		
		<tr>
			<th>결제 방법</th>
			<td><input type="radio" name="pay" value="noBankbook" /> 무통장 입금
				<input type="radio" name="pay" value="cardPayment" checked="checked" /> 카드결제</td>
		</tr>
		<tr>
			<th>적립 포인트 및 쿠폰</th>
		</tr>
		
	</table>
	
	</form>
	<div class="cmd">
            <input type="submit" value="구매 확정">
            <input type="button" value="취소" onclick="history.back(-1);">
        </div>
</body>
</html>