<%@page import="com.luna.board.dtos.PCategoryDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	List<PCategoryDTO> list= (List<PCategoryDTO>) request.getAttribute("list");
%>
<body>
<h1>카테고리 게시판 글 목록</h1>
<form action="muldelPcatecory.do" method="post">
<table border="1">
	<col width="50px">
	<col width="50px">
	<col width="50px">
	<col width="50px">
	<tr>
		<th><input type="checkbox" name="all"  onclick="allSel(this)"/></th>
		<th>형태</th>
		<th>색상</th>
		<th>사이트</th>
	</tr>
	<%
		if(list==null||list.size()==0){
			out.print("<tr><td colspan='4'>----작성된 카테고리가 없습니다.</td></tr>");
			}else{
		for(int i=0;i<list.size();i++){
			PCategoryDTO dto=list.get(i);
	%>
				<tr>
					<td><input type="checkbox" name="chk" value="<%=dto.getCnum()%>"/></td>
					<td><%=dto.getCnum()%></td>
					<td><a href="updatePcategoryForm.do?cnum=<%=dto.getCnum() %>"><%=dto.getPtype()%></a> </td>
					<td><%=dto.getPcolor()%></td>
					<td><%=dto.getPsize()%></td>
				</tr>
	<%
			}
		}
	%>
	<tr>
		<td colspan="5">
			<a href="inserteboardform.do">카테고리 작성</a>
			<a href=".do">메인</a>
			<input type="submit" value="삭제" />
		</td>
	</tr>
</table>
</form>
</body>
</html>