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

<title>쿠폰 추가</title>

<link rel='stylesheet' href='resources/luna/css/woocommerce-layout.css' type='text/css' media='all'/>
<link rel='stylesheet' href='resources/luna/css/woocommerce-smallscreen.css' type='text/css' media='only screen and (max-width: 768px)'/>
<link rel='stylesheet' href='resources/luna/css/woocommerce.css' type='text/css' media='all'/>
<link rel='stylesheet' href='resources/luna/css/font-awesome.min.css' type='text/css' media='all'/>
<link rel='stylesheet' href='resources/luna/style.css' type='text/css' media='all'/>
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Oswald:400,500,700%7CRoboto:400,500,700%7CHerr+Von+Muellerhoff:400,500,700%7CQuattrocento+Sans:400,500,700' type='text/css' media='all'/>
<link rel='stylesheet' href='resources/luna/css/easy-responsive-shortcodes.css' type='text/css' media='all'/>

<script src="<c:url value='resources/js/jquery-3.6.0.min.js'/>"></script>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
</head>

<script>

	var chk_arr = [];
	$("input[name='chk']:checked").each(function(){
	   var chk =$(this).val();
	   chk_arr.push(chk);
	})

</script>


<style>
	.cls1 {
		font-size: 40px;
		text-align: center;
	}
</style>


<body>



<form method="post" action="insertEveryCoup.do">
<p class="cls1">쿠폰 추가</p>
<table>		
	<tr>
		<th>아이디</th>
		<td>
			<c:forEach var="list" items="${chk }">
               <li>${list}<input type='hidden' name='chk' value='${list}' /></li>
       		</c:forEach>
		</td>
	</tr>
	<tr>
		<th>쿠폰내용</th>
		<td>
			<input type='checkbox' name='ccontent' value='new' />신규 가입 축하 쿠폰&nbsp;&nbsp;
			<input type='checkbox' name='ccontent' value='birth' />생일 축하 쿠폰
		</td>
		
<!-- 		<input type="text" name="ccontent"></td> -->
	</tr>
	<tr>
		<th>할인금액</th>
		<td><input type="number" name="discount"></td>
	</tr>
	<tr>
		<td><input type="submit" value="추가"></td>
	</tr>
	<%@ include file="footer.jsp" %>
</table>
</form>
</body>
</html>