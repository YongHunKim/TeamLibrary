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
		<h3>ȸ������ ����</h3>
			<p>��й�ȣ�� �Է��ϼ���</p>
			<form:form action="member_pcheck_ok.do" method="post">
			<input type="text" size="15" name="pwd" />
			<input type="submit" value="Ȯ��" />
			</form:form>
			�ܺηκ��� <!-- id --> ���� ������ �����ϰ� ��ȣ�ϱ� ���� ��й�ȣ�� �ٽ� �� �� Ȯ�� �մϴ�.<br/>
			�׻� ��й�ȣ�� Ÿ�ο��� ������� �ʵ��� ������ �ּ���.
	</div>
</body>
</html>