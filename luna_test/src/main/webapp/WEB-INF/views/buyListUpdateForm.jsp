<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>구매목록 수정</h1>
	<form method="post" action="buyListUpdate.do">
	<table>
		<tr>
			<th>아이디</th>
			<td><input type="text" name="id" value="${dto.id }"></td>
		</tr>
		<tr>
			<th>운송장번호</th>
			<td><input type="text" name="trackingNum" value="${dto.trackingNum }"></td>
		</tr>
		<tr>
			<th>배송현황</th>
			<td><input type="text" name="delStatus" value=${dto.delStatus }></td>
		</tr>
		<tr>
			<th>받는이</th>
			<td><input type="text" name="name" value=${dto.name }></td>
		</tr>
		<tr>
			<th>주소</th>
			<td><input type="text" name="address" value=${dto.address }></td>
		</tr>
		<tr>
			<th>전화번호</th>
			<td><input type="text" name="phone" value="${dto.phone }"></td>
		</tr>
		<tr>
			<th>총금액</th>
			<td><input type="text" name="totalPrice" value=${dto.totalPrice }></td>
		</tr>

		<tr>
			<td colspan="2"><input type="submit" value="수정"></td>
		</tr>
	</table>
	</form>
</body>
</html>