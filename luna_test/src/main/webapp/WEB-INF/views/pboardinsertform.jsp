<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form method="post" action="insertpboard.do">
	<table>
		<tr>
			<th>제목</th>
			<td><input type="text" name="ptitle"></td>
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea name="pcontent"></textarea></td>
		</tr>
		<tr>
			<td colspan="2"><input type="submit" value="작성"></td>
		</tr>
	</table>
	</form>
</body>
</html>