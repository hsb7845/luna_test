<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<head>
    <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

<meta charset="UTF-8">
<title>Luna 로그인페이지</title>
</head>
<body>
	<form action="login.do" method="post">
		<div>	
		아이디 :
			<input type="text" name="id" >
		</div>
			<div>	
		비밀번호 :
			<input type="password" name="pwd" >
		</div>
			<input type="submit" value ="로그인">
			<br>
	<c:if test="${msg == 'loginfail'}">
		<p>아이디 또는 비밀번호가일치하지  않습니다.</p>
	</c:if>

	</form>
	 	<a href="https://kauth.kakao.com/oauth/authorize?client_id=818ca9a80599f4fc6a4c915c35fbe0fb&redirect_uri=http://localhost:8888/board/callback&response_type=code"> 
 	<img src="upload/kakao_login_button.png"/></a>	<br> 
			<a href="idSearchForm.do">아이디 찾기</a>
			<a href="pwdSearchForm.do">비밀번호찾기</a>
			<a href="insertmemberform.do">회원가입</a>
			
</body>

</html>
