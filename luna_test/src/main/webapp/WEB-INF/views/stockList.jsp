<%@page import="com.luna.board.dtos.StockDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상품재고리스트</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	// core, BOM, DOM  3가지 영역으로 나눔
 	function allSel(val){
 		//val --> input객체--> Element객체 안에 구현 여러 속성들이 있음 그중에 tagName을 사용해봄
//  		alert(val.tagName);
//  		alert(val);
		// getElementById(), getElementsByTagName(), ...className ....등 
 		var chks=document.getElementsByName("chk");//[chk,chk,chk...]
 		for(var i=0;i<chks.length;i++){
 			chks[i].checked=val.checked;
 		}
//  		val.parentNode.style.backgroundColor="red";
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

	
</script>
</head>
<%
	List<StockDTO> list= (List<StockDTO>) request.getAttribute("list");
%>
<body>
<h1>상품재고현황</h1>
<form action="muldel.do" method="post">
<table border="1">
	<col width="50px">
	<col width="100px">
	<col width="100px">
	<col width="100px">
	<col width="200px">
	<col width="50px">
	<col width="200px">
	<col width="100px">
	<col width="50px">
	<tr>
		<th><input type="checkbox" name="all"  onclick="allSel(this)"/></th>
		<th>싱픔번호</th>
		<th>상품명</th>
		<th>상품재고수량</th>
		<th>원가</th>
		<th>카테고리번호</th>
		<th>상품내용</th>
		<th>판매가</th>
		<th>상품게시글번호</th>
	</tr>
	<%
		if(list==null||list.size()==0){
			out.print("<tr><td colspan='9'>----작성된 글이 없습니다.</td></tr>");
			}else{
		for(int i=0;i<list.size();i++){
			StockDTO dto=list.get(i);
	%>
				<tr>
					<td><input type="checkbox" name="chk" value="<%=dto.getPnum()%>"/></td>
					<td><%=dto.getPnum()%></td>
					<td><a href="stockUpdateForm.do?pnum=<%=dto.getPnum()%>" ><%=dto.getPname()%></a></td>
					<td><%=dto.getScount()%></td>
					<td><%=dto.getCost()%></td>
					<td><%=dto.getCnum()%></td>
					<td><%=dto.getPcontent()%></td>
					<td><%=dto.getPrice()%></td>					
					<td><%=dto.getPseq() %></td>
				</tr>
	<%
			}
		}
	%>
	<tr>
		<td colspan="9">
			<a href="stockInsertForm.do">글쓰기</a>
			<a href="index">메인</a>
			<input type="submit" value="삭제" />
		</td>
	</tr>
</table>
</form>
</body>
</html>