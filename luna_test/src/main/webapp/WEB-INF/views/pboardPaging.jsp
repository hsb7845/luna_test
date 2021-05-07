<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판 목록</title>
</head>
<style>
	h2 {
		text-align: center;
	}
	table {
		width: 100%;
	}
	#outter {
		display: block;
		width: 60%;
		margin: auto;
	}
	a {
		text-decoration: none;
	}
	img{
		width : 200px;
		height : 190px;
	}
	.main_title{
	text-align: center;
}

.main_list {
    width: 700px;
    margin: 0 auto;
}

.list_start {
    text-align: center;
}

.list_detail {

    display: inline-block;
    width: 220px;
    height: 260px;
	border: 1px solid;
    margin-bottom: 5px;
}

.paging_start{
	text-align: center;
}
</style>
<script>
	function selChange() {
		var sel = document.getElementById('cntPerPage').value;
		location.href="pboardpaging.do?nowPage=${paging.nowPage}&cntPerPage="+sel;
	}
</script>
<body>
<h2>게시판</h2>

<div id="outter">
	<div style="float:right">
		<select id="cntPerPage" name="sel" onchange="selChange()">
			<option value="5"
				<c:if test="${paging.cntPerPage == 5}">selected</c:if>>5줄 보기</option>
			<option value="10"
				<c:if test="${paging.cntPerPage == 10}">selected</c:if>>10줄 보기</option>
			<option value="15"
				<c:if test="${paging.cntPerPage == 15}">selected</c:if>>15줄 보기</option>
			<option value="20"
				<c:if test="${paging.cntPerPage == 20}">selected</c:if>>20줄 보기</option>
		</select>
	</div> <!-- 옵션선택 끝 -->
	<br><br><br>
	<div class="main_list">
		<div class="main_title">
		</div>
		<div class="list_start">
		<c:forEach items="${list }" var="list" varStatus="sta">
			<div class="list_detail">
			<c:if test="${list.image.imgname !=null }">
				<img  src="upload/img_dummy1.jpg"><br>
			</c:if>
				<div><a href='pboarddetail.do?seq=${list.pseq }'>${list.ptitle }</a></div><br>
<%-- 				<div><fmt:formatDate value="${list.pdate }" pattern="yyyy.MM.dd"/> </div> --%>
				<div>${list.stock.price} 원</div><div width="100px"></div>
<%-- 			<c:if test="${sta.count%3==0 }"> --%>
<!-- 				<br> -->
<%-- 			</c:if> --%>
			</div>
		</c:forEach>
	</div>
	<input type="button" value="글쓰기" style="float: right;" onclick="location.href='/write'"><br>
	
	<div style="display: block; text-align: center;">		
		<c:if test="${paging.startPage != 1 }">
			<a href="pboardpaging.do?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
		</c:if>
		<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
			<c:choose>
				<c:when test="${p == paging.nowPage }">
					<b>${p }</b>
				</c:when>
				<c:when test="${p != paging.nowPage }">
					<a href="pboardpaging.do?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
				</c:when>
			</c:choose>
		</c:forEach>
		<c:if test="${paging.endPage != paging.lastPage}">
			<a href="pboardpaging.do?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
		</c:if>
	</div>
</div>
</body>
</html>