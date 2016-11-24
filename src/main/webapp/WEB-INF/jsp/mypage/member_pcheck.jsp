<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
	function check_pass(id) {
		var id = $('#id').val();
		var pwd = $('#pwd').val();
	
		$.ajax({
			url : '/mypage/member_pcheck_ok.do',
			type : 'post',
			data : {
				"id" : id,
				"pwd" : pwd,
			},
			datatype : "JSON",
			success : function(data) {
				if (data == "success") {
					showMessage('확인되었습니다.', 1000);
					setTimeout(function() {
						location.href = "/mypage/member_update.do?id=${id}";
					}, 1000);
				} else {
					showMessage('보안 암호를 확인하세요.');
				}
			}
		});
	}
</script>
</head>
<body>
	<div align="left">
		<span style="color: blue; font-weight: bold; font-size: 20pt;">회원정보
			수정</span>
		<form action="/mypage/member_pcheck_ok.do">
			<p>비밀번호를 입력하세요</p>
			<input type="hidden" name="id"
				value="<%=session.getAttribute("id")%>" id="id"> <input
				type="password" size="16" maxlength="16" name="pwd" id="pwd" />&nbsp;
			<input type="button" value="확인"
				onclick="check_pass('<%=session.getAttribute("id")%>');" />
		</form>
		<br />
		<p style="font-size: 9pt;">

			외부로부터 ${id } 님의 정보를 안전하게 보호하기 위해 비밀번호를 다시 한 번 확인 합니다.<br /> 항상 비밀번호는
			타인에게 노출되지 않도록 주의해 주세요.
		</p>
	</div>
</body>
</html>