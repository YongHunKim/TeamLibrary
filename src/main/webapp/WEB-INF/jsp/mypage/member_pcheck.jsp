<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<div align="left">
		<span style="color:blue; font-weight: bold; font-size: 20pt;">회원정보 수정</span>
			<p>비밀번호를 입력하세요</p>
			<form action="member_pcheck_ok.do?id=<%= session.getAttribute("id") %>" method="post">
			<input type="password" size="16" maxlength="16" name="check_pwd" />&nbsp;
			<input type="submit" value="확인" />
			<form>
			<br/>
			외부로부터 ${id } 님의 정보를 안전하게 보호하기 위해 비밀번호를 다시 한 번 확인 합니다.<br/>
			항상 비밀번호는 타인에게 노출되지 않도록 주의해 주세요.
	</div>
</body>
</html>