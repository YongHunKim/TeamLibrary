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
		function insert_rec(){
			$.ajax({
				url : '/book/recInsert.do',
				type : 'post',
				data : {
					"id" : $('#rec_id').val(),
					"book_code" : $('#rec_book_code').val(),
					"book_recommend_subject" : $('#rec_subject').val()
				},
				datatype:"JSON",
				success : function(data) {
					if (data == "success") {
						showMessage('한줄평 입력 성공',1000);
						setTimeout(function(){
							location.href="/book/detail.do?book_code=${vo.book_code}&curPage=${curPage}&searchWord=${searchWord}";
						},1000);
						
					} else if(data="session_null"){
						showMessage('로그인 후 이용해주세요.',1000);
						setTimeout(function(){
							location.href="/main/main.do";
						},1000);
					}else {
						showMessage('한줄평 입력에 실패했습니다.');					
					}
				}
			});
		}		
		
		function rec_modify(i){
			var text = $('#get_subject'+i).html();
			$('#get_subject'+i).html("<input type='text' value='"+text+"' id='mod_subject"+i+"' size='40'>");
			$('#rec_modify_btn'+i).attr("src","/images/btn_confirm.gif");
			$('#rec_modify_btn'+i).attr("onclick","javascript:rec_modify_ok("+i+");")
		}
		
		function rec_modify_ok(i){
			$.ajax({
				url : '/book/recModify.do',
				type : 'post',
				data : {
					"id" : $('#book_recommend_id'+i).val(),
					"book_code" : $('#rec_book_code').val(),
					"book_recommend_code" : $('#book_recommend_code'+i).val(),
					"book_recommend_subject" : $('#mod_subject'+i).val()
				},
				datatype:"JSON",
				success : function(data) {
					if (data == "success") {
						showMessage('한줄평 수정 성공',1000);
						setTimeout(function(){
							location.href="/book/detail.do?book_code=${vo.book_code}&curPage=${curPage}&searchWord=${searchWord}";
						},1000);
						
					} else {
						showMessage('한줄평 수정에 실패했습니다.');					
					}
				}
			}); 
		}
		
		function rec_delete(i){
			$.ajax({
				url : '/book/recDelete.do',
				type : 'post',
				data : {
					"id" : $('#book_recommend_id'+i).val(),
					"book_code" : $('#rec_book_code').val(),
					"book_recommend_code" : $('#book_recommend_code'+i).val()					
				},
				datatype:"JSON",
				success : function(data) {
					if (data == "success") {
						showMessage('한줄평 삭제 성공',1000);
						setTimeout(function(){
							location.href="/book/detail.do?book_code=${vo.book_code}&curPage=${curPage}&searchWord=${searchWord}";
						},1000);
						
					} else {
						showMessage('한줄평 삭제에 실패했습니다.');					
					}
				}
			}); 
		}
		
		function cancel(i){
			var origin_text = $('#origin_text'+i).val();
			$('#get_subject'+i).html(origin_text);
			$('#rec_modify_btn'+i).attr("src","/images/btn_modify.gif");
			$('#rec_modify_btn'+i).attr("onclick","javascript:rec_modify("+i+");")
		}
	</script>
</head>
<body>
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
	</table>
	<div style="text-align:right;">
		<a href="/search/search_ok.do?page=${curPage}&searchWord=${searchWord}"><img src="/images/btn_list.gif"></a>
	</div>
	<c:if test="${reclist.size()>0 }">
	<table class="table">
		<tr><th colspan="2" style="text-align:center;">한줄평</th></tr>		
		<tr>
			<th width="20%">아이디</th>
			<th width="80%">내용</th>
		</tr>
		<c:forEach var="i" begin="0" end="${reclist.size()-1 }">
			<tr>				
				<td width="20%">${reclist.get(i).id }
					<input type="hidden" id="book_recommend_code${i}" value="${reclist.get(i).book_recommend_code}">
					<input type="hidden" id="book_recommend_id${i}" value="${reclist.get(i).id}">
				</td>
				<td width="80%"><span id="get_subject${i}">${reclist.get(i).book_recommend_subject }</span>				
					<c:set var="sessionid">
						<%=session.getAttribute("id") %>
					</c:set>					
					<c:if test="${reclist.get(i).id == sessionid}">
					<span style="margin-left: 30px;">
						<img id="rec_modify_btn${i}" src="/images/btn_modify.gif" onclick="javascript:rec_modify(${i});">
						<input type="hidden" id="origin_text${i}" value="${reclist.get(i).book_recommend_subject}">
						<img src="/images/btn_delete.gif" onclick="javascript:rec_delete(${i});">
						<img src="/images/btn_cancel.gif" onclick="javascript:cancel(${i});">
					</span>
					</c:if>				
				</td>				
			</tr>
		</c:forEach>
	</table>
	</c:if>
	<form id="rec_form" name="rec_form" method="post" action="/book/recInsert.do">	
		<!-- 한줄평 리스트 아이디 : 내용 (수정)(삭제) -->
		<table class="table">
			<tr>
				<td width="20%" style="text-align: right; vertical-align: middle;">한줄평</td>				
				<td width="60%"  style="vertical-align: middle;"><input type="text" name="rec_subject" id="rec_subject" size="100">
				<input type="hidden" name="rec_id" id="rec_id" value="<%=session.getAttribute("id") %>" >
				<input type="hidden" name="rec_book_code" id="rec_book_code" value="${vo.book_code }">				
				</td>
				<td><input type="button" class="btn btn-primary" value="작성" onclick="javascript:insert_rec();"></td>
			</tr>
		</table>
	</form>
</body>
</html>