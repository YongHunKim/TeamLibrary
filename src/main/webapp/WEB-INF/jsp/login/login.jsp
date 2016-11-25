 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	
	$(document).ready(function(){
	    // 저장된 쿠키값을 가져와서 ID 칸에 넣어준다. 없으면 공백으로 들어감.
	    var userInputId = getCookie("userInputId");
	    $("input[name='login_id']").val(userInputId); 
	     
	    if($("input[name='login_id']").val() != ""){ // 그 전에 ID를 저장해서 처음 페이지 로딩 시, 입력 칸에 저장된 ID가 표시된 상태라면,
	        $("#idSaveCheck").attr("checked", true); // ID 저장하기를 체크 상태로 두기.
	    }
	     
	    $("#idSaveCheck").change(function(){ // 체크박스에 변화가 있다면,
	        if($("#idSaveCheck").is(":checked")){ // ID 저장하기 체크했을 때,
	            var userInputId = $("input[name='login_id']").val();
	            setCookie("userInputId", userInputId, 7); // 7일 동안 쿠키 보관
	        }else{ // ID 저장하기 체크 해제 시,
	            deleteCookie("userInputId");
	        }
	    });
	     
	    // ID 저장하기를 체크한 상태에서 ID를 입력하는 경우, 이럴 때도 쿠키 저장.
	    $("input[name='login_id']").keyup(function(){ // ID 입력 칸에 ID를 입력할 때,
	        if($("#idSaveCheck").is(":checked")){ // ID 저장하기를 체크한 상태라면,
	            var userInputId = $("input[name='login_id']").val();
	            setCookie("userInputId", userInputId, 7); // 7일 동안 쿠키 보관
	        }
	    });
	});
	
	function setCookie(cookieName, value, exdays){
	    var exdate = new Date();
	    exdate.setDate(exdate.getDate() + exdays);
	    var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
	    document.cookie = cookieName + "=" + cookieValue;
	}
	 
	function deleteCookie(cookieName){
	    var expireDate = new Date();
	    expireDate.setDate(expireDate.getDate() - 1);
	    document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
	}
	 
	function getCookie(cookieName) {
	    cookieName = cookieName + '=';
	    var cookieData = document.cookie;
	    var start = cookieData.indexOf(cookieName);
	    var cookieValue = '';
	    if(start != -1){
	        start += cookieName.length;
	        var end = cookieData.indexOf(';', start);
	        if(end == -1)end = cookieData.length;
	        cookieValue = cookieData.substring(start, end);
	    }
	    return unescape(cookieValue);
	}
	
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
              <span class="fleft"><input type="checkbox" id="idSaveCheck"><label> 아이디 저장</label></span> 
              <span class="fright"><a href="/login/findid.do">아이디 찾기</a>&nbsp;|&nbsp;<a href="/login/findpwd.do">비밀번호 찾기</a></span>
            </p>
          </div>
          <input type="button" class="loginBtn" value="로그인" onclick="login_check()">
        </form>
      </div>
	</center>
</body>
</html>