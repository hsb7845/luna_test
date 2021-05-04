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
<script type="text/javascript">
// core, BOM, DOM  3가지 영역으로 나눔
	function allSel(val){
		//val --> input객체--> Element객체 안에 구현 여러 속성들이 있음 그중에 tagName을 사용해봄
//		alert(val.tagName);
//		alert(val);
	// getElementById(), getElementsByTagName(), ...className ....등 
		var chks=document.getElementsByName("chk");//[chk,chk,chk...]
		for(var i=0;i<chks.length;i++){
			chks[i].checked=val.checked;
		}
//		val.parentNode.style.backgroundColor="red";
	}
	//form 태그에서 submit 이벤트가 발생하면 함수실행 
$(function(){
	$("form").submit(function(){
		var bool = true;
		var count=$(this).find("input[name=chk]:checked").length;
		if(count==0){
			alert('최소 하나이상 체크하세요!!!');
			bool= false;
		}else if(confirm("정말 삭제하시겠습니까?")==false){
			bool = false;
		}
		return bool
		
	});
	var chks = document.getElementsByName("chk");
 	for(var i=0;i<chks.length;i++){
 		chks[i].onclick =function(){//체크박스에서 클릭이벤트가 발생하면 함수를 실행해라
 			var checkdObjs = document.querySelectorAll("input[name=chk]:checked");
 			if(checkedObjs.length ==chks.length){
 				document.getElementsByName("all")[0].checked=true;
 			}else{
 				document.getElementsByName("all")[0].checked=false;
 			}
 		}
 	}
})</script>
<%
	List<MemberDTO> list= (List<MemberDTO>) request.getAttribute("list");
%>
<body>
<p class="cls1">회원목록</p>
	<form action="muldelmember.do" method="post">
	<table border = "1">
	<tr>
		<th><input type="checkbox" name="all"  onclick="allSel(this)"/></th>
		<th>아이디</th>
		<th>비밀번호</th>
		<th>이메일</th>
		<th>우편번호</th>
		<th>주소</th>
		<th>상세주소</th>
		<th>참고주소</th>
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
			<td><input type="checkbox" name="chk" value="<%=dto.getId()%>"></td>
			<td><a href="updatememberForm.do?id=<%=dto.getId()%>"><%=dto.getId()%></a>
			<td><%=dto.getPwd() %></td>
			<td><%=dto.getEmail()%></td>
			<td><%=dto.getAdr1()%></td>
			<td><%=dto.getAdr2()%></td>
			<td><%=dto.getAdr3()%></td>
			<td><%=dto.getAdr4()%></td>
			
			<td><fmt:formatDate value="<%=dto.getBirth()%>" pattern="yyyy년MM월dd일"/></td>			
			<td><%=dto.getSex()%></td>
			<td><%=dto.getPhone()%></td>
			<td><fmt:formatDate value="<%=dto.getJoindate()%>" pattern="yyyy년MM월dd일"/></td>
			<td><%=dto.getAdmin()%></td>
			<td><%=dto.getNickName()%></td>
			<td><%=dto.getName()%></td>
			<td><%=dto.getPoint()%></td>
		</tr>
			
	<%
			}
		}
	%>
	</table>
		
			<a href="insertmemberform.do">회원가입</a>
			<a href=".do">메인</a>
			<input type="submit" value="삭제" />
		
	
	
	</form>

</body>
</html>