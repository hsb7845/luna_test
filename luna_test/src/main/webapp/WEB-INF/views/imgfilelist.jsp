<%@page import="com.luna.board.dtos.ImgFileDTO"%>
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
	List<ImgFileDTO> list= (List<ImgFileDTO>) request.getAttribute("list");
%>
<body>
<h1>이미지 파일 목록</h1>
<form action="muldelImgfile.do" method="post">
<table border="1">
	<col width="100px">
	<col width="100px">
	<col width="100px">
	<col width="100px">
	<col width="100px">
	<col width="100px">
	<col width="100px">
	<col width="100px">
	<tr>
		<th><input type="checkbox" name="all"  onclick="allSel(this)"/></th>
		<th>이미지 파일 번호</th>
		<th>파일 사이즈</th>
		<th>실제 이름</th>
		<th>이미지</th>
		<th>아이디</th>
		<th>상품 게시글 번호</th>
		<th>리뷰 게시글 번호</th>
		<th>이벤트 게시글 번호</th>
	</tr>
	<%
		if(list==null||list.size()==0){
			out.print("<tr><td colspan='8'>----이미지 파일이 없습니다.</td></tr>");
			}else{
		for(int i=0;i<list.size();i++){
			ImgFileDTO dto=list.get(i);
	%>
				<tr>
					<td><input type="checkbox" name="chk" value="<%=dto.getImgnum()%>"/></td>
					<td><%=dto.getImgnum()%></td>
					<td><a href="download.do?imgnum=<%=dto.getImgnum() %>"><%=dto.getImgname()%></a></td>
					<td><%=dto.getFilesize()%></td>
<td><img src="<%=request.getSession().getServletContext().getRealPath("upload") %>\<%=dto.getImgname()%>"></td>
					
					<td><%=dto.getId()%></td>
					<td><%=dto.getPseq()%></td>
					<td><%=dto.getRseq()%></td>
					<td><%=dto.getEseq()%></td>
				</tr>
	<%
			}
		}
	%>
	<tr>
		<td colspan="8">
			<a href="insertimgfileform.do">이미지 파일 작성</a>
			<a href=".do">메인</a>
			<input type="submit" value="삭제" />
		</td>
	</tr>
</table>
</form>
</body>
</html>