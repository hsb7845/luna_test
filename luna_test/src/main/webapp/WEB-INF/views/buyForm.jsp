<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구매/결제 페이지</title>
<script src="<c:url value='resources/js/jquery-3.6.0.min.js'/>"></script>
<style>
.cmd{
	    max-width: 480px;
	    margin: 0 auto; /* 화면 가운데로 */
	    background-color: #fff;
	    height: 100%;
	    padding: 20px;
	    box-sizing: border-box;
	
	}
.cardPayment{
	display : none;
}



</style>
<script>
	function bankDisplay(frm) {
	 
	    var bank = frm.selectbank.selectedIndex;
	 
	    switch( bank ){
	       case 0:
	         frm.bank.value = '은행 및 계좌번호가 표시됩니다.';
	         break;
	       case 1:
	         frm.bank.value = '(국민은행) 0XX-XX-XXXX-XXX';
	         break;
	       case 2:
	         frm.bank.value = '(기업은행) XXX-0XXXXX-0X-0XX';
	         break;
	       case 3:
	         frm.bank.value = '(우리은행) 1XX-XX-0XXXXXXX';
	         break;
	       case 4:
	         frm.bank.value = '(농협) 0XXXXXX-0X-0XXXXX';
	         break;
	    }
    
   		 return true;
	}
	function newAdd(){
		
		$("input[name='memAdr']").attr("checked", false);
		$("input[type='text']").val('');
	}
	
	$(document).ready(function(){
		$("#cardPayment").click(function(){		
			$(".cardPayment").css("display","table-row");
			$(".noBankbook").css("display","none");
		})
		$("#noBankbook").click(function(){		
			$(".cardPayment").css("display","none");
			$(".noBankbook").css("display","table-row");
		})
		
		
		$("input[name='memAdr']").click(function(){
			$("input[name='newAdr']").attr("checked", false);
			var id = $("input[name='id']").val();
			$.ajax({
				url : "getAdr.do",
				mehthod : "post",
				dataType : "json",
				data : { "id" : id },
				asnc:false,
				success : function(data) {
					var mdto = data["mdto"];
					$("input[name='address']").val(mdto["name"]);
					$("input[name='phone']").val(mdto["phone"]);
					$("input[name='adr1']").val(mdto["adr1"]);
					$("input[name='adr2']").val(mdto["adr2"]);
					$("input[name='adr3']").val(mdto["adr3"]);
					$("input[name='adr4']").val(mdto["adr4"]);
				}
			});
		});
	});
	
	function addAdr(){
		var adr1 = $("input[name='adr1']").val();
		var adr2 = $("input[name='adr2']").val();
		var adr3 = $("input[name='adr3']").val();
		var adr4 = $("input[name='adr4']").val();
		var address = "("+adr1+") "+adr2+" "+adr3+adr4; 
		$("input[name='address']").val(address);
		if($("input[name='address']")!= "() "){
			return true;
		}else{
			return false;
		}
	}
</script>
<%@ include file="header.jsp" %>

</head>
<body>
	<h1>구매/결제</h1>
	<form method="post" action="buy.do">
		<input type="hidden" value="${mdto.id }" name="id" >
			<div id="layer" style="display:none;position:fixed;overflow:hidden;z-index:1;-webkit-overflow-scrolling:touch;">
 		<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnCloseLayer" style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1" onclick="closeDaumPostcode()" alt="닫기 버튼">
 	</div> 
	<table border="1">
		<tr>
			<th>이미지</th><th>상품명</th><th>판매가</th><th>수량</th><th>합계</th>
		</tr>
		<c:if test="${list!=null }">
			<c:set var="totalPrice" value="0"/>
			<c:forEach items="${list }" var="i" varStatus="status" >
			<c:set var="count" value="${status.count }"/>
			<tr>
				<td><img class="image" src="upload/img_dummy1.jpg" width="150px" height="150px"></td>
				<td><input type="hidden"value="${dto.pseq}" name="pseq${status.count }"/>${dto.ptitle }<br><input type="hidden"value="${i.optName }" name="selOpt${status.count}"/>${i.optName }</td>
				<td><input type="hidden"value="${i.price }" name="price${status.count}"/>${i.price}원</td>
				<td><input type="hidden"value="${i.amount }" name="amount${status.count}"/>${i.amount}</td>
				<td><c:set var="sumPrice" value="${i.price*i.amount }" /><c:out value="${sumPrice }원" /></td>
				
				<c:set var="totalPrice" value="${totalPrice+sumPrice }"/>
			</tr>
			
			</c:forEach>
			<tr>
			
				<th><input type="hidden" name="count" value="${count }">총 금액 </th><td><c:out value="${totalPrice }원"/><input type="hidden" name="totalPrice" value="${totalPrice }"></td>
			</tr>
		</c:if>
		<tr>
			<th>배송지 정보</th>
			<td><input type="radio" name="memAdr" value="sameInfo" checked="checked" /> 구매자와 동일정보
				<input type="radio" name="newAdr" onclick="newAdd()"  /> 새주소 입력</td>
		</tr>
		<tr>
			<th>받는 이</th>
			<td><input type="text" name="name" value="${mdto.name }"></td>
		</tr>
		<tr>
			<th>전화번호</th>
			<td><input type="text" name="phone" value="${mdto.phone }"></td>
		</tr>
		<tr>
			<th>주소</th>
			<td>
		<input type="text" name="adr1" value="${mdto.adr1}" id="sample2_postcode" placeholder="우편번호" required="required">
		<input type="button" onclick="sample2_execDaumPostcode()" value="주소 찾기">
		<input type="text" name="adr2" size=60 value="${mdto.adr2}" id="sample2_address" placeholder="주소" required="required"><br>
		<input type="text" name="adr3" size=60 value="${mdto.adr3}" id="sample2_detailAddress" placeholder="상세주소" required="required"><br>
		<input type="text" name="adr4" size=60 value="${mdto.adr4}" id="sample2_extraAddress" placeholder="참고항목" required="required">
		<input type="hidden" name="address" ></td>
		</tr>
	
		<tr>
			<th>결제 방법</th>
			<td><input type="radio" name="pay" id="noBankbook" checked="checked" /> 무통장 입금
				<input type="radio" name="pay"  id="cardPayment" value="cardPayment"  /> 카드결제</td>
		</tr>

	<tr class="noBankbook">
    <th  width="120" >
         입  금  은  행 :</th>
    <td widht="400">
    <select name="selectbank" onchange="bankDisplay(this.form)" >
    <option selected value=0>-선택하세요-
    <option value=1>국민은행
    <option value=2>기업은행
    <option value=3>우리은행
    <option value=4>농협
    </select>
    </td>
    </tr>
    <tr class="noBankbook">
    <th  width="120" >
    <font color="#0000ff">*</font> 입  금  계  좌 :</th>
    <td width="400">
    <input name="bank" type="text" size="50" maxlength="50"value="" readonly></td>
    </tr>
    <tr class="cardPayment">
    	<th>카드결제 : </th><td>카드결제는 구현이안됐습니다.</td>
    </tr>
		<tr>
			<th>적립 포인트 및 쿠폰</th>
		</tr>
		
	</table>
	<div class="cmd">
            <input type="submit" value="구매 확정" onclick="return addAdr()">
            <input type="button" value="취소" onclick="history.back(-1);">
      </div>
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
    </script>
</html>