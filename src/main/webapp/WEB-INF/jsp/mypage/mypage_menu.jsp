<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�޴�</title>
</head>
<body>
	<div id="left_layer">
		����������
		<ul>
			<li><a class="active" href="#home">�⺻������</a></li>
			<li><a
				href="/mypage/member_pcheck.do?id=<%=session.getAttribute("id")%>">ȸ����������</a></li>
			<li><a href="/mypage/member_leave.do">ȸ��Ż��</a></li>
			<li><a
				href="/mypage/rental_guide.do?id=<%=session.getAttribute("id")%>">���⳻��</a></li>
			<li><a href="#">�ڸ�����</a></li>
		</ul>
	</div>
</body>
</html>