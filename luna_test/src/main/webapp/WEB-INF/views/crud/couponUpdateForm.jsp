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
<title>쿠폰함 수정</title>
</head>
<body>
<form method="post" action="updateCoupon.do">
<input type="hidden" name="cseq" value="${dto.cseq}">
<table>	
	<tr>
		<th>쿠폰내용</th>
		<td><input type="text" name="ccontent" value="${dto.ccontent }" ></td>
	</tr>
	<tr>
		<th>할인금액</th>
		<td><input type="number" name="discount" value="${dto.discount }" ></td>
	</tr>
	<tr>
		<td colspan="2"><input type="submit" value="수정"></td>
	</tr>
</table>	
</form>
</body>
</html>