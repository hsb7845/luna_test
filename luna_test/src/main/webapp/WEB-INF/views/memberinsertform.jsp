<%@page import="com.luna.board.dtos.MemberDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>   
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>SB Admin 2 - Register</title>

    <!-- Custom fonts for this template-->
    <link href="resources/boot/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">
    <!-- Custom styles for this template-->
    <link href="resources/boot/css/sb-admin-2.min.css" rel="stylesheet">
	<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    // 우편번호 찾기 화면을 넣을 element
    var element_layer = document.getElementById('layer');

    function closeDaumPostcode() {
        // iframe을 넣은 element를 안보이게 한다.
        element_layer.style.display = 'none';
    }

    function sample2_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample2_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample2_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample2_postcode').value = data.zonecode;
                document.getElementById("sample2_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample2_detailAddress").focus();

                // iframe을 넣은 element를 안보이게 한다.
                // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
                element_layer.style.display = 'none';
            },
            width : '100%',
            height : '100%',
            maxSuggestItems : 5
        }).embed(element_layer);

        // iframe을 넣은 element를 보이게 한다.
        element_layer.style.display = 'block';

        // iframe을 넣은 element의 위치를 화면의 가운데로 이동시킨다.
        initLayerPosition();
    }

    // 브라우저의 크기 변경에 따라 레이어를 가운데로 이동시키고자 하실때에는
    // resize이벤트나, orientationchange이벤트를 이용하여 값이 변경될때마다 아래 함수를 실행 시켜 주시거나,
    // 직접 element_layer의 top,left값을 수정해 주시면 됩니다.
    function initLayerPosition(){
        var width = 300; //우편번호서비스가 들어갈 element의 width
        var height = 400; //우편번호서비스가 들어갈 element의 height
        var borderWidth = 5; //샘플에서 사용하는 border의 두께

        // 위에서 선언한 값들을 실제 element에 넣는다.
        element_layer.style.width = width + 'px';
        element_layer.style.height = height + 'px';
        element_layer.style.border = borderWidth + 'px solid';
        // 실행되는 순간의 화면 너비와 높이 값을 가져와서 중앙에 뜰 수 있도록 위치를 계산한다.
        element_layer.style.left = (((window.innerWidth || document.documentElement.clientWidth) - width)/2 - borderWidth) + 'px';
        element_layer.style.top = (((window.innerHeight || document.documentElement.clientHeight) - height)/2 - borderWidth) + 'px';
    }
</script>
		
 <script type="text/javascript">
 	var code = "";                
 
	function fn_idChk() {
		$.ajax({
			url : "idChk.do",
			mehthod : "post",
			dataType : "json",
			data : { "id" : $("#id").val()},
			asnc:false,
			success : function(data) {
				if(data == 1) {
					alert("중복된 아이디 입니다.");
					$("#submit").attr("disabled", "disabled");
				} else if(data == 0) {
					alert("사용가능한 아이디 입니다.");
					$("#submit").removeAttr("disabled");
				}
			}
		})
	}
	

	 
	/* 인증번호 이메일 전송 */
	$(".mail_check_button").click(function(){
		var email = $(".mail_input").val();            // 입력한 이메일
		var cehckBox = $(".mail_check_input");        // 인증번호 입력란
		var boxWrap = $(".mail_check_input_box");    // 인증번호 입력란 박스
	
		 $.ajax({
		        
			type:"GET",
		    url:"mailCheck?email=" + email,
		    success:function(data){
		            
				console.log("data : " + data);
			    cehckBox.attr("disabled",false);
			    boxWrap.attr("id", "mail_check_input_box_true");
			    code = data;
		    }	
		});
               
    });
	/* 인증번호 비교 */
	$(".mail_check_input").blur(function(){
    
    var inputCode = $(".mail_check_input").val();        // 입력코드    
    var checkResult = $("#mail_check_input_box_warn"); // 비교결과
	
    if(inputCode == code) {
    	checkResult.html("인증번호가 일치합니다.");
    	checkResult.attr("class", "corret");
    	}else {
    		checkResult.html("인증번호를 다시 확인해주세요.");
    		checkResult.attr("class", "incorrect");
    	}	
	    
	});
	
	

	 
	/* 비밀번호 확인 일치 유효성 검사 */
	 
	$('.pwck_input').on("propertychange change keyup paste input", function(){
	 
	    var pw = $('.pw_input').val();
	    var pwck = $('.pwck_input').val();
	    $('.final_pwck_ck').css('display', 'none');
	        
	    if(pw == pwck){
	        $('.pwck_input_re_1').css('display','block');
	        $('.pwck_input_re_2').css('display','none');
	        pwckcorCheck = true;
	    }else{
	        $('.pwck_input_re_1').css('display','none');
	        $('.pwck_input_re_2').css('display','block');
	        pwckcorCheck = false;
	    }  
	});    
	
	$('.pw_input').on("propertychange change keyup paste input", function(){
		var pw = $('.pw_input').val();
		var check= /^(?=.*[a-zA-Z])(?=.*[^a-zA-Z0-9]).{7,17}$/;
		if(check.test(pw)==true){
			$('.pw_reg_tr').css('display','block');
			$('.pw_reg_fl').css('display','none');
		}else{
			$('.pw_reg_tr').css('display','none');
			$('.pw_reg_fl').css('display','block');
		}
	});
	
// 	function chekPassword(){ //여기 보시면 function 정의만 되어있고 부르는게 없어서 
	// 위에 비밀번호 확인 하는거랑 똑같이 input 값에 value 바뀌면 적용되게끔 바꾸었습니다.
// 		var check2 = /^(?=.*[a-zA-Z])(?=.*[^a-zA-Z0-9]).{10,12}$/.test(mbrPwd);  //영문,특수문자
	

function checkOnly(chk){

   var obj = document.getElementsByName("sex");

      for(var i=0; i<obj.length; i++){
            if(obj[i] != chk){
                  obj[i].checked = false;
                  }
            }
    }

function check() {
	if ($("input:checkbox[name='sex']").is(":checked")==false) {
		alert("성별을 선택하여 주십시오.");
		return;
	}
}
 </script>
 <style type="text/css">
 	 button {
	   color:#666666;
	   font-family:inherit;
	   font-size:14px;
	   line-height:1.8;
	   word-wrap:break-word;
	   -webkit-hyphens:auto;
	    -moz-hyphens:auto;
	    -ms-hyphens:auto;
	         hyphens:auto;
	         
	         font-size:100%;
	   /* Corrects font size not being inherited in all browsers */
	   margin:0;
	   /* Addresses margins set differently in IE6/7,F3/4,S5,Chrome */
	   vertical-align:baseline;
	   /* Improves appearance and consistency in all browsers */
	}
	button,input[type="button"],input[type="reset"],input[type="submit"] {
	   border:1px solid #ccc;
	   border-radius:0px;
	   background:#ccc;
	   color:#fff;
	   cursor:pointer;
	   /* Improves usability and consistency of cursor style between image-type 'input' and others */
	   -webkit-appearance:button;
	   /* Corrects inability to style clickable 'input' types in iOS */
	   padding:3px 15px;
	}
	button:hover,input[type="button"]:hover,input[type="reset"]:hover,input[type="submit"]:hover {
	   opacity:0.6;
	}
	
	body,button,input{
		font-family: 'BinggraeSamanco-Bold';
		font-weight: bold;
		line-height: 20px;
	
	 }
	 
	 .pwck_input_re_1{
		color : green;
		display : none;    
	}
	.pwck_input_re_2{
		color : red;
		display : none;    
	}    
	.pw_reg_tr{
		display :none;
		color : green;
	}
	.pw_reg_fl{
		display:  none;
		color :red;
	}
 </style>
</head>
<body class="bg-gradient-primary" method="post" action="insertmember.do" id="join">
<div class="container">

        <div class="card o-hidden border-0 shadow-lg my-5">
            <div class="card-body p-0">
                <!-- Nested Row within Card Body -->
                <div class="row">
                    <div class="col-lg-5 d-none d-lg-block bg-register-image">
                    	<img src="upload/logo.png" style='width:200px; height:80px; vertical-align: middle;'>
                    </div>
                    <div class="col-lg-7">
                        <div class="p-5">
                            <div class="text-center">
                                <h1 class="h4 text-gray-900 mb-4">회원가입</h1>
                            </div>
                            <form class="user">
<!--  아이디 -->
                            	<div class="form-group">
<!--                                     <input type="text" class="form-control form-control-user" id="id" placeholder="아이디"> -->
<!-- 									<label for="id">아이디</label> -->
                                    <input type="text" class="form-control form-control-user" 
                                    placeholder="아이디" name="id" id="id" required >
                                    <button type="button" id="idChk" onclick="fn_idChk();">중복확인</button><br>                                
                                </div>
<!--  비밀번호 -->
                                <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
<!--                                     	<div class="pw_name=">비밀번호</div> -->
                                        <input type="password" class="form-control form-control-user" 
                                        placeholder="비밀번호" name="pwd" placeholder="영문자+특수문자 조합" required >
                                    	<div class="pw_reg_tr" >올바른 비밀번호입니다.</div>
										<div class ="pw_reg_fl">(7자이상)최소 하나이상의 특수문자를 사용해주세요.</div>
                                    </div>
<!-- 비밀번호 확인 -->
                                    <div class="col-sm-6">                                       
                                    	<div class="pwck_wrap">
<!-- 											<div class="pwck_name">비밀번호확인</div> -->
											<div class="pwck_input_box">
												<input type="password" class="form-control form-control-user" 
												id="exampleLastName" placeholder="비밀번호확인" name="pwdCheck"required>				
											</div>
										<span class="pwck_input_re_1">비밀번호가 일치합니다</span>
										<span class="pwck_input_re_2">비밀번호가일치하지않습니다</span>
										</div>                                    
                                    </div>
                                </div>
<!--   이메일 -->
                                <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                    	<div class="mail_input_box">
                                        <input name="email" class="form-control form-control-user" id="exampleInputPassword" placeholder="이메일"  required>
                                    	</div>
                                    </div>
                                    <div class="col-sm-6">                                    	
                                        <input class="mail_check_input" disabled="disabled" placeholder="인증번호" required >
                                    
                                    	<div class="mail_check_button">
											<span><input type="button" value="인증번호 전송"></span>
										</div>
										<div class="clearfix"></div>
											<span id="mail_check_input_box_warn"></span>
										</div>									                                   
                                   </div> 
<!-- 주소 -->
								<div class="form-group row">
									<div class="col-sm-6 mb-3 mb-sm-0">
                                        <input type="password" class="form-control form-control-user" id="exampleInputPassword" placeholder="우편번호">
                                    </div>
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                        <input type="password" class="form-control form-control-user" id="exampleInputPassword" placeholder="우편번호찾기">
                                    </div>
                                    <div class="col-sm-6">
                                        <input type="password" class="form-control form-control-user" id="exampleRepeatPassword" placeholder="주소">
                                    </div>                     
                                    <div class="col-sm-6">
                                        <input type="password" class="form-control form-control-user" id="exampleRepeatPassword" placeholder="상세주소">
                                    </div>
                                    <div class="col-sm-6">
                                        <input type="password" class="form-control form-control-user" id="exampleRepeatPassword" placeholder="참고항목">
                                    </div>                                
                                </div>
<!--  생년월일 -->
                                <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
<!--                                     	생년월일 -->
                                    	<input type="date" class="form-control form-control-user" name="birthtest" max="9999-12-31" placeholder="생년월일" required><br>
                                    </div>
                                    <div class="col-sm-6">
<!--                                         <input type="password" class="form-control form-control-user" id="exampleRepeatPassword" placeholder="Repeat Password"> -->
<!--                             			성별<br> -->
											남<input type="checkbox" name="sex" onclick="checkOnly(this);" value="남" >
											여<input type="checkbox" name="sex" onclick="checkOnly(this);" value="여" ><br>
                                    </div>
                                </div>
<!--  핸드폰 -->                       
                                <div class="form-group">
                                    <input type="email" class="form-control form-control-user" id="exampleInputEmail" placeholder="핸드폰">
                                </div>
<!--   이름 및 닉네임  -->                                
                                <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                        <input type="password" class="form-control form-control-user" id="exampleInputPassword" placeholder="이름">
                                    </div>
                                    <div class="col-sm-6">
                                        <input type="password" class="form-control form-control-user" id="exampleRepeatPassword" placeholder="닉네이">
                                    </div>
                                </div>
                                
                                <a href="login.html" class="btn btn-primary btn-user btn-block">회원가입</a>
                                <a href="login.html" class="btn btn-primary btn-user btn-block">다시입력</a>
                                <hr>

                            </form>                      
                        </div>
                    </div>
                </div>
            </div>
        </div>        
    </div>

    <!-- Bootstrap core JavaScript-->
    <script src="resources/boot/vendor/jquery/jquery.min.js"></script>
    <script src="resources/boot/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <!-- Core plugin JavaScript-->
    <script src="resources/boot/vendor/jquery-easing/jquery.easing.min.js"></script>
    <!-- Custom scripts for all pages-->
    <script src="resources/boot/js/sb-admin-2.min.js"></script>
    
</body>
</html>


