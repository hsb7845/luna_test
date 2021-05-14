<%@page import="com.luna.board.dtos.MemberDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">



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
<body>
	<form method="post" action="updatemember.do">
		<h1 style = "text-align:left">회원정보수정</h1>
		아이디<br> <input type="text" name="id" value="${dto.id}" readonly><br>
		<div class="pw_wrap">
		<div class="pw_name=">비밀번호<br></div>
		<div class="pw_input_box">
			<input type="password" class="pw_input" name="pwd"  value="${dto.pwd}" required>
		</div>
		<div class="pw_reg_tr" >올바른 비밀번호입니다.</div>
		<div class ="pw_reg_fl">(7자이상)최소 하나이상의 특수문자를 사용해주세요.</div>
		</div>
		<div class="pwck_wrap">
			<div class="pwck_name">비밀번호확인</div>
			<div class="pwck_input_box">
				<input type="password" class="pwck_input" name="pwdCheck" required>
			</div>
		<span class="final_pwck_ck">비밀번호 확인을 입력해주세요</span>
		<span class="pwck_input_re_1">비밀번호가 일치합니다</span>
		<span class="pwck_input_re_2">비밀번호가일치하지않습니다</span>
		</div>
		이메일<br> <input type="text" name="email"  value="${dto.email}"><br>
		주소<br>
		<input type="text" name="adr1" value="${dto.adr1}"id="sample2_postcode" placeholder="우편번호">
		<input type="button" onclick="sample2_execDaumPostcode()" value="우편번호 찾기"><br>
		<input type="text" name="adr2" value="${dto.adr2}" placeholder="주소"><br>
		<input type="text" name="adr3" value="${dto.adr3}" placeholder="상세주소">
		<input type="text" name="adr4" value="${dto.adr4}" placeholder="참고항목"><br>
				<!-- iOS에서는 position:fixed 버그가 있음, 적용하는 사이트에 맞게 position:absolute 등을 이용하여 top,left값 조정 필요 -->
<div id="layer" style="display:none;position:fixed;overflow:hidden;z-index:1;-webkit-overflow-scrolling:touch;">
<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnCloseLayer" style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1" onclick="closeDaumPostcode()" alt="닫기 버튼">
</div>
		생년월일<br> <input type="date" name="birthtest" value="<fmt:formatDate value="${dto.birth }" pattern="yyyy-MM-dd"/>"><br>
		성별<br> <input type="text" name="sex"  value="${dto.sex}" readonly><br>
		핸드폰<br> <input type="text" name="phone"  value="${dto.phone}"><br>
<!-- <- 		가입일 <input type="Date" name="joindate"><br>  - -->
	<%--   		관리자 <input type="hidden" name="admin"  value="${dto.admin}" readonly><br>   --%>
		닉네임 <br><input type="text" name="nickName"  value="${dto.nickName}"><br>
		이름<br>	<input type="text" name="name"  value="${dto.name}" readonly><br><br>
		<input type="submit" value="등록">
		<input type="reset" value="다시입력">
		<input type="button" value="회원탈퇴" onclick="deleteMem('${id}')">
	</form>
</body>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
 <script type="text/javascript">
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
	
</script>
<script>
 	function deleteMem(id){
 		if(confirm("정말 탈퇴하시겠습니까?")){
 			location.href ="deletemember.do?id="+id;
 		}
 	}
</script>

</html>