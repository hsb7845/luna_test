<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">


@font-face {
    font-family: 'GyeonggiBatang';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/GyeonggiBatang.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

body,button,input{font-family: "GyeonggiBatang";
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