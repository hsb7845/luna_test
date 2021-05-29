<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<script src="<c:url value='resources/js/jquery-3.6.0.min.js'/>"></script>
<script src="<c:url value='resources/bootstrap-4.4.1-dist/js/bootstrap.min.js'/>"></script>
<script>
    function setThumbnail(event) {
		for (var image of event.target.files) { 
			var reader = new FileReader(); 
			reader.onload = function(event) {
				var img = document.createElement("img"); 
				img.setAttribute("src", event.target.result);
				document.querySelector("div#image_container").appendChild(img); 
				};
			reader.readAsDataURL(image); 
		} 
	}
    
    $(document).ready(function(){
    	var oEditors = [];
		nhn.husky.EZCreator.createInIFrame({
			oAppRef: oEditors,
			elPlaceHolder: "econtent",
			sSkinURI: "resources/smarteditor2-2.8.2.3/SmartEditor2Skin.html",
			fCreator: "createSEditor2"
		});
		 $("#save").click(function(){
	          oEditors.getById["econtent"].exec("UPDATE_CONTENTS_FIELD", []);
	          $("#frm").submit();
	      });    
    });
    </script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form id="frm" method="post" action="updateeboard.do" enctype="multipart/form-data">
	<input type="hidden" value="${dto.eseq }" name="eseq">
	<table style="width : 1100px;">
		<tr>
			<th>제목</th>
			<td><input type="text" name="etitle" value=${dto.etitle }></td>
			
		</tr>
		
		<tr>
			<th>현재 배너</th>
			<td><img src="upload/${dto.image.imgname }"></td>
		</tr>
		<tr>
		<th>
		이미지 수정
		</th>
		<td>
		<!-- 이미지 추가 -->						
		<span><input type='file' id="imgname" name="imgname" onchange="setThumbnail(event);" ></span>
		<div id="image_container"></div>
		</td>
		</tr>
		<tr>
		
		<th>내용</th>
		<td><!-- 표시할 textarea 영역 --> <textarea id="econtent"  name="econtent" rows="10" cols="100" >${dto.econtent }</textarea></td>
		</tr>
		<tr>
			<td colspan="2"><input id="save" type="submit" value="작성"></td>
		</tr>
	</table>
	</form>
</body>
  <script type="text/javascript" src="<c:url value='resources/smarteditor2-2.8.2.3/js/HuskyEZCreator.js'/>" charset="utf-8"></script>
</html>