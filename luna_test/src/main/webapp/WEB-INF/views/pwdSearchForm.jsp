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
			<script>
				opener.document.pwdSearch.id.value="";
				opener.document.pwdSearch.email.value="";
			</script>
			<label>일치하는 정보가 존재하지 않습니다.</label>
		</c:if>

		<c:if test="${check==0}">
		<label>찾으시는 아이디는'${pwd}' 입니다.</label>
		<div class="form-label-group">
				<input class="btn btn-lg btn-secondary btn-block text-uppercase"
					type="button" value="OK" onclick="closethewindow()">
			</div>
		</c:if>

	</form>
	
	<script type="text/javascript">
		function closethewindow(){
			self.close();
		}
	</script>
</body>
</html>