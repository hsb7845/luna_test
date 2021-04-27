<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form method="post" action="insertmember.do">
		<h1 style = "text-align:left">회원가입</h1>
		아이디 <input type="text" name="id"><br>
		비밀번호 <input type="password" name="pwd"><br>
		이메일 <input type="text" name="email"><br>
		이메일확인(중복확인) <input type="text" name="email_chk"><br>
		주소(API예정)	<input type="text" name="address"><br>
		생년월일 <input type="date" name="birthtest"><br>
		성별(남,여 체크 예정) <input type="text" name="sex"><br>
		핸드폰 <input type="text" name="phone"><br>
<!-- <- 		가입일 <input type="Date" name="joindate"><br>  - -->
  		관리자 <input type="text" name="admin"><br>  
		닉네임 <input type="text" name="nickName"><br>
		이름	<input type="text" name="name"><br>
		포인트 <input type="text" name="point"><br>
		<input type="submit" value="등록">
		<input type="reset" value="다시입력">
	</form>

</body>
</html>