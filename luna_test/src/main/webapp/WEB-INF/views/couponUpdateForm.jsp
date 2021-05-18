<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
     

<%
	request.setCharacterEncoding("utf-8");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" /> 
<meta http-equiv="X-UA-Compatible" content="ie=edge" />

<meta name="viewport" content="width=device-width, initial-scale=1">

<title>쿠폰 수정</title>

<link rel='stylesheet' href='resources/luna/css/woocommerce-layout.css' type='text/css' media='all'/>
<link rel='stylesheet' href='resources/luna/css/woocommerce-smallscreen.css' type='text/css' media='only screen and (max-width: 768px)'/>
<link rel='stylesheet' href='resources/luna/css/woocommerce.css' type='text/css' media='all'/>
<link rel='stylesheet' href='resources/luna/css/font-awesome.min.css' type='text/css' media='all'/>
<link rel='stylesheet' href='resources/luna/style.css' type='text/css' media='all'/>
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Oswald:400,500,700%7CRoboto:400,500,700%7CHerr+Von+Muellerhoff:400,500,700%7CQuattrocento+Sans:400,500,700' type='text/css' media='all'/>
<link rel='stylesheet' href='resources/luna/css/easy-responsive-shortcodes.css' type='text/css' media='all'/>

</head>
<%
	String adminId = (String)session.getAttribute("admin");
%>
<body>
<form method="post" action="updateCoupon.do">
<input type="hidden" name="cseq" value="${dto.cseq}">
<table>	
<h1>쿠폰 수정</h1>

	
<% 	
 	if(adminId.equals("관리자")) { %>
			<tr>
				<th>쿠폰내용</th>
				<td><input type='text' name='ccontent' value='${dto.ccontent }'></td>
			</tr>
			<tr>
				<th>할인금액</th>
				<td><input type='number' name='discount'
					value='${dto.discount }'></td>
			</tr>
			<tr>
				<td><input type='submit' value='수정'>
				<a href='.do'>메인</a>
				<input type='submit' value='삭제' />
				</td>
			</tr>
			<% 
			} else { 
			%>
			<tr>
				<th>쿠폰내용</th>
				<td><input type='text' name='ccontent' value='${dto.ccontent }'
					readonly></td>
			</tr>
			<tr>
				<th>할인금액</th>
				<td><input type='number' name='discount'
					value='${dto.discount }' readonly></td>
			</tr>
			<tr>
				<td><a href='.do'>메인</a>&nbsp;&nbsp;<input type='button'
					value='뒤로 가기' onclick='history.back(-1);'></td>
			</tr>
			<%
			}
%>
<%@ include file="footer.jsp" %>
		</table>	
</form>
</body>
</html>