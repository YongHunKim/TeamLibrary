<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>메뉴</title>
</head>
<body>
	<div id="left_layer">
		마이페이지
		<ul>
			<li><a class="active" href="#home">기본페이지</a></li>
			<li><a
				href="/mypage/member_pcheck.do?id=<%=session.getAttribute("id")%>">회원정보수정</a></li>
			<li><a href="/mypage/member_leave.do">회원탈퇴</a></li>
			<li><a
				href="/mypage/rental_guide.do?id=<%=session.getAttribute("id")%>">대출내역</a></li>
			<li><a href="#">자리예약</a></li>
		</ul>
	</div>
</body>
</html>