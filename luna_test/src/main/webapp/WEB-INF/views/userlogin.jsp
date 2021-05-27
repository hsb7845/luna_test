<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>


<head>
<style type="text/css">


@font-face {
    font-family: 'BinggraeSamanco-Bold';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-10@1.0/BinggraeSamanco-Bold.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
body,input{font-family: 'BinggraeSamanco-Bold';
 		font-weight: bold;
 		 line-height: 30px;}
 	
div#loginPage{
 	text-align: center;  		
}
</style>

<meta charset="UTF-8">
<title>Luna 로그인페이지</title>
</head>
<body>
	<form action="login.do" method="post">
	<c:if test="${returnUrl!=null }" >
		<c:choose>
			<c:when test="${returnUrl=='buyform' }">
				<input type="hidden" name="returnUrl" value="${returnUrl }">
				<input type="hidden" name="pseq" value="${pseq }">
				<input type="hidden" name="selOpt" value='${selOpt }'>
				<input type="hidden" name="selOptNum" value='${selOptNum }'>
			</c:when>
			<c:when test="${returnUrl=='pboard' }">
				<input type="hidden" name="returnUrl" value="${returnUrl }">
				<input type="hidden" name="pseq" value="${pseq }">
			</c:when>
		</c:choose>
	</c:if>
	<div id = "loginPage">
		<h3>Login Luna</h3>
			<div>
				<input type="text" name="id" placeholder="아이디를입력해주세요" style="width:190px; height:35px; font-size:18px;" ><br>
			</div>
			<div>	
				<input type="password" name="pwd" placeholder="비밀번호를입력해주세요" style="width:190px; height:35px;font-size:18px;"><br>
			</div>
			<div>
				<input type="submit" value ="로그인" style="width:198px; height:35px; font-size:18px;">
			</div>
		
		<c:if test="${msg == 'loginfail'}">
			<p><font color="red">아이디 또는 비밀번호가 일치하지 않습니다</font></p>
		</c:if>

	
			<a href="insertmemberform.do">회원가입</a>	
			<a href="idSearchForm.do">아이디 찾기</a>
			<a href="pwdSearchForm.do">비밀번호찾기</a><br>
			<a href="https://kauth.kakao.com/oauth/authorize?client_id=818ca9a80599f4fc6a4c915c35fbe0fb&redirect_uri=http://localhost:8888/board/callback&response_type=code"> 
 			<img src="upload/kakao_login_long.png"></a>	<br> 
			<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
			
		</div>
	</form>
</body>

</html>
