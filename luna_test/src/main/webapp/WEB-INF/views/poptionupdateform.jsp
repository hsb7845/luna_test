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
	<form method="post" action="updatepoption.do">
	<input type="hidden" name="oseq" value="${dto.oseq}">
	<table>

	<tr>
			<th>옵션제목</th>
			<td><input type="text" name="otitle" value="${dto.otitle }"></td>
		</tr>
		<tr>
			<th>옵션내용</th>
			<td><textarea name="ocontent">${dto.ocontent }</textarea></td>
		</tr>
		<tr>
			<td colspan="2"><input type="submit" value="수정"></td>
		</tr>
	</table>
	</form>
</body>
</html>