<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
    font-family: 'BinggraeSamanco-Bold';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-10@1.0/BinggraeSamanco-Bold.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

body,button,input{font-family: 'BinggraeSamanco-Bold';
 		font-weight: bold;
 		line-height: 20px;}
 
 		
 </style>
<title>비밀번호찾기</title>

</head>
<body>
<form method="post" class="form-signin" action="pwdSearch.do" name="pwdSearch">
		<div>
		비밀번호찾기
		</div>
		<div class="form-label-group">
			<label for="id">아이디</label>
					<input type="text" id="id" name="id" class="form-control" style="width:190px; height:20px; font-size:15px;"/>
		</div>
		
		<div class="form-label-group">
			<label for="email">이메일</label>		
			<input type="text" id="email" name="email" class="form-control" style="width:190px; height:20px; font-size:15px;"/>
		</div>

		<div class="form-label-group">
			<input class="btn btn-lg btn-secondary btn-block text-uppercase"
				type="submit"style="width:50 px; height:30px; font-size:17px;" value="찾기">
		</div>

		<c:if test="${check==1}">
	
			<label><font color="red">일치하는 정보가 존재하지 않습니다.</font></label>
		</c:if>

		<c:if test="${check==0}">
		<label><font color="blue">가입하신이메일로임시비밀번호가전송되었습니다.</font></label> 
		</c:if>

	</form>
	
	<script type="text/javascript">
		function closethewindow(){
			self.close();
		}
	</script>
</body>
</html>