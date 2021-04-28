<%@page import="com.luna.board.dtos.CartDTO"%>
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
<title>장바구니 리스트 </title>
<style>
            .cls1 {
                font-size: 40px;
                text-align: center;
</style>

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
	})
	
</script>
</head>
<%
	List<CartDTO> list = (List<CartDTO>) request.getAttribute("list");
%>
<body>
<p class="cls1">장바구니리스트</p> 
<form action="muldelCart.do" method="post">
<table border="1">
	<col width="50px">
	<col width="50px">
	<col width="100px">
	<col width="50px">
	<col width="100px">
	<tr>
		<th><input type="checkbox" name="all"  onclick="allSel(this)"/></th>
		<th>장바구니번호</th>
		<th>아이디</th>
		<th>상품게시글번호</th>
		<th>상품수량</th>
	</tr>
	
	<%
		if(list==null||list.size()==0){
			out.print("<tr><td colspan='5'>----작성된 글이 없습니다.</td></tr>");
			} else {
		for(int i=0;i<list.size();i++){
			CartDTO dto=list.get(i);
	%>
		<tr>
					<td><input type="checkbox" name="chk" value="<%=dto.getSeq()%>"/></td>
					<td><%=dto.getSeq()%></td>
					<td><a href="cartUpdateForm.do?seq=<%=dto.getSeq()%>" ><%=dto.getId()%></a></td>
					<td><%=dto.getPseq()%></td>
					<td><%=dto.getPcount()%></td>
				</tr>
	<%
			}
		}
	%>
	<tr>
		<td colspan="5">
			<a href="cartInsertForm.do">글쓰기</a>
			<a href=".do">메인</a>
			<input type="submit" value="삭제" />
		</td>
	</tr>
</table>
	
</form>
</body>
</html>