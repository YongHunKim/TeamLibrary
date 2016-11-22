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
<style type="text/css">
	td{
	font-size: 15px;
	}
	
	body{
		background-image: url('/images/admin/update_con.png');
		background-size: 100%;
		background-repeat: no-repeat;
	}
</style>
</head>
<body>
	<table class="table"  style="filter:alpha(opacity=50)">
		<tr>
		<td colspan="3">
		<center><h3>내용보기</h3></center>
		</td>
		<tr>
			<td rowspan="8" width="25%" style="text-align:center;"><img style="width: 195px; height: 245px;" src="${vo.book_image }"></td>
			<th width="10%">책 제목</th>
			<td width="65%">${vo.book_name}</td>
		</tr>
		<tr>
			<th>저자</th>
			<td>${vo.book_author}</td>
		</tr>
		<tr>
			<th>출판사</th>
			<td>${vo.book_publish}</td>
		</tr>
		<tr>
			<th>출판일</th>
			<td><fmt:formatDate value="${vo.book_publish_date}" pattern="yyyy-MM-dd"/></td>
		</tr>
		<tr>
			<th>대여상태</th>
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
			<th>예약상태</th>
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
			<th valign="top">책소개</th>
			<td>${vo.book_info}</td>
		</tr>
		<tr>
			<th>카테고리</th>
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