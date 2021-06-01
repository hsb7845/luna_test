<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%@ include file="header.jsp" %>
<body>
<c:if test="${dto.image.imgname !=null }">
<img src="upload/${dto.image.imgname }">
</c:if>
<div style="text-align:center;">제목 : ${dto.etitle}
내용<br><br><br>${dto.econtent }</div>
</body>
<%@ include file="footer.jsp" %>
</html>