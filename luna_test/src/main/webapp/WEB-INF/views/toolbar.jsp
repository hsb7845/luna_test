<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
$(function(){  
var currentPosition = parseInt($(".quick").css("top")); 
    $(window).scroll(function() { 
            var position = $(window).scrollTop(); // 현재 스크롤바의 위치값을 반환합니다. 
            $(".quick").stop().animate({"top":position+currentPosition+"px"},500); 
    });
});

function up() {
	$('html').scrollTop(0);
}

function down() {
	document.body.scrollTop = document.body.scrollHeight;
}
</script>
</head>
<body>

 
<div class="quick">
		<button type="button" onclick="up()"><img src="resources/upload/uparrow.png"></button>
       		<p><img src="" alt="최근본상품" /></p>
       		<ul>
				<li></li>
				<li></li>
			</ul>
		<button type="button" onclick="down()"><img src="resources/upload/downarrow.png"></button>
</div>
</body>
</html>