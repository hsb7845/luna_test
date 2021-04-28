<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품재고 수정하기</title>
</head>
<body>
<form method="post" action="updateStock.do">
<input type="hidden" name="pnum" value="${dto.pnum}">
	<table>
		<tr>
			<th>상품번호</th>
			<td><input type="number" name="pnum" value="${dto.pnum }" readonly="readonly"></td>
		</tr>
		<tr>
			<th>상품명</th>
			<td><input type="text" name="pname" value="${dto.pname }"></td>
		</tr>
		<tr>
			<th>상품재고수량</th>
			<td><input type="number" name="scount" value="${dto.scount }"></td>
		</tr>
		<tr>
			<th>원가</th>
			<td><input type="number" name="cost" value="${dto.cost }" ></td>
		</tr>
		<tr>
			<th>내용</th>
			<td><input type="text" name="pcontent" value="${dto.pcontent }" ></td>
		</tr>
		<tr>
			<th>판매가</th>
			<td><input type="number" name="price" value="${dto.price }" ></td>
		</tr>
		<tr>
			<td colspan="6"><input type="submit" value="수정"></td>
		</tr>
	</table>
</form>	
</body>
</html>