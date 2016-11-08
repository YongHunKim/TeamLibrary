<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<span style="font-size:14pt; font-weight: bolder;">회원탈퇴</span>
	
	<p style="font-size: 9pt;">비밀번호를 입력하세요.</p>
	<form action="/mypage/member_leave_ok.do">
	<input type="text" size="20" name="pwd" id="pwd" />&nbsp;<input type="submit" value="확인"/>
	
	<p style="font-size: 9pt;">외부로부터 <!-- 아이디 -->님의 정보를 안전하게 보호하기 위해 비밀번호를 다시 한 번 확인합니다.</p><br/>
	
	<p style="font-size: 9pt;">항상 <span style="color:red;font-weight: bold;">비밀번호는 타인에게 노출되지 않도록 주의</span>해 주세요.</p> 
	</form>
</body>
</html>