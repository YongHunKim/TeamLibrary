<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<p style="font-size: 2.2em">예약내역</p>
	<c:choose>
		<c:when test="${reservation.size() > 0}">
			<table border="1" class="table" style="margin-top: 30px;">
			<tr>
				<th colspan="5" style="text-align: center;">예약내역</th>
			</tr>
				<tr>
					<th width="10%" align="center">도서코드</th>
					<th width="60%" align="left">도서명</th>
					<th width="10%" align="center">저자</th>
					<th width="10%" align="center">예약일</th>
					<th width="10%" align="center">반납일</th>
				</tr>
				<c:forEach var="vo" items="${reservation}">
					<tr>
						<td width="10%" align="center">${vo.book_code}</td>
						<td width="60%" align="left">${vo.book_name}</td>
						<td width="10%" align="center">${vo.book_author}</td>
						<td width="10%" align="center"><fmt:formatDate
								value="${vo.reserve_date }" pattern="yyyy-MM-dd" /></td>
						<td width="10%" align="center"><fmt:formatDate
								value="${vo.return_date}" /></td>

					</tr>
				</c:forEach>
			</table>
				<div>
					<table class="button_table" width="100%">
						<tr>
							<td id="right_td" style="text-align: center;">
								<!-- 
							[1][2][3][4][5][6]
							fp			tp	
						 --> <a
								href="/mypage/reserve_guide.do?page=1&id=${id}">
									<img src="<%=application.getContextPath()%>/images/begin.gif">
							</a> <!-- 기본적으로는 5페이지 단위로 페이지 이동, 처음 블록과 마지막 블록에서만 1페이지씩 이동 --> <c:if
									test="${curPage>block }">
									<a
										href="/mypage/reserve_guide.do?page=${fromPage-1}&id=${id}">
										<img src="<%=application.getContextPath()%>/images/prev.gif">
									</a>
								</c:if> <c:if test="${curPage<block }">
									<a
										href="/mypage/reserve_guide.do?page=${curPage>1 ? curPage-1 : 1 }&id=${id}">
										<img src="<%=application.getContextPath()%>/images/prev.gif">
									</a>
								</c:if> <c:forEach var="i" begin="${fromPage }" end="${toPage }">
						 	[
							<c:if test="${curPage==i }">
										<font color="red"> ${i } </font>
									</c:if>
									<c:if test="${curPage!=i }">
										<a
											href="/mypage/reserve_guide.do?page=${i }&id=${id}">
											${i } </a>
									</c:if>	
						 	]
						</c:forEach> <c:if test="${toPage<totalPage }">
									<a
										href="/mypage/reserve_guide.do?page=${toPage+1 }&id=${id}">
										<img src="<%=application.getContextPath()%>/images/next.gif">
									</a>
								</c:if> <c:if test="${toPage>=totalPage }">
									<a
										href="/mypage/reserve_guide.do?page=${curPage<totalPage ? curPage+1 : totalPage }&id=${id}">
										<img src="<%=application.getContextPath()%>/images/next.gif">
									</a>
								</c:if> <a
								href="/mypage/reserve_guide.do?page=${totalPage }&id=${id}">
									<img src="<%=application.getContextPath()%>/images/end.gif">
							</a> &nbsp; ${curPage }page / ${totalPage }pages
							</td>
						</tr>
					</table>
				</div>
			</div>
		</c:when>
		<c:otherwise>
			<div class="noresult" style="margin-top: 50px;">예약한 내역이 없습니다</div>
		</c:otherwise>
	</c:choose>
</body>
</html>