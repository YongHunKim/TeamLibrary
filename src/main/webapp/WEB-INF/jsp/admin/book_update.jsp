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
	<form action="/admin/book_update_ok.do" method="post"">
		<center><h3>수정하기</h3></center>
		<table class="table">
			<tr>
				<td width="10%">책 이미지</td>
				<td width="90%"><input type="text" name="book_image" size="100" value="${vo.book_image }"></td>
			</tr>
			<tr>
				<td width="10%">책 제목</td>
				<td width="90%">
				<input type="text" size="100" name="book_name" value="${vo.book_name }"></td>
			</tr>
			<tr>
				<td>저자</td>
				<td><input type="text" size="100" name="book_author"  value="${vo.book_author }"></td>
			</tr>
			<tr>
				<td>출판사</td>
				<td><input type="text" size="100" name="book_publish" value="${vo.book_publish }"></td>
			</tr>
			<tr>
				<td>출판일</td>
				<fmt:formatDate var="publish_date" value="${vo.book_publish_date}" pattern="yy/MM/dd"/>
				<td><input type="text" name="book_update_date" placeholder="yy/mm/dd" size="100" value="${publish_date}"></td>
			</tr>
			<tr>
				<td>책소개</td>
				<td><textarea name="book_info" rows="15" cols="102">${vo.book_info }</textarea></td>
			</tr>
			<tr>
				<td>카테고리</td>
				<td><input type="text" size="100" name="book_category" value="${vo.book_category }">
				<input type="hidden" name="book_code" value="${vo.book_code }">
				</td>
				
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="수정">
					<input type="button" onclick="javascript:window.close()" value="취소">
				</td>
			</tr>
	</table>
	</form>
</body>
</html>