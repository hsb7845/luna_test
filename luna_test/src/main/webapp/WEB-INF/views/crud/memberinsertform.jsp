<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form method="post" action="insertmember.do">
		<h1 style = "text-align:left">회원가입</h1>
		<div>
			<label for="id">아이디</label>
			<input type="text" name="id" id="id"/>
			<button type="button" id="idChk" onclick="fn_idChk();">중복확인</button><br>
		</div>
		비밀번호 <input type="password" name="pwd"><br>
		이메일 <input type="text" name="email"><br>
		이메일확인(중복확인) <input type="text" name="email_chk"><br>
		주소(API예정)	<input type="text" name="address"><br>
		생년월일 <input type="date" name="birthtest"><br>
		성별
		남<input type="checkbox" name="sex"  value="male" >
		여<input type="checkbox" name="sex"  value="femail" ><br>
		핸드폰 <input type="text" name="phone"><br>
<!-- <- 		가입일 <input type="Date" name="joindate"><br>  - -->
  		관리자 <input type="text" name="admin"><br>  
		닉네임 <input type="text" name="nickName"><br>
		이름	<input type="text" name="name"><br>
		포인트 <input type="text" name="point"><br>
		<input type="submit" value="등록">
		<input type="reset" value="다시입력">
	</form>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
 <script type="text/javascript">
	
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

 </script>
 <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
            // 예제를 참고하여 다양한 활용법을 확인해 보세요.
        }
    }).open();
</script>
</body>
</html>