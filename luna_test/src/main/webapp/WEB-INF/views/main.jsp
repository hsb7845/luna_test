<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 페이지</title>

<style type="text/css">
    * {box-sizing: border-box;}
body {font-family: Verdana, sans-serif;}
.mySlides {display: none;}
img {vertical-align: middle;}

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
    .box > div {
        flex: 1;
        -webkit-flex: 1;
        margin: 10px;
        font-size: 20px;
    }
    
</style>
</head>
<body>
<div class="slideshow-container">

<div class="mySlides fade">
  <div class="numbertext">1 / 3</div>
  <img src="http://placehold.it/300x100" style="width:100%">
  <div class="text">Caption One</div>
</div>

<div class="mySlides fade">
  <div class="numbertext">2 / 3</div>
  <img src="http://placehold.it/300x100" style="width:100%">
  <div class="text">Caption Two</div>
</div>

<div class="mySlides fade">
  <div class="numbertext">3 / 3</div>
  <img src="http://placehold.it/300x100" style="width:100%">
  <div class="text">Caption Three</div>
</div>

</div>
<br>

<div style="text-align:center">
  <span class="dot"></span> 
  <span class="dot"></span> 
  <span class="dot"></span> 
</div>
    
	<h3>New</h3>
    <div class="box">
        <div><img src="img/flex.png" onclick="location=''"></div>
        <div><img src="img/flex.png" onclick="location=''"></div>
        <div><img src="img/flex.png" onclick="location=''"></div>
        <div><img src="img/flex.png" onclick="location=''"></div>
        <div><img src="img/flex.png" onclick="location=''"></div>
    </div>
    <h3>Best Items</h3>
    <div class="box">
        <div><img src="img/flex.png" onclick="location=''"></div>
        <div><img src="img/flex.png" onclick="location=''"></div>
        <div><img src="img/flex.png" onclick="location=''"></div>
        <div><img src="img/flex.png" onclick="location=''"></div>
        <div><img src="img/flex.png" onclick="location=''"></div>
    </div>
    <h3>Earring</h3>
    <div class="box">
        <div><img src="img/flex.png" onclick="location=''"></div>
        <div><img src="img/flex.png" onclick="location=''"></div>
        <div><img src="img/flex.png" onclick="location=''"></div>
        <div><img src="img/flex.png" onclick="location=''"></div>
        <div><img src="img/flex.png" onclick="location=''"></div>
    </div>
    <h3>Necklace</h3>
    <div class="box">
        <div><img src="img/flex.png" onclick="location=''"></div>
        <div><img src="img/flex.png" onclick="location=''"></div>
        <div><img src="img/flex.png" onclick="location=''"></div>
        <div><img src="img/flex.png" onclick="location=''"></div>
        <div><img src="img/flex.png" onclick="location=''"></div>
    </div>
    <h3>Ring</h3>
    <div class="box">
        <div><img src="img/flex.png" onclick="location=''"></div>
        <div><img src="img/flex.png" onclick="location=''"></div>
        <div><img src="img/flex.png" onclick="location=''"></div>
        <div><img src="img/flex.png" onclick="location=''"></div>
        <div><img src="img/flex.png" onclick="location=''"></div>
    </div>
    <h3>Bracelet</h3>
    <div class="box">
        <div><img src="img/flex.png" onclick="location=''"></div>
        <div><img src="img/flex.png" onclick="location=''"></div>
        <div><img src="img/flex.png" onclick="location=''"></div>
        <div><img src="img/flex.png" onclick="location=''"></div>
        <div><img src="img/flex.png" onclick="location=''"></div>
    </div>
    <h3>Etc</h3>
    <div class="box">
        <div><img src="img/flex.png" onclick="location=''"></div>
        <div><img src="img/flex.png" onclick="location=''"></div>
        <div><img src="img/flex.png" onclick="location=''"></div>
        <div><img src="img/flex.png" onclick="location=''"></div>
        <div><img src="img/flex.png" onclick="location=''"></div>
    </div>


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

</body>

</html>