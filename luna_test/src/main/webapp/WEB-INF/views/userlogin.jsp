<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		<div>
			<input type="submit" value ="로그인">
		</div>	
	<a href="https://kauth.kakao.com/oauth/authorize?client_id=818ca9a80599f4fc6a4c915c35fbe0fb&redirect_uri=http://localhost:8090/board/login&response_type=code">
	<img src="/img/kakao_login_button.png/"></a>	
		</form>
	
<!-- 	ab54d1ad1cd70cb63090cec8ac6d1fb0 -->
		


<!--     <a id="kakao-login-btn"></a> -->
<!--     <a href="http://developers.kakao.com/logout">Logout</a> -->
<!--     <script type='text/javascript'> -->
         <![CDATA[
//         // 사용할 앱의 JavaScript 키를 설정해 주세요.
//         Kakao.init('ab54d1ad1cd70cb63090cec8ac6d1fb0');
//         // 카카오 로그인 버튼을 생성합니다.
//         Kakao.Auth.createLoginButton({
//             container: '#kakao-login-btn',
//             success: function (authObj) {
//                 alert(JSON.stringify(authObj));
//                 console.log(JSON.stringify(authObj));
//             },
//             fail: function (err) {
//                 alert(JSON.stringify(err));
//             }
//         });
//       //]]>
<!--     </script> -->
</body>
</html>
