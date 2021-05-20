<%@page import="com.luna.board.dtos.RBoardDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>  

<%
   	request.setCharacterEncoding("utf-8");
%>   
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0" /> 
<meta http-equiv="X-UA-Compatible" content="ie=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1">

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>리뷰 목록 창</title>
<link rel='stylesheet' href='resources/luna/css/woocommerce-layout.css' type='text/css' media='all'/>
<link rel='stylesheet' href='resources/luna/css/woocommerce-smallscreen.css' type='text/css' media='only screen and (max-width: 768px)'/>
<link rel='stylesheet' href='resources/luna/css/woocommerce.css' type='text/css' media='all'/>
<link rel='stylesheet' href='resources/luna/css/font-awesome.min.css' type='text/css' media='all'/>
<link rel='stylesheet' href='resources/luna/style.css' type='text/css' media='all'/>
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Oswald:400,500,700%7CRoboto:400,500,700%7CHerr+Von+Muellerhoff:400,500,700%7CQuattrocento+Sans:400,500,700' type='text/css' media='all'/>
<link rel='stylesheet' href='resources/luna/css/easy-responsive-shortcodes.css' type='text/css' media='all'/>


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
<%
	List<RBoardDTO> list= (List<RBoardDTO>) request.getAttribute("list");
%>
<body>
<!-- <h1>리뷰 게시판 글 목록</h1> -->
<p class="cls1">리뷰 게시판 글 목록</p> 
<form action="muldelRboard.do" method="post">
<table border="1">
	<col width="50px">
	<col width="200px">
	<col width="100px">
	<col width="300px">
	<col width="200px">
	<col width="100px">
	<col width="100px">
	<col width="200px">
	<tr>
		<th id="m1" ><input type="checkbox" name="all"  onclick="allSel(this)"/></th>
		<th id="m1" >리뷰 게시글 번호</th>
		<th id="m1" >제목</th>
		<th id="m1" >내용</th>
		<th id="m1" >상품 게시글 번호</th>
		<th id="m1" >아이디</th>
		<th id="m1" >별점</th>
		<th id="m1" >부모글 번호</th>
	</tr>
	<%
		if(list==null||list.size()==0){
			out.print("<tr><td colspan='8'>----작성된 리뷰가 없습니다.---</td></tr>");
			} else {
		for(int i=0;i<list.size();i++){
			RBoardDTO dto=list.get(i);
	%>
			<tr>
				<td id="m2" ><input type="checkbox" name="chk" value="<%=dto.getRseq()%>"/></td>
				<td id="m2" ><%=dto.getRseq()%></td>
				<td id="m2" >
				<%
				if(dto.getLevel()>1){				
				%>
				<span style="padding-left:20px"></span>└
				<%
					}	
				%>
				<a href="updaterboardForm.do?rseq=<%=dto.getRseq() %>"><%=dto.getRtitle()%></a> </td>
				<td id="m2" ><%=dto.getRcontent()%></td>
				<td id="m2" ><%=dto.getPseq()%></td>
				<td id="m2" ><%=dto.getId()%></td>
				<td id="m2" ><%=dto.getStarrank()%></td>
				<td id="m2" ><%=dto.getPar_rseq()%></td>
			</tr>
<%
		}
	}
%>
<tr>
	<td colspan="8">
		<a href="insertrboardform.do">리뷰 작성</a>
		<a href=".do">메인</a>
		<input type="submit" value="삭제" />
	</td>
</tr>
<%@ include file="footer.jsp" %>
</table>
</form>
</body>
</html>