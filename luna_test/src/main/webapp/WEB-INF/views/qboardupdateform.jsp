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
	<form method="post" action="updateqboard.do">
	<input type="hidden" name="qseq" value="${dto.qseq}">
	<table>
		
		<tr>
			<th>제목</th>
			<td><input type="text" name="qtitle" value="${dto.qtitle }"></td>
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea name="qcontent">${dto.qcontent }</textarea></td>
		</tr>
		<tr>
			<td colspan="2"><input type="submit" value="수정"></td>
		</tr>
	</table>
	</form>
</body>
</html>