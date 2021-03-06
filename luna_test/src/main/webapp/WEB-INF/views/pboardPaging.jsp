<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판 목록</title>

<link rel='stylesheet' href='resources/luna/css/woocommerce-layout.css' type='text/css' media='all'/>
<link rel='stylesheet' href='resources/luna/css/woocommerce-smallscreen.css' type='text/css' media='only screen and (max-width: 768px)'/>
<link rel='stylesheet' href='resources/luna/css/woocommerce.css' type='text/css' media='all'/>
<link rel='stylesheet' href='resources/luna/css/font-awesome.min.css' type='text/css' media='all'/>
<link rel='stylesheet' href='resources/luna/style.css' type='text/css' media='all'/>
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Oswald:400,500,700%7CRoboto:400,500,700%7CHerr+Von+Muellerhoff:400,500,700%7CQuattrocento+Sans:400,500,700' type='text/css' media='all'/>
<link rel='stylesheet' href='resources/luna/css/easy-responsive-shortcodes.css' type='text/css' media='all'/>

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
		width : 320px;
		height : 320px;
	}
	.main_title{
	text-align: center;
}

.main_list {
    width: 1100px;
    margin: 0 auto;
}

.list_start {
    text-align: left;
}

.list_in {
	text-align: center;
}

.list_detail {
    display: inline-block;
    width: 300px;
    height: 300px;
    margin : 10px;
}

.paging_start{
	text-align: center;
}
</style>
<script src="<c:url value='resources/js/jquery-3.6.0.min.js'/>"></script>
<script>
	function selChange() {
		var sel = document.getElementById('arrayNum').value;
		var sorting = $("input[name='sorting']").val();
		location.href="pboardpaging.do?nowPage=${paging.nowPage}&arrayNum="+sel+"&sorting="+sorting;
	}
</script>
<body>
<%@ include file="header.jsp" %>
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
	</div>
</div> <!-- 옵션선택 끝 -->
	<br><br><br>
	<input type="hidden" name='sorting' value="${paging.sorting }">
	<div class="main_list">
	
		<div class="main_title">
		</div>
		<div class="list_start">
		<c:forEach items="${list }" var="list" varStatus="sta">
			<div class="list_detail">
			<a href='pboarddetail.do?pseq=${list.pseq }'>
			<c:if test="${list.image.imgname !=null }">
				<img src="upload/${list.image.imgname}"><br>
			</c:if>
				<div class="list_in">
					<div>${list.ptitle }</div><br>
	<%-- 				<div><fmt:formatDate value="${list.pdate }" pattern="yyyy.MM.dd"/> </div> --%>
					<div><fmt:formatNumber value="${list.stock.price}" pattern="#,###" /> 원</div><div width="100px"></div>
	<%-- 			<c:if test="${sta.count%3==0 }"> --%>
	<!-- 				<br> -->
	<%-- 			</c:if> --%>
				</div>
				</a>
			</div>
		</c:forEach>
	</div>
	<div style="display: block; text-align: center;">		
		<c:if test="${paging.startPage != 1 }">
			<a href="pboardpaging.do?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}&sorting=${paging.sorting}">&lt;</a>
		</c:if>
		<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
			<c:choose>
				<c:when test="${p == paging.nowPage }">
					<b>${p }</b>
				</c:when>
				<c:when test="${p != paging.nowPage }">
					<a href="pboardpaging.do?nowPage=${p }&cntPerPage=${paging.cntPerPage}&sorting=${paging.sorting}">${p }</a>
				</c:when>
			</c:choose>
		</c:forEach>
		<c:if test="${paging.endPage != paging.lastPage}">
			<a href="pboardpaging.do?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}&sorting=${paging.sorting}">&gt;</a>
		</c:if>
	</div>
</div>
<%@ include file="footer.jsp" %>

</body>
</html>