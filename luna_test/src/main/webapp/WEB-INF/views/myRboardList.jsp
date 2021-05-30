<%@page import="com.luna.board.dtos.RBoardDTO"%>
<%@page import="com.luna.board.dtos.QBoardDTO"%>
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
<meta name="viewport" content="width=device-width, initial-scale=1.0" /> 
<meta http-equiv="X-UA-Compatible" content="ie=edge" />

<meta name="viewport" content="width=device-width, initial-scale=1">

<title>문의 목록 창</title>

<link rel='stylesheet' href='resources/luna/css/woocommerce-layout.css' type='text/css' media='all'/>
<link rel='stylesheet' href='resources/luna/css/woocommerce-smallscreen.css' type='text/css' media='only screen and (max-width: 768px)'/>
<link rel='stylesheet' href='resources/luna/css/woocommerce.css' type='text/css' media='all'/>
<link rel='stylesheet' href='resources/luna/css/font-awesome.min.css' type='text/css' media='all'/>
<link rel='stylesheet' href='resources/luna/style.css' type='text/css' media='all'/>
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Oswald:400,500,700%7CRoboto:400,500,700%7CHerr+Von+Muellerhoff:400,500,700%7CQuattrocento+Sans:400,500,700' type='text/css' media='all'/>
<link rel='stylesheet' href='resources/luna/css/easy-responsive-shortcodes.css' type='text/css' media='all'/>

<style>
	.cls1 {
		font-size: 40px;
		text-align: center;
	}
</style>

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
	 	$("#insertqboardform").click(function(){
			location.href='insertqboardform.do'
		});
	 	
	 	$("#main").click(function(){
	 		location.href='.do'
	 	});
	 	
	})
	
		

</script>
</head>
<%
	List<RBoardDTO> list= (List<RBoardDTO>) request.getAttribute("list");
%>
<body>
<%@ include file="header.jsp" %>
<p class="cls1">리뷰 목록</p> 
		<form action="muldelRboard.do" method="post">
		
		<table align="left" border="1" cellpadding="4" cellspacing="0" bordercolor="#000000" style="border-collapse:collapse">
			<col width="50px">
			<col width="150px">
			<col width="200px">
			<col width="300px">
			<col width="200px">
			<col width="100px">
			<col width="100px">
			<col width="200px">
			<tr class="rboardT">
				<th><input type="checkbox" name="all"  onclick="allSel(this)"/></th>
				<th>리뷰 게시글 번호</th>
				<th>제목</th>
				<th>내용</th>
				<th>상품 게시글 번호</th>
				<th>아이디</th>
				<th>별점</th>
				<th>부모글 번호</th>
			</tr>
			<%
				if(list==null||list.size()==0){
					out.print("<tr><td colspan='8'>----작성된 리뷰가 없습니다.---</td></tr>");
					} else {
				for(int i=0;i<list.size();i++){
					RBoardDTO dto=list.get(i);
			%>
					<tr class="rboardM">
						<td><input type="checkbox" name="chk" value="<%=dto.getRseq()%>"/></td>
						<td><%=dto.getRseq()%></td>
						<td><a onclick="showAnswer(<%=dto.getRseq()%>)"><%=dto.getRtitle()%></a> </td>
						<td><%=dto.getRcontent()%></td>
						<td><%=dto.getPseq()%></td>
						<td><%=dto.getId()%></td>
						<td><%=dto.getStarrank()%></td>
						<td ><%=dto.getPar_rseq()%></td>
					</tr>
		<%
				}
			}
		%>
		</table>
		<table align="left" border="0" cellpadding="10" cellspacing="0" bordercolor="#000000" style="border-collapse:collapse">
		<tr>
			<td colspan="8" class="rboardD">
				<input type="button" value="리뷰 등록" id="insertrboardform" />
				<input type="button" value="메인" id="main">
				<input type="submit" value="삭제" />
				
		<!-- 		<a href=".do">메인</a> -->
		<!-- 		<a href="insertrboardform.do">리뷰 작성</a>  -->
			</td>
		</tr>
	</table>  
<%@ include file="footer.jsp" %>
</table>
</form>
</body>
</html>