<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 추가하기</title>
</head>
<body>
<form method="post" action="insertStock.do">
	<table>		
		<tr>
			<th>상품명</th>
			<td><input type="text" name="pname"></td>
		</tr>
		<tr>
			<th>상품입고수량</th>
			<td><input type="text" name="scount"></td>
		</tr>
		<tr>
			<th>원가</th>
			<td><input type="text" name="cost"></td>
		</tr>
		
		<tr>
			<th>상품내용</th>
			<td><input type="text" name="pcontent"></td>
		</tr>
		<tr>
			<th>판매가</th>
			<td><input type="text" name="price"></td>
		</tr>
		
		<tr>
			<td colspan="6"><input type="submit" value="추가"></td>
		</tr>
	</table>
</form>	
</body>
</html>