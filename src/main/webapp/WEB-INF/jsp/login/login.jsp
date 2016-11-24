 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function login_check(){
		var f = $('#login_form');
		var id= $('#login_id').val();
		var pwd = $('#login_pwd').val();
		
		if(id == ''){
			showMessage('아이디를 입력하세요.');
			return;
		}
		if(pwd == ''){
			showMessage('비밀번호를 입력하세요.');
			return;
		}
		
		$.ajax({
			url : '/login/login_ok.do',
			type : 'post',
			data : {
				"id" : $('#login_id').val(),
				"pwd" : $('#login_pwd').val()
			},
			datatype:"JSON",
			success : function(data) {
				//check.innerHTML = data;
				if (data == "success") {
					showMessage('로그인 성공',1000);
					setTimeout(function(){
						location.href="/main/main.do";
					},1000);
					
				} else {
					showMessage('아이디와 비밀번호를 확인해주세요.',1000);					
				}
			}
		});
	}
</script>
</head>
<body>
	<center>
		<div><span><h1>로 그 인</h1></span></div>
		<div class="loginForm">
        <form method="post" id="login_form" name="login_form" action="/login/login_ok.do">
           <div class="box">
            <input type="text" class="iText" name="login_id" id="login_id">
            <br>
            <input type="password" name="login_pwd" id="login_pwd" class="iText">
            <br>
            <p>
              <span class="fleft"><input type="checkbox" id=""><label for=""> 아이디 저장</label></span> 
              <span class="fright"><a href="/login/findid.do">아이디 찾기</a>&nbsp;|&nbsp;<a href="/login/findpwd.do">비밀번호 찾기</a></span>
            </p>
          </div>
          <input type="button" class="loginBtn" value="로그인" onclick="login_check()">
        </form>
      </div>
	</center>
</body>
</html>