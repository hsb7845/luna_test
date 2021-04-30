<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>구매 추가</h1>
	<form method="post" action="buyDetailInsert.do">
	<table>
		<tr>
			<th>상품번호</th>
			<td><input type="text" name="pnum"></td>
		</tr>
		<tr>
			<th>수량</th>
			<td><input type="text" name="pcount"></td>
		</tr>
		<tr>
			<th>구매번호</th>
			<td><input type="text" name="bseq"></td>
		</tr>

		<tr>
			<td colspan="2"><input type="submit" value="작성"></td>
		</tr>
	</table>
	</form>
</body>
</html>