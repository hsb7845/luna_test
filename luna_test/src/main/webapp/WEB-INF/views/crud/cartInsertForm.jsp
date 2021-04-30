<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니 추가하기 </title>
</head>
<body>
<form method="post" action="insertCart.do">
<table>
		<tr>
			<th>상품수량</th>
			<td><input type="number" name="pcount"></td>
		</tr>
		<tr>
			<td><input type="submit" value="추가"></td>
		</tr>
</table>
</form>
</body>
</html>