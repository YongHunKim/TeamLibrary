<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<script type="text/javascript">

	</script>
</head>
<body>
	<center><h3>수정하기</h3></center>
	<table class="table" style="margin-top: 30px;">
		<tr>
			<td rowspan="8" width="30%" style="text-align:center;"><img style="width:150px;" src="${vo.book_image }"></td>
			<td width="10%">책 제목</td>
			<td width="60%">${vo.book_name}</td>
		</tr>
		<tr>
			<td>저자</td>
			<td>${vo.book_author}</td>
		</tr>
		<tr>
			<td>출판사</td>
			<td>${vo.book_publish}</td>
		</tr>
		<tr>
			<td>출판일</td>
			<td><fmt:formatDate value="${vo.book_publish_date}" pattern="yyyy-MM-dd"/></td>
		</tr>
		<tr>
			<td>대여상태</td>
			<td>
			<c:choose>
				<c:when test="${vo.rent_yn == 'y' }">
				대출중
				</c:when>
				<c:otherwise>
				대출가능
				</c:otherwise>
			</c:choose>
			</td>
		</tr>
		<tr>
			<td>예약상태</td>
			<td>
			<c:choose>
				<c:when test="${vo.reserve_yn == 'y' }">
				 예약중
				</c:when>
				<c:otherwise>
				예약가능
				</c:otherwise>
			</c:choose>
			</td>
		</tr>
		<tr>
			<td>책소개</td>
			<td>${vo.book_info}</td>
		</tr>
		<tr>
			<td>카테고리</td>
			<td>${vo.book_category}</td>
		</tr>
		<tr>
			<td colspan="3" align="center">
			<br>
				<input type="button" onclick="javascript:window.close()" value="닫기">
			</td>
		</tr>
	</table>
</body>
</html>