<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠폰함 추가</title>
</head>
<body>
<form method="post" action="insertCoupon.do">
<table>
	<tr>
		<th>쿠폰번호</th>
		<td><input type="number" name="cseq" ></td>
	</tr>
	<tr>
		<th>쿠폰내용</th>
		<td><input type="text" name="ccontent"></td>
	</tr>
	<tr>
		<th>할인금액</th>
		<td><input type="number" name="discount"></td>
	</tr>
	<tr>
		<td><input type="submit" value="추가"></td>
	</tr>
</table>
</form>
</body>
</html>