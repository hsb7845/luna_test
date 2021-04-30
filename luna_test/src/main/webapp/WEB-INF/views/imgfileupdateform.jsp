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
	<form method="post" action="imgfile.do">
	<input type="hidden" name="imgnum" value="${dto.imgnum}">
	<table>
		<tr>
			<th>파일 사이즈</th>
			<td><input type="text" name="filesize" value="${dto.filesize }"></td>
		</tr>
		<tr>
			<th>실제 이름</th>
			<td><input type="text" name="imgname" value="${dto.imgname }"></td>
		</tr>
		<tr>
			<td colspan="2"><input type="submit" value="작성"></td>
		</tr>
	</table>
	</form>
</body>
</html>