<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h3>희망도서 신청</h3>
<form>
	<table class="table">
		<tr>
			<th width="20%">책제목</th>
			<td><input name="book_name" id="wish_book_name"></td>
		</tr>
		<tr>
			<th width="20%">저자</td>
			<td><input name="book_author" id="wish_book_author"></td>
		</tr>
		<tr>
			<th width="20%">출판사</th>
			<td><input name="book_publish" id="wish_book_publish"></td>
		</tr>
		<tr>
			<th width="20%">카테고리</th>
			<td><input name="book_category" id="wishbook_category"></td>
		</tr>
		<tr>
			<td colspan="2">
				<input class="btn btn-primary" type="button" value="작성">
				<input class="btn btn-primary" type="button" value="취소" onclick="javascript:history.back();">
			</td> 
		</tr>
	</table>
</form>
</body>
</html>