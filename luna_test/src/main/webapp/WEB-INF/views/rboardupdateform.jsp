<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form method="post" action="updaterboard.do">
	<input type="hidden" name="rseq" value="${dto.rseq}">
	<table>
		
		<tr>
			<th>제목</th>
			<td><input type="text" name="rtitle" value="${dto.rtitle }"></td>
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea name="rcontent">${dto.rcontent}</textarea></td>
		</tr>
		<tr>
			<th>별점</th>
			<td><input type="number" name="starrank" value="${dto.starrank}"></td>
		</tr>
		<tr>
			<td colspan="3"><input type="submit" value="수정"></td>
		</tr>
	</table>
	</form>
</body>
</html>