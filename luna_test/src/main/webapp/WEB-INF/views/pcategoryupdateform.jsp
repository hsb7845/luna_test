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
<title>Insert title here</title>
</head>
<body>
	<form method="post" action="updatpcategory.do">
	<input type="hidden" name="cnum" value="${dto.cnum}">
	<table>
		
		<tr>
			<th>형태</th>
			<td><input type="text" name="ptype" value="${dto.ptype }"></td>
		</tr>
		<tr>
			<th>색상</th>
			<td><input type="text" name="pcolor" value="${dto.pcolor }"></td>
		</tr>
		<tr>
			<th>사이즈</th>
			<td><input type="text" name="psize" value="${dto.psize }"></td>
		</tr>
		<tr>
			<td colspan="3"><input type="submit" value="작성"></td>
		</tr>
	</table>
	</form>
</body>
</html>