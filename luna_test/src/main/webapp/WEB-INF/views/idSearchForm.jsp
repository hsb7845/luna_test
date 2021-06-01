<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
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
<meta charset="UTF-8">
<title>아이디 찾기</title>
<style type="text/css">
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
@font-face {
    font-family: 'Poppins-Medium';
/*     src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-10@1.0/BinggraeSamanco-Bold.woff') format('woff'); */
    font-weight: normal;
    font-style: normal;
}

body,button,input{font-family: 'Poppins-Medium';
 		font-weight: bold;
 		line-height: 30px;}
 		
 </style>

</head>

<body>
<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100" style="text-align:center;"><img src="upload/id_logo.png" style='width:150px; height:80px; vertical-align: middle;'>
				<form class="login100-form validate-form"  method="post"  action="idSearch.do" name="idSearch">
<!-- 				<form> -->
<!-- 					<span class="login100-form-title p-b-26"> -->
<!-- 						<form class="login100-form validate-form"> -->
<!-- 						<a href="index.do"> -->
<!-- 						<img src="upload/logo.png" style='width:150px; height:80px; vertical-align: middle';> -->
						
<!-- 						</a> -->
						
<!-- 					</span> -->
				
					<div class="wrap-input100 validate-input" data-validate = "Valid email is: a@b.c" style="text-align:left;">
						<input class="input100" type="text" name="email" >
						<span class="focus-input100" data-placeholder="Email"></span>
					</div>
					
<!-- 					<div class="wrap-input100 validate-input"> -->
<!-- 						<label for="email">이메일</label> -->
<!-- 						<input type="text" id="email" name="email" class="form-control" style="width:190px; height:20px; font-size:15px;"/> -->
<!-- 					</div> -->
					
					
					<div class="wrap-input100 validate-input" data-validate="Enter password">
<!-- 						<span class="btn-show-pass"> -->
<!-- 							<i class="zmdi zmdi-eye"></i> -->
<!-- 						</span> -->
						<input class="input100" type="text" name="name" >
						<span class="focus-input100" data-placeholder="Name" style="text-align:left;"></span>
					</div>
					
					
<!-- 					<div class="form-label-group"> -->
<!-- 					<label for="name">이 &nbsp;  름</label> -->
		
<!-- 			<input type="text" id="name" name="name" class="form-control" style="width:190px; height:20px; font-size:15px;"/> -->
<!-- 		</div> -->
					<c:if test="${check==1}">
						<label><font color="red">일치하는 정보가 존재하지 않습니다.</font></label>
					</c:if>
			
					<c:if test="${check==0}">
						<label><font color="blue">찾으시는 아이디는 '${id}' 입니다.</font></label>
					</c:if>

					<div class="container-login100-form-btn">
						<div class="wrap-login100-form-btn">
							<div class="login100-form-bgbtn"></div>
<!-- 							<button class="login100-form-btn"> -->
							<input class="login100-form-btn" type="submit" value="F i n d">
							
							
								
<!-- 							</button> -->
						</div>
					</div>

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
<!-- <form method="post" class="form-signin" action="idSearch.do" name="idSearch"> -->
<!-- 		<div> -->
<!-- 		아이디찾기<br> -->
<!-- 		</div> -->
<!-- 		<div class="form-label-group"> -->
<!-- 			<label for="email">이메일</label> -->
<!-- 			<input type="text" id="email" name="email" class="form-control" style="width:190px; height:20px; font-size:15px;"/> -->
<!-- 		</div> -->
		
<!-- 		<div class="form-label-group"> -->
<!-- 					<label for="name">이 &nbsp;  름</label> -->
		
<!-- 			<input type="text" id="name" name="name" class="form-control" style="width:190px; height:20px; font-size:15px;"/> -->
<!-- 		</div> -->

<!-- 		<div class="form-label-group"> -->
<!-- 			<input class="btn btn-lg btn-secondary btn-block text-uppercase" -->
<!-- 				type="submit"style="width:50 px; height:30px; font-size:17px;" value="찾기"> -->
<!-- 		</div> -->

<%-- 		<c:if test="${check==1}"> --%>
<!-- 			<label><font color="red">일치하는 정보가 존재하지 않습니다.</font></label> -->
<%-- 		</c:if> --%>

<%-- 		<c:if test="${check==0}"> --%>
<%-- 			<label><font color="blue">찾으시는 아이디는'${id}' 입니다.</font></label> --%>
<%-- 		</c:if> --%>

<!-- 	</form> -->
	
</body>
</html>