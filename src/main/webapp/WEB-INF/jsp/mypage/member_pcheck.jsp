<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="form" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<div align="center">
		<h3>회원정보 수정</h3>
			<p>비밀번호를 입력하세요</p>
			<form:form action="member_pcheck_ok.do" method="post">
			<input type="text" size="15" name="pwd" />
			<input type="submit" value="확인" />
			</form:form>
			외부로부터 <!-- id --> 님의 정보를 안전하게 보호하기 위해 비밀번호를 다시 한 번 확인 합니다.<br/>
			항상 비밀번호는 타인에게 노출되지 않도록 주의해 주세요.
	</div>
</body>
</html>