<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<script>
		function bookRent(){
			$.ajax({
				url : '/book/rent_ok.do',
				type : 'post',
				data : {
					"book_code" : $('#rent_book_code').val(),
					"id" : $('#rent_id').val()
				},
				datatype:"JSON",
				success : function(data) {
					if (data == "success") {
						showMessage('대출 성공',1000);
						setTimeout(function(){
							location.href="/main/main.do";
						},1000);
						
					} else {
						showMessage('대출에 실패했습니다.',1000);					
					}
				}
			});
		}
	</script>
</head>
<body>
	<form method="post" action="/book/rent_ok.do">
	<input type="hidden" name="book_code" id="rent_book_code" value="${vo.book_code }">
	<input type="hidden" name="id" id="rent_id" value="<%=session.getAttribute("id")%>">
	<table class="table" style="margin-top: 30px;">
		<tr>
			<td rowspan="5" width="30%" style="text-align:center;"><img style="width:150px;" src="${vo.book_image }"></td>
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
			<td>대여일</td>
			<td>${today }</td>
		</tr>
		<tr>
			<td>반납일</td>
			<td>${return_day }</td>
		</tr>
		<tr>
			<td colspan="3" style="text-align:center;">
				<input class="btn btn-primary" type="button" value="대출" onclick="javascript:bookRent();">
				<input class="btn btn-primary" type="button" value="취소" onclick="javascript:history.back();">
			</td>
		</tr>		
	</table>
	</form>
<!-- 서평이나 추천글 있으면 띄워줄것 -->	
</body>
</html>