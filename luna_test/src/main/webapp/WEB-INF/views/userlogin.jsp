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
 		  		

</style>

<meta charset="UTF-8">
<title>Luna 로그인페이지</title>
</head>
<body>
	<form action="login.do" method="post">
		<h3>로그인</h3>
		<div>
			<input type="text" name="id" placeholder="아이디입력" style="width:190px; height:20px; font-size:15px;" ><br>
		</div>
		<div>	
			<input type="password" name="pwd" placeholder="비밀번호입력" style="width:190px; height:20px;font-size:15px;"><br>
		</div>
		<div>
			<input type="submit" value ="로그인" style="width:198px; height:30px; font-size:17px;">
		</div>
		
	<c:if test="${msg == 'loginfail'}">
		<p><font color="red">아이디 또는 비밀번호가 일치하지 않습니다</font></p>
	</c:if>

	</form>

			<a href="idSearchForm.do">아이디 찾기</a>
			<a href="pwdSearchForm.do">비밀번호찾기</a><br>
					 	<a href="https://kauth.kakao.com/oauth/authorize?client_id=818ca9a80599f4fc6a4c915c35fbe0fb&redirect_uri=http://localhost:8888/board/callback&response_type=code"> 
 	<img src="upload/kakao_login.png"></a>	<br> 
			<a href="insertmemberform.do">회원가입</a>	
			    <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
			
</body>

</html>
