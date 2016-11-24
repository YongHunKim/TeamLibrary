<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<table class="table">
		<tr>
			<th colspan="3" style="text-align: center;">한줄평</th>
		</tr>
		<tr>
			<th width="30%">책제목</th>
			<th width="20%">저자</th>
			<th width="50%">내용</th>
		</tr>
		<c:choose>
			<c:when test="${rec.size() > 0}">
				<c:forEach var="vo" items="${rec}">
					<tr>
						<td width="30%">${vo.book_name}</td>
						<td width="20%">${vo.book_author }</td>
						<td width="50%">${vo.book_recommend_subject }</td>
					</tr>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<tr>
					<td colspan="3" align="center" valign="top">등록된 한줄평이 없습니다.</td>
				</tr>
			</c:otherwise>
		</c:choose>
	</table>
	<table class="button_table" width="100%">
		<tr>
						<td id="right_td" style="text-align:center;">
						<!-- 
							[1][2][3][4][5][6]
							fp			tp	
						 -->
					 	<a href="/mypage/rec_select.do?page=1&id=${id}">
					 		<img src="<%=application.getContextPath() %>/images/begin.gif">
					 	</a>
					 	<!-- 기본적으로는 5페이지 단위로 페이지 이동, 처음 블록과 마지막 블록에서만 1페이지씩 이동 -->
						<c:if test="${curPage>block }">
							<a href="/mypage/rec_select.do?page=${fromPage-1}&id=${id}">
								<img src="<%=application.getContextPath() %>/images/prev.gif">				 		
						 	</a>
						</c:if>	
						<c:if test="${curPage<block }">
							<a href="/mypage/rec_select.do?page=${curPage>1 ? curPage-1 : 1 }&id=${id}">
								<img src="<%=application.getContextPath() %>/images/prev.gif">				 		
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
						 		<a href="/mypage/rec_select.do?page=${i }&id=${id}">
						 			${i }
						 		</a>
						 	</c:if>	
						 	]
						</c:forEach>
						<c:if test="${toPage<totalPage }">
							<a href="/mypage/rec_select.do?page=${toPage+1 }&id=${id}">
								<img src="<%=application.getContextPath() %>/images/next.gif">				 		
						 	</a>
						</c:if>
						<c:if test="${toPage>=totalPage }">
							<a href="/mypage/rec_select.do?page=${curPage<totalPage ? curPage+1 : totalPage }&id=${id}">
								<img src="<%=application.getContextPath() %>/images/next.gif">				 		
						 	</a>
						</c:if>
						<a href="/mypage/rec_select.do?page=${totalPage }&id=${id}">
					 		<img src="<%=application.getContextPath() %>/images/end.gif">
					 	</a>
					 	&nbsp;
					 	${curPage }page / ${totalPage }pages 
						</td>
					</tr>
	</table>

</body>
</html>