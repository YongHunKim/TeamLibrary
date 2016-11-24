<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<script>
		function bookReserve(){
			$.ajax({
				url : '/book/reserve_ok.do',
				type : 'post',
				data : {
					"book_code" : $('#reserve_book_code').val(),
					"id" : $('#reserve_id').val()
				},
				datatype:"JSON",
				success : function(data) {
					if (data == "success") {
						showMessage('예약 성공',1000);
						setTimeout(function(){
							location.href="/main/main.do";
						},1000);
						
					} else if(data="session_null"){
						showMessage('로그인 후 이용해주세요.',1000);
						setTimeout(function(){
							location.href="/login/login.do";
						},1000);
					}else {
						showMessage('예약에 실패했습니다.');					
					}
				}
			});
		}
	</script>
</head>
<body>
	
	<form method="post" action="/book/reserve_ok.do">
	<input type="hidden" name="book_code" id="reserve_book_code" value="${vo.book_code }">
	<input type="hidden" name="id" id="reserve_id" value="<%=session.getAttribute("id")%>">
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
			<td>반납예정일</td>
			<td>${vo.return_date }</td>
		</tr>
		<tr>
			<td>예약일</td>
			<td>${vo.reserve_date }</td>
		</tr>
		<tr>
			<td colspan="3" style="text-align:center;">
				<input class="btn btn-primary" type="button" value="예약" onclick="javascript:bookReserve();">
				<input class="btn btn-primary" type="button" value="취소" onclick="javascript:history.back();">
			</td>
		</tr>		
	</table>
	</form>
</body>
</html>