<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호찾기</title>
</head>
<body>
<form method="post" class="form-signin" action="pwdSearch.do" name="pwdSearch">
		<div>
		비밀번호찾기
		</div>
		<div class="form-label-group">
			<label for="id">아이디</label>
					<input type="text" id="id" name="id" class="form-control"/>
		</div>
		
		<div class="form-label-group">
			<label for="email">이메일</label>		
			<input type="text" id="email" name="email" class="form-control"/>
		</div>

		<div class="form-label-group">
			<input class="btn btn-lg btn-secondary btn-block text-uppercase"
				type="submit" value="check">
		</div>

		<c:if test="${check==1}">
	
			<label>일치하는 정보가 존재하지 않습니다.</label>
		</c:if>

		<c:if test="${check==0}">
		<label>가입하신이메일로임시비밀번호가전송되었습니다</label> 
		실행을하라는 명령이없는듯=? how?
<!-- 비밀번호가 pwd일떄 -> pwdUpdate 쿼리가 실행되어- 랜덤 비밀번호 생성-설정된 비밀번호 변경-> 변경된 임시번호 이메일로 전송 -> 변경된 비밀번호로 로그인 후 -> 비밀번호 원하는 거로 변경 -->
		</c:if>

	</form>
	
	<script type="text/javascript">
		function closethewindow(){
			self.close();
		}
	</script>
</body>
</html>