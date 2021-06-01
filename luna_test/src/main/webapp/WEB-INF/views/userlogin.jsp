<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<title>Login V2</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="resources/boot_login/images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="resources/boot_login/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="resources/boot_login/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="resources/boot_login/fonts/iconic/css/material-design-iconic-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="resources/boot_login/vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="resources/boot_login/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="resources/boot_login/vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="resources/boot_login/vendor/select2/select2.min.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="resources/boot_login/vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="resources/boot_login/css/util.css">
	<link rel="stylesheet" type="text/css" href="resources/boot_login/css/main.css">
<!--===============================================================================================-->

<head>
<script src="<c:url value='resources/js/jquery-3.6.0.min.js'/>"></script>
<style type="text/css">


@font-face {
    font-family: 'Poppins-Medium';
/*     src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-10@1.0/BinggraeSamanco-Bold.woff') format('woff'); */
    font-weight: normal;
    font-style: normal;
}
body,input{font-family: 'Poppins-Medium';
 		font-weight: bold;
 		 line-height: 30px;}
 	
div#loginPage{
 	text-align: center;  		
}
 button {
   color:#666666;
   font-family:inherit;
   font-size:14px;
   line-height:1.8;
   word-wrap:break-word;
   -webkit-hyphens:auto;
    -moz-hyphens:auto;
    -ms-hyphens:auto;
         hyphens:auto;
         
         font-size:100%;
   /* Corrects font size not being inherited in all browsers */
   margin:0;
   /* Addresses margins set differently in IE6/7,F3/4,S5,Chrome */
   vertical-align:baseline;
   /* Improves appearance and consistency in all browsers */
}
button,input[type="button"],input[type="reset"],input[type="submit"] {
   border:1px solid #ccc;
   border-radius:0px;
   background:#ccc;
   color:#fff;
   cursor:pointer;
   /* Improves usability and consistency of cursor style between image-type 'input' and others */
   -webkit-appearance:button;
   /* Corrects inability to style clickable 'input' types in iOS */
   padding:3px 15px;
}
button:hover,input[type="button"]:hover,input[type="reset"]:hover,input[type="submit"]:hover {
   opacity:0.6;
}
</style>

<meta charset="UTF-8">
<title>Luna 로그인페이지</title>
<script>
$(document).ready(function(){
	$("input[name='id']").click(function(){
		$("#idplaceholder").attr("data-placeholder","");
	})
	$("input[name='pwd']").click(function(){
		$("#pwdplaceholder").attr("data-placeholder","");
	})
	
})

</script>
</head>

	<script src="js/main.js"></script>
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
<!-- 		<h3>Login Luna</h3> -->
<!-- 			<div> -->
<!-- 				<input type="text" name="id" placeholder="아이디를입력해주세요" style="width:190px; height:35px; font-size:18px;" ><br> -->
<!-- 			</div> -->
<!-- 			<div>	 -->
<!-- 				<input type="password" name="pwd" placeholder="비밀번호를입력해주세요" style="width:190px; height:35px;font-size:18px;"><br> -->
<!-- 			</div> -->
<!-- 			<div> -->
<!-- 				<input type="submit" value ="로그인" style="width:198px; height:35px; font-size:18px;"> -->
<!-- 			</div> -->
		
<%-- 		<c:if test="${msg == 'loginfail'}"> --%>
<!-- 			<p><font color="red">아이디 또는 비밀번호가 일치하지 않습니다</font></p> -->
<%-- 		</c:if> --%>

	
<!-- 			<a href="insertmemberform.do">회원가입</a>	 -->
<!-- 			<a href="idSearchForm.do">아이디 찾기</a> -->
<!-- 			<a href="pwdSearchForm.do">비밀번호찾기</a><br> -->
<!-- 			<a href="https://kauth.kakao.com/oauth/authorize?client_id=818ca9a80599f4fc6a4c915c35fbe0fb&redirect_uri=http://localhost:8888/board/callback&response_type=code">  -->
<!--  			<img src="upload/kakao_login_long.png"></a>	<br>  -->
<!-- 			<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script> -->
			
		</div>
	
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100">	
					
					<span class="login100-form-title p-b-26">
						<form class="login100-form validate-form">
						<a href="index.do">
						<img src="upload/logo.png" style='width:150px; height:80px; vertical-align: middle';>
						</a>
					</span>
<!-- 					<span class="login100-form-title p-b-48"> -->
<!-- 						<i class="zmdi zmdi-font"></i> -->
<!-- 					</span> -->
				
				
					<div class="wrap-input100 validate-input" >
					<span class="focus-input100" id="idplaceholder" data-placeholder="ID">
					</span><input type="text" name="id"  style="width:190px; height:35px; font-size:18px;"  >
						
						
					</div>

					<div class="wrap-input100 validate-input" data-validate="Enter password">
						<span class="btn-show-pass">
							<i class="zmdi zmdi-eye"></i>
						</span>
						
						<span class="focus-input100" id="pwdplaceholder" data-placeholder="Password"></span>
						<input type="password" name="pwd" style="width:190px; height:35px;font-size:18px;">
					</div>
					<c:if test="${msg == 'loginfail'}">
			<p><font color="red">아이디 또는 비밀번호가 일치하지 않습니다</font></p>
		</c:if>

					<div class="container-login100-form-btn">
						<div class="wrap-login100-form-btn">
							<div class="login100-form-bgbtn"></div>
							<button class="login100-form-btn">
							<input type="submit" value ="로그인" style="width:198px; height:35px; font-size:18px;">
							</button>
							
						</div>
					</div><br>
<a href="insertmemberform.do">회원가입&nbsp;&nbsp;&nbsp;</a>&nbsp;&nbsp;&nbsp;
			<a href="idSearchForm.do">아이디 찾기&nbsp;&nbsp;</a>&nbsp;&nbsp;&nbsp;
			<a href="pwdSearchForm.do">비밀번호 찾기</a><br>
			<br><br>
			<a href="https://kauth.kakao.com/oauth/authorize?client_id=818ca9a80599f4fc6a4c915c35fbe0fb&redirect_uri=http://localhost:8888/board/callback&response_type=code"> 
 			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="upload/kakao_login_long.png" style='vertical-align:middle;'></a>	<br> 
			<script src="//developers.kakao.com/sdk/js/kakao.min.js" ></script>
<!-- 					<div class="text-center p-t-115"> -->
<!-- 						<span class="txt1"> -->
<!-- 							Don’t have an account? -->
<!-- 						</span> -->

<!-- 						<a class="txt2" href="#"> -->
<!-- 							Sign Up -->
<!-- 						</a> -->
<!-- 					</div> -->
				</form>
			</div>
		</div>
	</div>
	

	<div id="dropDownSelect1"></div>
	
<!--===============================================================================================-->
	<script src="resources/boot_login/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="resources/boot_login/vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="resources/boot_login/vendor/bootstrap/js/popper.js"></script>
	<script src="resources/boot_login/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="resources/boot_login/vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="resources/boot_login/vendor/daterangepicker/moment.min.js"></script>
	<script src="resources/boot_login/vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
	<script src="resources/boot_login/vendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
	<script src="resources/boot_login/js/main.js"></script>



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
<!-- 		<h3>Login Luna</h3> -->
<!-- 			<div> -->
<!-- 				<input type="text" name="id" placeholder="아이디를입력해주세요" style="width:190px; height:35px; font-size:18px;" ><br> -->
<!-- 			</div> -->
<!-- 			<div>	 -->
<!-- 				<input type="password" name="pwd" placeholder="비밀번호를입력해주세요" style="width:190px; height:35px;font-size:18px;"><br> -->
<!-- 			</div> -->
<!-- 			<div> -->
<!-- 				<input type="submit" value ="로그인" style="width:198px; height:35px; font-size:18px;"> -->
<!-- 			</div> -->
		
	
<!-- 			<a href="insertmemberform.do">회원가입</a>	 -->
<!-- 			<a href="idSearchForm.do">아이디 찾기</a> -->
<!-- 			<a href="pwdSearchForm.do">비밀번호찾기</a><br> -->
<!-- 			<a href="https://kauth.kakao.com/oauth/authorize?client_id=818ca9a80599f4fc6a4c915c35fbe0fb&redirect_uri=http://localhost:8888/board/callback&response_type=code">  -->
<!--  			<img src="upload/kakao_login_long.png"></a>	<br>  -->
<!-- 			<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script> -->
			
		</div>
	</form>
</body>

</html>
