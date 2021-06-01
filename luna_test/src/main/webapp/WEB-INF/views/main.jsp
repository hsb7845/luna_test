<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 페이지</title>

<style type="text/css">
    * {box-sizing: border-box;}
body {font-family: Verdana, sans-serif;}
.mySlides {display: none;}
img {vertical-align: middle;
}

/* Slideshow container */
.slideshow-container {
  max-width: 800px;
  position: relative;
  margin: auto;
  width: 800px;
  height: 300px;
}

/* Caption text */
.text {
  color: #000000;
  font-size: 15px;
  padding: 8px 12px;
  position: absolute;
  bottom: 8px;
  width: 100%;
  text-align: center;
}

/* Number text (1/3 etc) */
.numbertext {
  color: #f2f2f2;
  font-size: 12px;
  padding: 8px 12px;
  position: absolute;
  top: 0;
}

/* The dots/bullets/indicators */
.dot {
  height: 15px;
  width: 15px;
  margin: 0 2px;
  background-color: #bbb;
  border-radius: 50%;
  display: inline-block;
  transition: background-color 0.6s ease;
}

.active {
  background-color: #717171;
}

/* Fading animation */
.fade {
  -webkit-animation-name: fade;
  -webkit-animation-duration: 1.5s;
  animation-name: fade;
  animation-duration: 1.5s;
}

@-webkit-keyframes fade {
  from {opacity: .4} 
  to {opacity: 1}
}

@keyframes fade {
  from {opacity: .4} 
  to {opacity: 1}
}

/* On smaller screens, decrease text size */
@media only screen and (max-width: 300px) {
	

  .text {font-size: 11px}
}
    
    .box {
        display: flex;
        display: -webkit-flex;
        height: 200px;
        align-items: flex-start;
        -webkit-align-items: flex-start;
    }
    .list_start {
  
    text-align: center;
}

.list_start>H2 {
  
  	margin-left : 15%;
}
.list_in {
	text-align: center;
}

.list_detail {
	
    display: inline-block;
    width: 300px;
    height: 100px;
    margin : 10px;
}
    
</style>
</head>
<body>
<%@ include file="header.jsp" %>
<div class="slideshow-container">
<c:forEach items="${map.event }" var="i" varStatus="status">
<div class="mySlides fade">
  <div class="numbertext">${status.count }/ 3</div>
  <a href ="eboardDetail?eseq=${i.eseq }">
  <img src="http://placehold.it/300x100" style="width:100%">
  </a>
  <input type="hidden" name="imgname" value="${i.image.imgname}">
  <div class="text">Caption One</div>
</div>
</c:forEach>
</div>
<br>

<div style="text-align:center">
  <span class="dot"></span> 
  <span class="dot"></span> 
  <span class="dot"></span> 
</div>
    
	
   
    <div class="list_start">
    	<h2>New</h2>
    	<c:forEach items="${map.paging1 }" var="i">
    	<div class="list_detail">
    	<a href='pboarddetail.do?pseq=${i.pseq }'>
			<c:if test="${i.image.imgname !=null }">
				<img  src="upload/${i.image.imgname }" style="width :250px;height : 250px;"><br>
			</c:if>
				<div>${i.ptitle }</div><br>
				<div><fmt:formatNumber value="${i.stock.price}" pattern="#,###" /> 원</div><div width="100px"></div>
				</a>
				</div>
        </c:forEach>
    </div>
   
     <div class="list_start">
     	 <h2>Best Items</h2>
    	<c:forEach items="${map.best }" var="i">
    	<div class="list_detail">
    	<a href='pboarddetail.do?pseq=${i.pseq }'>
			<c:if test="${i.image.imgname !=null }">
				<img  src="upload/${i.image.imgname }" style="width :250px;height : 250px;"><br>
			</c:if>
				<div>${i.ptitle }</div><br>
				<div><fmt:formatNumber value="${i.stock.price}" pattern="#,###" /> 원</div><div width="100px"></div>
				</a>
				</div>
        </c:forEach>
    </div>
    
  <div class="list_start">
  	<h2>Earring</h2>
    	<c:forEach items="${map.paging2 }" var="i">
    	<div class="list_detail">
    	<a href='pboarddetail.do?pseq=${i.pseq }'>
			<c:if test="${i.image.imgname !=null }">
				<img  src="upload/${i.image.imgname }" style="width :250px;height : 250px;"><br>
			</c:if>
				<div>${i.ptitle }</div><br>
				<div><fmt:formatNumber value="${i.stock.price}" pattern="#,###" /> 원</div><div width="100px"></div>
				</a>
				</div>
        </c:forEach>
    </div>
    
    <div class="list_start">
    	<h2>Necklace</h2>
    	<c:forEach items="${map.paging3 }" var="i">
    	<div class="list_detail">
    	<a href='pboarddetail.do?pseq=${i.pseq }'>
			<c:if test="${i.image.imgname !=null }">
				<img  src="upload/${i.image.imgname }" style="width :250px;height : 250px;"><br>
			</c:if>
				<div>${i.ptitle }</div><br>
				<div><fmt:formatNumber value="${i.stock.price}" pattern="#,###" /> 원</div><div width="100px"></div>
				</a>
				</div>
        </c:forEach>
    </div>
   
    <div class="list_start">
     <h2>Ring</h2>
    	<c:forEach items="${map.paging4 }" var="i">
    	<div class="list_detail">
    	<a href='pboarddetail.do?pseq=${i.pseq }'>
			<c:if test="${i.image.imgname !=null }">
				<img  src="upload/${i.image.imgname }" style="width :250px;height : 250px;"><br>
			</c:if>
				<div>${i.ptitle }</div><br>
				<div><fmt:formatNumber value="${i.stock.price}" pattern="#,###" /> 원</div><div width="100px"></div>
				</a>
				</div>
        </c:forEach>
    </div>
   
     <div class="list_start">
      <h2>Bracelet</h2>
    	<c:forEach items="${map.paging5 }" var="i">
    	<div class="list_detail">
    	<a href='pboarddetail.do?pseq=${i.pseq }'>
			<c:if test="${i.image.imgname !=null }">
				<img  src="upload/${i.image.imgname }" style="width :250px;height : 250px;"><br>
			</c:if>
				<div>${i.ptitle }</div><br>
				<div><fmt:formatNumber value="${i.stock.price}" pattern="#,###" /> 원</div><div width="100px"></div>
				</a>
				</div>
        </c:forEach>
    </div>
<!--     <h2>Etc</h2> -->
<!--     <div class="box"> -->
<!--         <div><img src="img/flex.png" onclick="location=''"></div> -->
<!--         <div><img src="img/flex.png" onclick="location=''"></div> -->
<!--         <div><img src="img/flex.png" onclick="location=''"></div> -->
<!--         <div><img src="img/flex.png" onclick="location=''"></div> -->
<!--         <div><img src="img/flex.png" onclick="location=''"></div> -->
<!--     </div> -->


<script>
var slideIndex = 0;
showSlides();

function showSlides() {
    var i;
    var slides = document.getElementsByClassName("mySlides");
    var dots = document.getElementsByClassName("dot");
    for (i = 0; i < slides.length; i++) {
       slides[i].style.display = "none";  
    }
    slideIndex++;
    if (slideIndex > slides.length) {slideIndex = 1}    
    for (i = 0; i < dots.length; i++) {
        dots[i].className = dots[i].className.replace(" active", "");
    }
    slides[slideIndex-1].style.display = "block";  
    dots[slideIndex-1].className += " active";
    setTimeout(showSlides, 2000); // Change image every 2 seconds
}
</script>
<%@ include file="footer.jsp" %>
</body>

</html>