<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>Insert title here</title>
	<script type="text/javascript">
	function reserveCancel(book_code){
		//showMessage(book_code);
		
		$.ajax({
			url : '/rent/reserveCancel.do',
			type : 'post',
			data : {
				"book_code" : book_code,
			},
			datatype:"JSON",
			success : function(data) {				
				if (data == "success") {
					showMessage("예약취소에 성공했습니다.");
					setTimeout(function(){
						location.reload();
					},1000);
				} else {
					showMessage("예약취소에 실패했습니다.");
				}
			}
		});
	}
	</script>
</head>
<body>
<center>
<h3>예약 내역</h3>
<c:choose>
	<c:when test="${reserveList.size()>0 }">
	<div style="text-align:right;"><span>총 대출 내역 : ${totalRow}</span></div>
		<form>
		<table class="table">
			<tr>		
				<th width="15%">도서코드</th>
				<th width="30%">도서명</th>
				<th width="20%">저자</th>
				<th width="10%">예약일</th>
				<th width="15%">취소</th>
			</tr>
			<c:forEach var="i" begin="0" end="${reserveList.size()-1 }">
			<tr>
				<td>${reserveList.get(i).book_code }</td>
				<td>${reserveList.get(i).book_name }</td>
				<td>${reserveList.get(i).book_author }</td>
				<td><fmt:formatDate value="${reserveList.get(i).reserve_date }" pattern="yyyy-MM-dd" /></td>
				<td><input type="button" class="btn btn-disabled" value="예약취소" onclick="javasciprt:reserveCancel(${reserveList.get(i).book_code})"/>
				</td>
			</tr>	
			</c:forEach>	
		</table>
		</form>
		
		 <div>			
				<table class="button_table" width="100%">
						<tr>
							<td id="right_td" style="text-align:center;">
							<!-- 
								[1][2][3][4][5][6]
								fp			tp	
							 -->
						 	<a href="/rent/rent.do?page=1">
						 		<img src="/images/begin.gif">
						 	</a>
						 	<!-- 기본적으로는 5페이지 단위로 페이지 이동, 처음 블록과 마지막 블록에서만 1페이지씩 이동 -->
							<c:if test="${curPage>block }">
								<a href="/rent/rent.do?page=${fromPage-1}">
									<img src="/images/prev.gif">				 		
							 	</a>
							</c:if>	
							<c:if test="${curPage<block }">
								<a href="/rent/rent.do?page=${curPage>1 ? curPage-1 : 1 }">
									<img src="/images/prev.gif">				 		
							 	</a>
							</c:if>
							<c:forEach var="i" begin="${fromPage }" end="${toPage }">
							 	[
								<c:if test="${curPage==i }">
									<font color="red">
										${i }
									</font>				 	
							 	</c:if>
							 	<c:if test="${curPage!=i }">
							 		<a href="/rent/rent.do?page=${i }">
							 			${i }
							 		</a>
							 	</c:if>	
							 	]
							</c:forEach>
							<c:if test="${toPage<totalPage }">
								<a href="/rent/rent.do?page=${toPage+1 }">
									<img src="/images/next.gif">				 		
							 	</a>
							</c:if>
							<c:if test="${toPage>=totalPage }">
								<a href="/rent/rent.do?page=${curPage<totalPage ? curPage+1 : totalPage }">
									<img src="/images/next.gif">				 		
							 	</a>
							</c:if>
							<a href="/rent/rent.do?page=${totalPage }">
						 		<img src="/images/end.gif">
						 	</a>
						 	&nbsp;
						 	${curPage }page / ${totalPage }pages 
							</td>
						</tr>
					</table>
					</div>	

	</c:when>
	<c:otherwise>
	예약내역이 없습니다.
	</c:otherwise>
</c:choose>
</center>
</body>
</html>