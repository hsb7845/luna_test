<%@page import="com.luna.board.dtos.MemberDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form method="post" action="updatemember.do">
		<h1 style = "text-align:left">회원정보수정</h1>
		아이디 <input type="text" name="id" value="${dto.id}" readonly><br>
		비밀번호 <input type="password" name="pwd"  value="${dto.pwd}"><br>
		이메일 <input type="text" name="email"  value="${dto.email}"><br>
		이메일확인(중복확인) <input type="text" name="email_chk"  value="${dto.email_chk}"><br>
		주소(API예정)	<input type="text" name="address"  value="${dto.address}"><br>
		생년월일 <input type="date" name="birthtest" value="<fmt:formatDate value="${dto.birth }" pattern="yyyy-MM-dd"/>"><br>
		성별  <input type="text" name="sex"  value="${dto.sex}" readonly><br>
		핸드폰 <input type="text" name="phone"  value="${dto.phone}"><br>
<!-- <- 		가입일 <input type="Date" name="joindate"><br>  - -->
	<%--   		관리자 <input type="hidden" name="admin"  value="${dto.admin}" readonly><br>   --%>
		닉네임 <input type="text" name="nickName"  value="${dto.nickName}"><br>
		이름	<input type="text" name="name"  value="${dto.name}" readonly><br>
		포인트 <input type="text" name="point"  value="${dto.point}" readonly><br>
		<input type="submit" value="등록">
		<input type="reset" value="다시입력">
	
	
	
	
	
	
	
	
	
	
	
	</form>
</body>
</html>