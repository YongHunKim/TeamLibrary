<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
function delete_check(){
	var f = $('#delete_form');
	var id = $('#id').val();
	var pwd = $('#pwd').val();

	if(pwd == ''){
		showMessage('비밀번호를 입력하세요.');
		return;
	}
	
	$.ajax({
		url : '/mypage/member_leave_ok.do',
		type : 'post',
		data : {
			"id" : $('#id').val(),
			"pwd" : $('#pwd').val()
		},
		datatype:"JSON",
		success : function(data) {
			//check.innerHTML = data;
			if (data == "success") {
				showMessage('탈퇴되었습니다.',1000);
				setTimeout(function(){
					location.href="/main/main.do";
				},1000);
				
			} else {
				showMessage('비밀번호를 확인해주세요.',1000);
				setTimeout(function(){
					location.href="/mypage/member_leave.do";
				})
			}
		}
	});
}
</script>
</head>
<body>
	<span style="font-size: 20pt; font-weight: bold;">회원탈퇴</span>

	<p style="font-size: 9pt;">비밀번호를 입력하세요.</p>
	<form action="/mypage/member_leave_ok.do" id="delete_form">
		<input type="hidden" name="id" id="id" value="<%= session.getAttribute("id") %>" />
		<input type="password" size="20" name="pwd" id="pwd" />&nbsp;<input
			type="submit" value="확인" onclick="delete_check()"/>
	</form>
	<p style="font-size: 9pt;">
		외부로부터
		<!-- 아이디 -->
		${id}님의 정보를 안전하게 보호하기 위해 비밀번호를 다시 한 번 확인합니다.
	</p>
	<br />

	<p style="font-size: 9pt;">
		항상 <span style="color: red; font-weight: bold;">비밀번호는 타인에게 노출되지
			않도록 주의</span>해 주세요.
	</p>

</body>
</html>