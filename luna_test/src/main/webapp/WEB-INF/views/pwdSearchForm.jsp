<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호찾기</title>
</head>
<body>
	<form action ="/pwdSearch.do" method="post">
		<div>비밀번호찾기</div>
		<div>
			<p>
				<label>아이디</label>
				<input type="text" id="id" name="id" required>
				<label>이메일</label>
				<input type="text" id="email" name="email" required>
			</p>
			<p>
				<input type="submit" value="비밀번호찾기"/>
			</p>
		</div>
	
	</form>
</body>
</html>