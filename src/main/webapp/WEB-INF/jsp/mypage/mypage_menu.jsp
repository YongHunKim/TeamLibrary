<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�޴�</title>
</head>
<body>
	<div style="float: left; width: 20%;">
		����������
		<ul>
			<li><a class="active" href="/mypage/mybook.do">���� ��õ����</a></li>
			<li><a
				href="/mypage/member_pcheck.do?id=<%=session.getAttribute("id")%>">ȸ����������</a></li>
			<li><a href="/mypage/member_leave.do">ȸ��Ż��</a></li>
			<li><a
				href="/mypage/rental_guide.do?id=<%=session.getAttribute("id")%>">���⳻��</a></li>
			<li><a href="/mypage/reserve_guide.do?id=<%= session.getAttribute("id") %>">���೻��</a></li>
		</ul>
	</div>
	
	<div style="float: left; width: 80%;">
		<jsp:include page="${test}"></jsp:include>
	</div>
</body>
</html>