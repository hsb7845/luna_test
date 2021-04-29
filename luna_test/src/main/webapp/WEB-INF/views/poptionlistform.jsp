<%@page import="com.luna.board.dtos.POptionDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>   
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">

	function allSel(val){
		var chks=document.getElementsByName("chk");
		for(var i=0;i<chks.length;i++){
			chks[i].checked=val.checked;
		}
	}
	$(function(){
		$("form").submit(function(){
			var bool = true;
			var count=$(this).find("input[name=chk]:checked").length;
			if(count==0){
				alert('최소 하나 이상 체크하세요!!!');
				bool= false;
			}else if(confirm("정말 삭제하시겠습니까?")==false){
				bool = false;
			}
			return bool
		});
		
		var chks = document.getElementsByName("chk");
	 	for(var i=0;i<chks.length;i++){
	 		chks[i].onclick =function(){
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
	List<POptionDTO> list= (List<POptionDTO>) request.getAttribute("list");
%>
<body>
<h1>문의 게시판 글 목록</h1>
<form action="muldelpoption.do" method="post">
<table border="1">
	<col width="50px">
	<col width="50px">
	<col width="200px">
	<col width="300px">
	<col width="200px">
	<col width="100px">
	<tr>
		<th><input type="checkbox" name="all"  onclick="allSel(this)"/></th>
		<th>옵션번호</th>
		<th>상품게시글번호</th>
		<th>옵션제목</th>
		<th>옵션내용</th>
ㄴ	</tr>
	<%
		if(list==null||list.size()==0){
			out.print("<tr><td colspan='6'>----작성된 문의 사항이 없습니다.---</td></tr>");
			} else {
		for(int i=0;i<list.size();i++){
			POptionDTO dto=list.get(i);
	%>
			<tr>
				<td><input type="checkbox" name="chk" value="<%=dto.getOseq()%>"/></td>
				<a href="updatepoptionForm.do?Oseq=<%=dto.getOseq() %>"><%=dto.getOtitle()%></a> </td>
				<td><%=dto.getPseq()%></td>
				<td><%=dto.getOcontent()%></td>
			</tr>
<%
		}
	}
%>
<tr>
	<td>
		<a href="insertpoptionform.do">옵션추가</a>
		<a href=".do">메인</a>
		<input type="submit" value="삭제" />
	</td>
</tr>
</table>
</form>
</body>
</html>