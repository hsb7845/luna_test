<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디찾기</title>
</head>
<body>
	<form action ="/idSearch.do" method="post">
		<div>아이디찾기</div>
		<div>
			<p>
				<label>이메일</label>
				<input type="text" id="email" name="email" required>
				<label>이름</label>
				<input type="text" id="name" name="name" required>
			</p>
			<p>
				<input type="submit" value="아이디찾기"/>
			</p>
		</div>
	
	</form>
</body>
</html>