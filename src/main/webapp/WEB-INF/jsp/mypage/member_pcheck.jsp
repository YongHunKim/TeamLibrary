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
		<span style="color:blue; font-weight: bold; font-size: 20pt;">ȸ������ ����</span>
			<p>��й�ȣ�� �Է��ϼ���</p>
			<form action="member_pcheck_ok.do?id=<%= session.getAttribute("id") %>" method="post">
			<input type="password" size="16" maxlength="16" name="check_pwd" />&nbsp;
			<input type="submit" value="Ȯ��" />
			<form>
			<br/>
			�ܺηκ��� ${id } ���� ������ �����ϰ� ��ȣ�ϱ� ���� ��й�ȣ�� �ٽ� �� �� Ȯ�� �մϴ�.<br/>
			�׻� ��й�ȣ�� Ÿ�ο��� ������� �ʵ��� ������ �ּ���.
	</div>
</body>
</html>