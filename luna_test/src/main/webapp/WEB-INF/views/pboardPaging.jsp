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
		var sel = document.getElementById('arrayNum').value;
		location.href="pboardpaging.do?nowPage=${paging.nowPage}&arrayNum="+sel;
	}
</script>
<body>
<h2>게시판</h2>

<div id="outter">
	<div style="float:right">
		<select id="arrayNum" name="sel" onchange="selChange()">
			<option value="1"
				<c:if test="${arrayNum == 1}">selected</c:if>>최신순</option>
			<option value="2"
				<c:if test="${arrayNum == 2}">selected</c:if>>가격 낮은순</option>
			<option value="3"
				<c:if test="${arrayNum == 3}">selected</c:if>>가격 높은순</option>
			<option value="4"
				<c:if test="${arrayNum == 4}">selected</c:if>>인기순</option>
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