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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript"></script>
<%
	List<MemberDTO> list= (List<MemberDTO>) request.getAttribute("list");
%>
<body>
<p class="cls1">회원목록</p>
	<form action="muldel.do" method="post">
	<table border = "1">
	<tr>
		<th>아이디</th>
		<th>비밀번호</th>
		<th>이메일</th>
		<th>이메일확인</th>
		<th>주소</th>
		<th>생년월일</th>
		<th>성별</th>
		<th>핸드폰</th>
		<th>가입일</th>
		<th>관리자</th>
		<th>닉네임</th>
		<th>이름</th>
		<th>포인트</th>
	</tr>
	<%
		if(list==null||list.size()==0){
			out.print("<tr><td colspan='13'>----가입된 회원이 없습니다.</td></tr>");
			}else{
		for(int i=0;i<list.size();i++){
			MemberDTO dto=list.get(i);
	%>
		<tr>
			<td><%=dto.getId()%></td>
			<td><%=dto.getPwd() %></td>
			<td><%=dto.getEmail()%></td>
			<td><%=dto.getEmail_chk()%></td>
			<td><%=dto.getAddress()%></td>
			<td><%=dto.getBirth()%></td>
			<td><%=dto.getSex()%></td>
			<td><%=dto.getPhone()%></td>
			<td><%=dto.getJoindate()%></td>
			<td><%=dto.getAdmin()%></td>
			<td><%=dto.getNickName()%></td>
			<td><%=dto.getName()%></td>
			<td><%=dto.getPoint()%></td>
			
	<%
			}
		}
	%>
		<tr>
		<td colspan="5">
			<a href="insertpboardform.do">회원가입</a>
			<a href="index">메인</a>
			<input type="submit" value="삭제" />
		</td>
	</tr>
	</table>
	
	
	</form>

</body>
</html>