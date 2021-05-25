<%@page import="com.luna.board.dtos.MemberDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- tag라이브러리 : tag모음.. JAVA코드를 치환하는 역할. -->
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" /> 
<meta http-equiv="X-UA-Compatible" content="ie=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>

<link rel='stylesheet' href='resources/luna/css/woocommerce-layout.css' type='text/css' media='all'/>
<link rel='stylesheet' href='resources/luna/css/woocommerce-smallscreen.css' type='text/css' media='only screen and (max-width: 768px)'/>
<link rel='stylesheet' href='resources/luna/css/woocommerce.css' type='text/css' media='all'/>
<link rel='stylesheet' href='resources/luna/css/font-awesome.min.css' type='text/css' media='all'/>
<link rel='stylesheet' href='resources/luna/style.css' type='text/css' media='all'/>
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Oswald:400,500,700%7CRoboto:400,500,700%7CHerr+Von+Muellerhoff:400,500,700%7CQuattrocento+Sans:400,500,700' type='text/css' media='all'/>
<link rel='stylesheet' href='resources/luna/css/easy-responsive-shortcodes.css' type='text/css' media='all'/>

<style type="text/css">
 .cls1 {
	font-size: 40px;
	text-align: center;
}
#m1{
	text-align: center;
}
#m2{
	text-align: center;
}
	@font-face {
	    font-family: 'Gyeonggi_Tittle_OTF_FontInstaller';
	    font-weight: normal;
	    font-style: normal;
	}
	
	body,button,input{
		font-family: 'Gyeonggi_Tittle_OTF_FontInstaller';
		font-weight: bold;
	}
 		
 </style>
</head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<%
	List<MemberDTO> list= (List<MemberDTO>) request.getAttribute("list");
%>
<body>
<p class="cls1">회 원 목 록</p>
	<form action="muldelmember.do" method="post">
	<table border = "1" >
	<tr>
		<th id="m1"><input type="checkbox" name="all"  onclick="allSel(this)"/></th>
		<th id="m1">아이디</th>
		<th id="m1">비밀번호</th>
		<th id="m1">이메일</th>
		<th id="m1">우편번호</th>
		<th id="m1">주소</th>
		<th id="m1">상세주소</th>
		<th id="m1">참고주소</th>
		<th id="m1">생년월일</th>
		<th id="m1">성별</th>
		<th id="m1">핸드폰</th>
		<th id="m1">가입일</th>
		<th id="m1">관리자</th>
		<th id="m1">닉네임</th>
		<th id="m1">이름</th>
		<th id="m1">포인트</th>
	</tr>
	<%
		if(list==null||list.size()==0){
			out.print("<tr><td colspan='13'>----가입된 회원이 없습니다.</td></tr>");
			}else{
		for(int i=0;i<list.size();i++){
			MemberDTO dto=list.get(i);
	%>
	
		<tr>
			<td id="m2"><input type="checkbox" name="chk" value="<%=dto.getId()%>"></td>
			<td id="m2"><a href="updatememberForm.do?id=<%=dto.getId()%>"><%=dto.getId()%></a></td>	
			<td id="m2"><%=dto.getPwd() %></td>
			<td id="m2"><%=dto.getEmail()%></td>
			<td id="m2"><%=dto.getAdr1()%></td>
			<td id="m2"><%=dto.getAdr2()%></td>
			<td id="m2"><%=dto.getAdr3()%></td>
			<td id="m2"><%=dto.getAdr4()%></td>
			
			<td id="m2"><fmt:formatDate value="<%=dto.getBirth()%>" pattern="yyyy년MM월dd일"/></td>			
			<td id="m2"><%=dto.getSex()%></td>
			<td id="m2"><%=dto.getPhone()%></td>
			<td id="m2"><fmt:formatDate value="<%=dto.getJoindate()%>" pattern="yyyy년MM월dd일"/></td>
			<td id="m2"><%=dto.getAdmin()%></td>
			<td id="m2"><%=dto.getNickName()%></td>
			<td id="m2"><%=dto.getName()%></td>
			<td id="m2"><%=dto.getPoint()%></td>
		</tr>
			
	<%
			}
		}
	%>
	</table>
<!-- 			<input type="button" value="회원가입" id="insertmemberform"> -->
			<a href="insertmemberform.do">회원가입</a>
			<a href=".do">메인</a>
			<input type="submit" value="삭제" />
	
	</form>
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

</body>
</html>