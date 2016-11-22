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
	
	<style>
body{
	background-image: url("/images/admin/book_update.jpg");
	background-repeat: no-repeat;
	background-position: center;
	background-size: 100% 100%; 
	background-color:transparent;
}

th{
	color: #670000;
	text-align: left;
	font-size: 14px;
}
</style>

</head>
<body>
	<form action="/admin/book_update_ok.do" method="post">
		<center><h3>책 정보 변경</h3></center>
		<table class="table" style="filter:alpha(opacity=50)" align="center" border="0">
			<tr>
				<th width="15%">&nbsp;&nbsp;책 이미지</th>
				<td width="88%"><input type="text" name="book_image" size="75" value="${vo.book_image }" style="background-color:transparent"></td>
			</tr>
			<tr>
				<th width="10%">&nbsp;&nbsp;책 제목</th>
				<td width="88%">
				<input type="text" size="75" name="book_name" value="${vo.book_name }" style="background-color:transparent"></td>
			</tr>
			<tr>
				<th>&nbsp;&nbsp;저자</th>
				<td><input type="text" size="75" name="book_author"  value="${vo.book_author }" style="background-color:transparent"></td>
			</tr>
			<tr>
				<th>&nbsp;&nbsp;출판사</th>
				<td><input type="text" size="75" name="book_publish" value="${vo.book_publish }" style="background-color:transparent"></td>
			</tr>
			<tr>
				<th>&nbsp;&nbsp;출판일</th>
				<fmt:formatDate var="publish_date" value="${vo.book_publish_date}" pattern="yy/MM/dd"/>
				<td><input type="text" name="book_update_date" placeholder="yy/mm/dd" size="75" value="${publish_date}"
				style="background-color:transparent"></td>
			</tr>
			<tr>
				<th valign="top">&nbsp;&nbsp;책소개</th>
				<td><textarea name="book_info" rows="10" cols="77" style="background-color:transparent"
				id="bookinfo">${vo.book_info }</textarea></td>
			</tr>
			<tr>
				<th>&nbsp;&nbsp;카테고리</th>
				<td><input type="text" size="75" name="book_category" value="${vo.book_category }">
				<input type="hidden" name="book_code" value="${vo.book_code }" style="background-color:transparent">
				</td>
				
			</tr>
			<tr>
				<td colspan="3" align="center">
					<input type="submit" value="수정">
					<input type="button" onclick="javascript:window.close()" value="취소">
				</td>
			</tr>
	</table>
	</form>
</body>
</html>