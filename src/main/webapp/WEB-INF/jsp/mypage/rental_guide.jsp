<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	����ȳ�
	<br/>
	<br/>
	<br/>
	
	���⳻��
	<table border="1">
		<tr>
			<th width="10%" align="center">�����ڵ�</th>
			<th width="60%" align="left">������</th>
			<th width="10%" align="center">����</th>
			<th width="10%" align="center">������</th>
			<th width="10%" align="center">�ݳ���</th>
		</tr>
		<c:forEach var="vo" items="${rental}">
			<tr>
				<td width="10%" align="center">11${vo.book_code}</td>
				<td width="60%" align="left">11${vo.book_name}</td>
				<td width="10%" align="center">11${vo.book_author}</td>
				<td width="10%" align="center">11${vo.rent_date}</td>
				<td width="10%" align="center">11${vo.return_date}</td>
			</tr>
		</c:forEach>
	</table>

	<br/>
	<br/>
	<br/>
	
	���೻��

	<table border="1">
		<tr>
			<th width="10%" align="center">�����ڵ�</th>
			<th width="60%" align="left">������</th>
			<th width="10%" align="center">����</th>
			<th width="10%" align="center">������</th>
		</tr>
		<c:forEach var="vo" items="${reservation}">
			<tr>
				<td width="10%" align="center">${vo.book_code}</td>
				<td width="60%" align="left">${vo.book_name}</td>
				<td width="10%" align="center">${vo.book_author}</td>
				<td width="10%" align="center">${vo.reserve_date}</td>
			</tr>
		</c:forEach>
	</table>

</body>
</html>