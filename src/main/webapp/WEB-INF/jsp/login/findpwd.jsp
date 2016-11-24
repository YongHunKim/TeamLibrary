<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<script>
		function findPwd(){
			
			if($('#find_id').val() == ''){
				showMessage('아이디를 입력해주세요.',1000);
				return;
			}else if($('#find_email').val() == ''){
				showMessage('이메일을 입력해주세요',1000);
				return;
			}
			
			$.ajax({
				url : '/login/findpwd_ok.do',
				type : 'post',
				data : {
					"id" : $('#find_id').val(),
					"email" : $('#find_email').val()
				},
				datatype:"JSON",
				success : function(data) {
					//check.innerHTML = data;
					if (data == "success") {
						showMessage('임시비밀번호가 발송되었습니다. 확인해 주세요',1000);
						setTimeout(function(){
							location.href="/login/login.do";
						},1000);
						
					} else {
						showMessage('메일발송에 실패하였습니다. 항목을 정확히 입력해주세요.',1000);					
					}
				}
			});
		}
	</script>
</head>
<body>

<center>
<h3>비밀번호 찾기</h3>
<form>
	<table class="table" style="width:0%;">
		<tr>
			<th width="20%">아이디</th>
			<td><input name="id" id="find_id" size="30"></td>
		</tr>
		<tr>
			<th width="20%">이메일</td>
			<td><input name="email" id="find_email" size="30"></td>
		</tr>		
		<tr>
			<td colspan="2" style="text-align:center;">
				<input class="btn btn-primary" type="button" value="찾기" onclick="javascript:findPwd();">
				<input class="btn btn-primary" type="button" value="취소" onclick="javascript:history.back();">
			</td> 
		</tr>
	</table>
</form>
</center>
</body>
</html>