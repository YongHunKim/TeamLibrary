<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%= session.getAttribute("id") %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	대출안내
	<br />
	<br />
	<br /> 대출내역
	<table border="1">
		<tr>
			<th width="10%" align="center">도서코드</th>
			<th width="60%" align="left">도서명</th>
			<th width="10%" align="center">저자</th>
			<th width="10%" align="center">대출일</th>
			<th width="10%" align="center">반납일</th>
		</tr>
		<c:forEach var="vo"  items="${rental}" >
			<tr>
				<td width="10%" align="center">${vo.book_code}</td>
				<td width="60%" align="left">${vo.book_name}</td>
				<td width="10%" align="center">${vo.book_author}</td>
				<td width="10%" align="center"><fmt:formatDate value="${vo.rent_date}" pattern="yyyy-MM-dd"/></td>
				<td width="10%" align="center"><fmt:formatDate value="${vo.return_date}" pattern="yyyy-MM-dd"/></td>
			</tr>
		</c:forEach>
	</table>

	<br />
	<br />
	<br /> 예약내역

	<table border="1">
		<tr>
			<th width="10%" align="center">도서코드</th>
			<th width="60%" align="left">도서명</th>
			<th width="10%" align="center">저자</th>
			<th width="10%" align="center">예약일</th>
		</tr>
		<c:forEach var="vo" items="${reservation}">
			<tr>
				<td width="10%" align="center">${vo.book_code}</td>
				<td width="60%" align="left">${vo.book_name}</td>
				<td width="10%" align="center">${vo.book_author}</td>
				<td width="10%" align="center"><fmt:formatDate value="${vo.reserve_date }" pattern="yyyy-MM-dd"/></td>
			</tr>
		</c:forEach>
	</table>

</body>
</html>