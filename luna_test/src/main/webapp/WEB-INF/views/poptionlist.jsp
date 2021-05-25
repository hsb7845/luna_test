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
		var chks=document.getElementsByName("chks");
		for(var i=0;i<chks.length;i++){
			chks[i].checked=val.checked;
		}
	}
	$(function(){
		$("form").submit(function(){
			var bool = true;
			var count=$(this).find("input[name=chks]:checked").length;
			if(count==0){
				alert('최소 하나 이상 체크하세요!!!');
				bool= false;
			}else if(confirm("정말 삭제하시겠습니까?")==false){
				bool = false;
			}
			return bool
		});
		
		var chks = document.getElementsByName("chks");
	 	for(var i=0;i<chks.length;i++){
	 		chks[i].onclick =function(){
	 			var checkdObjs = document.querySelectorAll("input[name=chks]:checked");
	 			if(checkedObjs.length ==chks.length){
	 				document.getElementsByName("all")[0].checked=true;
	 			}else{
	 				document.getElementsByName("all")[0].checked=false;
	 			}
	 		}
	 	}
	})

</script>

<style type="text/css">
	.cls1 {
	    font-size: 40px;
	    text-align: center;
	}
	.optionT {
		font-size: 15px;
	}
	.optionM {
		font-size: 12px;
	}
	.optionD {
		font-size: 12px;
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
<%
	List<POptionDTO> list= (List<POptionDTO>) request.getAttribute("list");
%>
<body>
<%@ include file="header.jsp" %>
<p class="cls1">옵션 목록</p> 
<form action="muldelpoption.do" method="post">
<table border="1">
	<col width="30px">
	<col width="100px">
	<col width="100px">
	<col width="200px">
	<col width="300px">
	<tr align="center" class="optionT" >
		<th><input type="checkbox" name="all"  onclick="allSel(this)"/></th>
		<th>옵션번호</th>
		<th>상품게시글번호</th>
		<th>옵션제목</th>
		<th>옵션내용</th>
	</tr>
	<%
		if(list==null||list.size()==0){
			out.print("<tr><td colspan='6'>----작성된 문의 사항이 없습니다.---</td></tr>");
			} else {
		for(int i=0;i<list.size();i++){
			POptionDTO dto=list.get(i);
	%>
			<tr align="center" class="optionM" >
				<td><input type="checkbox" name="chks" value="<%=dto.getOseq()%>"/></td>
				<td><%=dto.getOseq()%></td>
				<td><%=dto.getPseq() %>
				<td><a href="updatepoptionForm.do?oseq=<%=dto.getOseq() %>"><%=dto.getOtitle()%></td>
				<td><%=dto.getOcontent()%></td>
			</tr>
<%
		}
	}
%>
<tr>
	<td colspan="5" class="optionD" >
		<a href="insertpoptionform.do">옵션추가</a>
		<a href=".do">메인</a>
		<input type="submit" value="삭제" />
	</td>
</tr>
</table>
</form>
<%@ include file="footer.jsp" %>
</body>
</html>