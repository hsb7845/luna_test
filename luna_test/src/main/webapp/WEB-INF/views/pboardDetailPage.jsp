<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.imgmain{
		
		width :100px;
		height : 100px;
	}
	
	.imgsub{
		
		width : 50px;
		height : 50px;
	}
</style>


</head>
<body>
	<form action="buyform.do" method="get">
	<div><!-- 상품 게시글  -->
		<div><!-- 대표 이미지 -->
			<c:if test="${map.img != null }">
				<img class="imgmain" src="upload/img_dummy1.jpg">
			</c:if>
		</div>
		<div><!-- 서브 이미지 -->
			<c:forEach items="${map.img }" var="i">
				<img class="imgsub" src="upload/img_dummy1.jpg">
			</c:forEach>
		</div>
	</div>
	<div>
		<h1>${map.pboard.ptitle}</h1>
		<h2>판매가 : ${map.pboard.stock.price }</h2>
	</div>
		<div>
			<input type="submit" value="구매">
			<input type="button" value="장바구니" onclick="incart()">
		</div>
	<div>
		${map.pboard.pcontent }
	</div>
	<br>
	</form>
	<div><!-- 리뷰 -->
		<table border="1">
			<tr>
				<th colspan="3">리뷰</th>
			</tr>
			<tr>
				<tr>	
					<th>아이디</th>
<%-- 					<c:if test="${map.rboard.img !=null }"> --%>
<!-- 						<th>사진</th> -->
<%-- 					</c:if> --%>
					<th>제목</th>
					<th>내용</th>
				</tr>
				<c:if test="${map.rboard=='[]'}">
					<tr>
						<td colspan="3">작성된 리뷰가 없습니다.</td>
					</tr>
				</c:if>
				<c:if test="${map.rboard!=null }">
			
					<c:forEach items="${map.rboard }" var="i">
						<tr>
							<td>${i.id }</td>
<%-- 							<c:if test="${i.img !=null }"> --%>
<!-- 							<td><img class="imgmain" src="upload/img_dummy1.jpg"></td> -->
<%-- 							</c:if> --%>
							<td>${i.rtitle }</td>
					</c:forEach>
				</c:if>
			</tr>	
		</table>
	</div>
	<div><!-- 문의 -->
			<table border="1">
			<tr>
				<th colspan="3">Q&A</th>
			</tr>
				<tr>	
					<th>아이디</th>
					<th>제목</th>
					<th>내용</th>
				</tr>
				<c:if test="${map.qboard=='[]' }">
					<tr>
						<td colspan="3">작성된 Q&A가 없습니다.</td>
					</tr>
				</c:if>
				<c:if test="${map.qboard!=null }">
					
					<c:forEach items="${map.qboard }" var="i">
						<tr>
							<td>${i.id }</td>

							<td>${i.qtitle }</td>
							
					</c:forEach>
				</c:if>
				
		</table>
	</div>
</body>
</html>