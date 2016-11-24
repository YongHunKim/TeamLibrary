<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<script>
	function add_wishbook(){
		
		if($('#wish_book_name').val() == ''){
			showMessage('책이름을 입력하세요',1000);
			return;
		}else if($('#wish_book_author').val() == ''){
			showMessage('저자를 입력하세요',1000);
			return;
		}
		
		$.ajax({
			url : '/book/wishbook.do',
			type : 'post',
			data : {
				id : $('#wish_book_id').val(),
				wish_book_name : $('#wish_book_name').val(),
				wish_book_author : $('#wish_book_author').val(),
				wish_book_publish : $('#wish_book_publish').val(),
				wish_book_category : $('#wish_book_category').val()
			},
			datatype:"JSON",
			success : function(data) {
				if (data == "success") {
					showMessage('희망도서 신청 성공',1000);
					setTimeout(function(){
						location.href="/main/main.do";
					},1000);
					
				}else {
					showMessage('희망도서 신청에 실패했습니다.');					
				}
			}
		});
	}
	</script>
</head>
<body>
<center>
<h3>희망도서 신청</h3>
<form>
	<table class="table" style="width:0%;">
		<tr>
			<th width="20%">책제목</th>
			<td><input name="book_name" id="wish_book_name" size="30">
			<input type="hidden" name="id" id="wish_book_id" value="<%=session.getAttribute("id") %>"/></td>
		</tr>
		<tr>
			<th width="20%">저자</td>
			<td><input name="book_author" id="wish_book_author" size="30"></td>
		</tr>
		<tr>
			<th width="20%">출판사</th>
			<td><input name="book_publish" id="wish_book_publish" size="30"></td>
		</tr>
		<tr>
			<th width="20%">카테고리</th>
			<td><input name="book_category" id="wish_book_category" size="30"></td>
		</tr>
		<tr>
			<td colspan="2" style="text-align:center;">
				<input class="btn btn-primary" type="button" value="작성" onclick="javascript:add_wishbook();">
				<input class="btn btn-primary" type="button" value="취소" onclick="javascript:history.back();">
			</td> 
		</tr>
	</table>
</form>
</center>
</body>
</html>