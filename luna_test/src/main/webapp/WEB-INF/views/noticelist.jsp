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
	.notice{
		margin-left : 100px;
		width:80%;
	}

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


.list_start {
    text-align: left;
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
	<h3>공지사항</h3>
	<div style="float:right">
	</div>
</div> <!-- 옵션선택 끝 -->
	<br><br><br>
	<input type="hidden" name='sorting' value="${paging.sorting }">
	<div class="main_list">
	
		<div class="main_title">
		</div>
		<div class="list_start">
		<table class="notice">
		<col width="100px"> 
		<col width="500px">
		<col width="100px">
		<tr>
			<th>
				게시글 번호
			</th>
			<th>
				제목
			</th>
			<th>
				작성자
			</th>
			<c:forEach items="${list }" var="list" varStatus="sta">
				<tr>
				<td>${list.eseq }</td>
				<td><a href="eboardeetail.do?board=notice?eseq=${list.eseq }">${list.etitle }</a></td>
				<td>루나</td>
				</tr>
			</c:forEach>
		</table>
		
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
<%@ include file="footer.jsp" %>

</body>
</html>