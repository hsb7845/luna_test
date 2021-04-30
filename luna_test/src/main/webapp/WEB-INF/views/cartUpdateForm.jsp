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
<title>장바구니 수정하기</title>
</head>
<body>
<form method="post" action="updateCart.do">
<input type="hidden" name="seq" value="${dto.seq}">
	<table>
		<tr>
			<th>장바구니번호</th>
			<td><input type="number" name="seq" value="${dto.seq }" readonly="readonly"></td>
		</tr>	
		<tr>
			<th>상품수량</th>
			<td><input type="number" name="pcount" value="${dto.pcount }" ></td>
		</tr>
		<tr>
			<td colspan="2"><input type="submit" value="수정"></td>
		</tr>
	</table>	
</form>
</body>
</html>