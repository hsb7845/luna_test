<%@page import="com.luna.board.dtos.RBoardDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>  

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" /> 
<meta http-equiv="X-UA-Compatible" content="ie=edge" />

<meta name="viewport" content="width=device-width, initial-scale=1">

<title>리뷰 입력 창</title>

<link rel='stylesheet' href='resources/luna/css/woocommerce-layout.css' type='text/css' media='all'/>
<link rel='stylesheet' href='resources/luna/css/woocommerce-smallscreen.css' type='text/css' media='only screen and (max-width: 768px)'/>
<link rel='stylesheet' href='resources/luna/css/woocommerce.css' type='text/css' media='all'/>
<link rel='stylesheet' href='resources/luna/css/font-awesome.min.css' type='text/css' media='all'/>
<link rel='stylesheet' href='resources/luna/style.css' type='text/css' media='all'/>
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Oswald:400,500,700%7CRoboto:400,500,700%7CHerr+Von+Muellerhoff:400,500,700%7CQuattrocento+Sans:400,500,700' type='text/css' media='all'/>
<link rel='stylesheet' href='resources/luna/css/easy-responsive-shortcodes.css' type='text/css' media='all'/>

</head>
<style>
	.cls1 {
		font-size: 40px;
		text-align: center;
	}

	.rating .rate_radio + label {
	    position: relative;
	    display: inline-block;
	    margin-left: -4px;
	    z-index: 10;
	    width: 60px;
	    height: 60px;
	    background-image: url('resources/img/starrate.png');
	    background-repeat: no-repeat;
	    background-size: 60px 60px;
	    cursor: pointer;
	    background-color: #f0f0f0;
	}
	.rating .rate_radio:checked + label {
	    background-color: lightcoral;
	}
	
	.cmd {
		margin-left: 35%;
		margin-tog: 10%;
	}
	
	.rating {
	margin-top: 0%;
	margin-left: 18%;
	margin-bottom:0%;
	}
	
	/* 레이아웃 외곽 너비 400px 제한*/
	.wrap{
	    max-width: 480px;
	    margin: 0 auto; /* 화면 가운데로 */
	    background-color: #fff;
	    height: 100%;
	    padding: 20px;
	    box-sizing: border-box;
	
	}
	.reviewform textarea{
	    width: 100%;
	    padding: 10px;
	    box-sizing: border-box;
	}
	.rating .rate_radio {
	    position: relative;
	    display: inline-block;
	    z-index: 20;
	    opacity: 0.001;
	    width: 60px;
	    height: 60px;
	    background-color: lightcoral;
	    cursor: pointer;
	    vertical-align: top;
	    display: none;
	}
	.rating .rate_radio + label {
	    position: relative;
	    display: inline-block;
	    margin-left: -4px;
	    z-index: 10;
	    width: 60px;
	    height: 60px;
	    background-image: url('resources/img/starrate.png');
	    background-repeat: no-repeat;
	    background-size: 60px 60px;
	    cursor: pointer;
	    background-color: #f0f0f0;
	}
	.rating .rate_radio:checked + label {
	    background-color: lightcoral;
	}
	
	.warning_msg {
	    display: none;
	    position: relative;
	    text-align: center;
	    background: #ffffff;
	    line-height: 26px;
	    width: 100%;
	    color: red;
	    padding: 10px;
	    box-sizing: border-box;
	    border: 1px solid #e0e0e0;
	}
	
	
	#searching input {
	    width: 50px;
	    height: 50px;
	    padding: 20px;
	    box-sizing: border-box;
	    border-radius: 25px;
	    border: 0;
	    background: #eee;
	    font-size: 17px;
	    transition: all 0.5s;
	}
	
	#searching input:hover {
	    background: #ccc;
	}

	#searching input:focus {
	    outline: none;
	}

	.image_container {
		size: 50px;
	}

	
	
</style>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
$(function(){
	$("#main").click(function(){
		location.href='.do'
	});
})
</script>
<body>
<%@ include file="header.jsp" %>

<div class="star-box">
  <span class="star star_left"></span>
  <span class="star star_right"></span>

  <span class="star star_left"></span>
  <span class="star star_right"></span>

  <span class="star star_left"></span>
  <span class="star star_right"></span>

 <span class="star star_left"></span>
 <span class="star star_right"></span>

 <span class="star star_left"></span>
 <span class="star star_right"></span>
</div>
	
	
	<div class="wrap">
    
    <form method="post" action="insertrboard.do" onsubmit="return review1()">
    <input type="hidden" name="pseq" value="${pseq }"/>
    <input type="hidden" name="id"  value="${sessionScope.id}" >
    <p class="cls1">리뷰 쓰기</p>
    <table>
    	<tr>
			<th>제목</th>
			<td><input type="text" name="rtitle" required="required"
			placeholder="제목을 입력하세요" onfocus="this.placeholder=''" 
			onblur="this.placeholder='제목을 입력하세요'" name="search"></td>
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea rows="5" name="rcontent" class="review_textarea" placeholder="10자 이상  100자 이하" onfocus="this.placeholder=''" 	onblur="this.placeholder='10자 이상 100자 이하'"></textarea></td>
		</tr>
		</table>
    		
<!--     		<input type="file" name="imgname" id="image" accept="image/*" onchange="setThumbnail(event);" multiple /> -->
<!-- 			<div id="image_container" ></div> -->
	
<!-- 			<div style="margin-top:50px"> -->
<!-- 			    <input id="imageFile" type="file"> -->
<!-- 			</div> -->
			
<!-- 			<div style="margin-top:50px"> -->
<!-- 			    <input type="button" value="Resize Image" onclick="ResizeImage()"/> -->
<!-- 			</div> -->
			
<!-- 			<div style="margin-top:50px"> -->
<!-- 			    <img src="" id="output"> -->
<!-- 			</div> -->




        <input type="hidden" name="rate" id="rate" value="5" />
        <div class="review_rating">
            <div class="rating">
                <!-- 해당 별점을 클릭하면 해당 별과 그 왼쪽의 모든 별의 체크박스에 checked 적용 -->
                <input type="checkbox" name="starrank" id="rating1" value="1" class="rate_radio" title="1점">
                <label for="rating1"></label>
                <input type="checkbox" name="starrank" id="rating2" value="2" class="rate_radio" title="2점">
                <label for="rating2"></label>
                <input type="checkbox" name="starrank" id="rating3" value="3" class="rate_radio" title="3점" >
                <label for="rating3"></label>
                <input type="checkbox" name="starrank" id="rating4" value="4" class="rate_radio" title="-4점">
                <label for="rating4"></label>
                <input type="checkbox" name="starrank" id="rating5" value="5" class="rate_radio" title="5점">
                <label for="rating5"></label>
            </div>
        </div>
        
        <div class="cmd">
            <input type="submit" value="등록">
            <input type="button" value="뒤로 가기" onClick="location.href='http://localhost:8888/board/rboard.do'">
        </div>
        
    </form>
	</div>
<%@ include file="footer.jsp" %>

<!-- #page -->
<script src='js/jquery.js'></script>
<script src='js/plugins.js'></script>
<script src='js/scripts.js'></script>
<script src='js/masonry.pkgd.min.js'></script>

	
<script>
//별점 마킹 모듈 프로토타입으로 생성
function Rating(){
Rating.prototype.rate = 0;
Rating.prototype.setRate = function(newrate){
    //별점 마킹 - 클릭한 별 이하 모든 별 체크 처리
    this.rate = newrate;
    let items = document.querySelectorAll('.rate_radio');
    items.forEach(function(item, idx){
        if(idx < newrate){
            item.checked = true;
        }else{
            item.checked = false;
        }
    });   
}}


let rating = new Rating();//별점 인스턴스 생성

document.addEventListener('DOMContentLoaded', function(){
    //별점선택 이벤트 리스너
    document.querySelector('.rating').addEventListener('click',function(e){
        let elem = e.target;
        if(elem.classList.contains('rate_radio')){
            rating.setRate(parseInt(elem.value));
        }
    })
});


// //상품평 작성 글자수 초과 체크 이벤트 리스너
// document.querySelector('.review_textarea').addEventListener('keydown',function(){
//     //리뷰 100자 초과 안되게 자동 자름
//     let review = document.querySelector('.review_textarea');
//     let lengthCheckEx = /^.{100,}$/;
//     if(lengthCheckEx.test(review.value)){
//         //100자 초과 컷
//         review.value = review.value.substr(0,100);
//     }
// });

// //저장 전송전 필드 체크 이벤트 리스너
// document.querySelector('#save').addEventListener('click', function(e){
//     //별점 선택 안했으면 메시지 표시
//     if(rating.rate == 0){
//         rating.showMessage('rate');
//         return false;
//     }
//     //리뷰 10자 미만이면 메시지 표시
//     if(document.querySelector('.review_textarea').value.length < 10){
//         rating.showMessage('review');
//         return false;
//     }
//     //폼 서밋
// });


function review1() {
	if(document.querySelector('.review_textarea').value.length < 10){
//         rating.showMessage('review');
        alert(document.querySelector('.review_textarea').value.length+"자입니다. 10자 이상 입력해주세요.");
        return false;
       
    } else {
    	return true;
    }
}



// function setThumbnail(event) { 
// 	for (var image of event.target.files) { 
// 		var reader = new FileReader(); reader.onload = function(event) { 
// 			var img = document.createElement("img"); 
// 			img.setAttribute("src", event.target.result); 
// 			document.querySelector("div#image_container").appendChild(img); 
// 		}; 
// 		console.log(image); 
// 		reader.readAsDataURL(image); 
// 	} 
// }

// function ResizeImage() {
// 	var filesToUpload = document.getElementById('imageFile').files;
// 	var file = filesToUpload[0];

	 
// 	// 문서내에 img 객체를 생성합니다
// 	var img = document.createElement("img");
// 	// 파일을 읽을 수 있는 File Reader 를 생성합니다
// 	var reader = new FileReader();

// 	// 파일이 읽혀지면 아래 함수가 실행됩니다
// 	reader.onload = function(e) {
// 	img.src = e.target.result;

// 	// HTML5 canvas 객체를 생성합니다
// 	var canvas = document.createElement("canvas");   
// 	var ctx = canvas.getContext("2d");

// 	// 캔버스에 업로드된 이미지를 그려줍니다
// 	ctx.drawImage(img, 0, 0);

// 	// 최대폭을 400 으로 정했다고 가정했을때
// 	// 최대폭을 넘어가는 경우 canvas 크기를 변경해 줍니다.

//     var MAX_WIDTH = 400;
//     var MAX_HEIGHT = 400;
//     var width = img.width;
//     var height = img.height;


//     if (width > height) {
//         if (width > MAX_WIDTH) {
//             height *= MAX_WIDTH / width;
//             width = MAX_WIDTH;
//         }
//     } else {
//         if (height > MAX_HEIGHT) {
//             width *= MAX_HEIGHT / height;
//             height = MAX_HEIGHT;
//         }
//     }
//     canvas.width = width;
//     canvas.height = height;

//     // canvas에 변경된 크기의 이미지를 다시 그려줍니다.
//     var ctx = canvas.getContext("2d");
//     ctx.drawImage(img, 0, 0, width, height);

 
// 	// canvas 에 있는 이미지를 img 태그로 넣어줍니다
//     var dataurl = canvas.toDataURL("image/png");
//     document.getElementById('output').src = dataurl;
//     }
// reader.readAsDataURL(file);
// }





</script>
</body>
</html>