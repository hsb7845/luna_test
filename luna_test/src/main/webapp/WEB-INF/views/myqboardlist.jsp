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
	.qseq:hover{
		text-decoration : underline;
		cursor:pointer;
	}
</style>

<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
function showAnswer(qseq){
	$.ajax({
		url : "showAnsQ.do",
		mehthod : "post",
		dataType : "json",
		data : {"qseq":qseq},
		success : function(data) {
			var dto = data["dto"];
			if(dto==null){
				alert("아직 답변이 없는 글입니다.");
				return;
			}
			var AnsHtml = "<td></td><td>"+dto["id"]+"</td><th >&nbsp;└[답글]"+dto["qtitle"]+"</th>";
			AnsHtml += "<td colspna='2'>"+dto["qcontent"]+"</td>";
			$("#answer"+qseq).html(AnsHtml);
			$("#answer"+qseq).show();
		}
	});
}
	
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
<body>
<%@ include file="header.jsp" %>
<p class="cls1">문의 게시판 글 목록</p> 
<form action="muldelQboard.do" method="post">
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
				<th>상품 제목</th>
			</tr>
			<c:if test="${list==null }">
				<tr><td colspan='8'>----작성한 문의사항이 없습니다.---</td></tr>
			</c:if>
			<c:if test="${list!=null }">
				<c:forEach items="${list }" var="i">
					<tr class="qboardM">
						<td><input type="checkbox" name="chk" value="${i.qseq}"/></td>
						<td >${i.qseq}</td>
						<td class="qseq"><a onclick="showAnswer(${i.qseq})">${i.qtitle}</a> </td>
						<td>${i.qcontent }</td>
						<td>${i.pboard.ptitle }</td>
					</tr>
					<tr  id="answer${i.qseq}" style="display:none;">
						<td></td>
					</tr>
					</c:forEach>
				</c:if>
				<td colspan="6">
			<!-- 		<input type="button" value="문의 등록" id="insertqboardform"> -->
					<input type="button" value="메인" id="main">
					<input type="submit" value="삭제" />
					
			<!-- 		<a href="insertqboardform.do">문의 사항 작성</a> -->
			<!-- 		<a href=".do">메인</a> -->
				</td>
			</tr>
		</table>
	
<%@ include file="footer.jsp" %>
</table>
</form>
</body>
</html>