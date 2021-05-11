<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 
<!-- 스마트에디터 -->
<!-- <script type="text/javascript" src="resources/smarteditor/js/service/HuskyEZCreator.js" charset="utf-8"></script> -->

<link rel="stylesheet" href="<c:url value='resources/bootstrap-4.4.1-dist/css/bootstrap.min.css'/>">

<body>
	<form method="post" action="insertpboard.do">
	<div>
		<div>
			<div>제목</div>
			<div><input type="text" name="ptitle"></div>
		</div>
		<div>
			<div>내용</div>
			<div><!-- 표시할 textarea 영역 --> <textarea id="pcontent"  name="pcontent" rows="10" cols="100" ></textarea></div>
		</div>
		<div>
			<div><input type="submit" value="작성"></div>
			<button type="button" class="btn">작성내용 콘솔에 찍기!!</button>
		</div>
	</div>
	</form>
</body>
<script src="<c:url value='resources/js/jquery-3.6.0.min.js'/>"></script>
<script src="<c:url value='resources/bootstrap-4.4.1-dist/js/bootstrap.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='resources/smarteditor/js/service/HuskyEZCreator.js'/>" charset="utf-8"></script>
<script>
		var oEditors = [];
		nhn.husky.EZCreator.createInIFrame({
			oAppRef: oEditors,
			elPlaceHolder: "pcontent",
			sSkinURI: "resources/smarteditor/SmartEditor2Skin.html",
			fCreator: "createSEditor2"
		});
		
		$(".btn").on("click", function() {
			oEditors.getById["pcontent"].exec("UPDATE_CONTENTS_FIELD", []);
			var value = document.getElementById("pcontent").value;
			console.log(value);
		});
	</script>
 </html>

