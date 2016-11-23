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
	<p style="font-size: 2.2em">대출내역</p>
	<c:choose>
		<c:when test="${rental.size() > 0 }">
			<table border="1" class="table" style="margin-top: 30px;">
				<tr>
					<th colspan="6" style="text-align: center;">대출내역</th>
				</tr>
				<tr>
					<th width="10%" align="center">도서코드</th>
					<th width="50%" align="left">도서명</th>
					<th width="10%" align="center">저자</th>
					<th width="10%" align="center">대출일</th>
					<th width="10%" align="center">반납일</th>
					<th width="10%" align="center">예약일</th>
				</tr>
				<c:forEach var="vo" items="${rental}">
					<tr>
						<td width="10%" align="center">${vo.book_code}</td>
						<td width="50%" align="left">${vo.book_name}</td>
						<td width="10%" align="center">${vo.book_author}</td>
						<td width="10%" align="center"><fmt:formatDate
								value="${vo.rent_date}" pattern="yyyy-MM-dd" /></td>
						<td width="10%" align="center"><fmt:formatDate
								value="${vo.return_date}" pattern="yyyy-MM-dd" /></td>
						<td width="10%" align="center"><fmt:formatDate
								value="${vo.reserve_date}" pattern="yyyy-MM-dd" /></td>
						<%-- <td>
					<c:choose>
						<c:when test="${vo.rent_yn == 'y' }">
						대출연장불가능
						</c:when>
						<c:otherwise>
							대출연장가능
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${vo.rent_yn == 'y' }">
						반납
						</c:when>
						<c:otherwise>
						
						</c:otherwise>
					</c:choose>
				</td> --%>

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
								href="/mypage/rental_guide.do?page=1&id=${id }">
									<img src="<%=application.getContextPath()%>/images/begin.gif">
							</a> <!-- 기본적으로는 5페이지 단위로 페이지 이동, 처음 블록과 마지막 블록에서만 1페이지씩 이동 --> <c:if
									test="${curPage>block }">
									<a
										href="/mypage/rental_guide.do?page=${fromPage-1}&id=${id }">
										<img src="<%=application.getContextPath()%>/images/prev.gif">
									</a>
								</c:if> <c:if test="${curPage<block }">
									<a
										href="/mypage/rental_guide.do?page=${curPage>1 ? curPage-1 : 1 }&id=${id }">
										<img src="<%=application.getContextPath()%>/images/prev.gif">
									</a>
								</c:if> <c:forEach var="i" begin="${fromPage }" end="${toPage }">
						 	[
							<c:if test="${curPage==i }">
										<font color="red"> ${i } </font>
									</c:if>
									<c:if test="${curPage!=i }">
										<a
											href="/mypage/rental_guide.do?page=${i }&id=${id }">
											${i } </a>
									</c:if>	
						 	]
						</c:forEach> <c:if test="${toPage<totalPage }">
									<a
										href="/mypage/rental_guide.do?page=${toPage+1 }&id=${id }">
										<img src="<%=application.getContextPath()%>/images/next.gif">
									</a>
								</c:if> <c:if test="${toPage>=totalPage }">
									<a
										href="/mypage/rental_guide.do?page=${curPage<totalPage ? curPage+1 : totalPage }&id=${id }">
										<img src="<%=application.getContextPath()%>/images/next.gif">
									</a>
								</c:if> <a
								href="/mypage/rental_guide.do?page=${totalPage }&id=${id }">
									<img src="<%=application.getContextPath()%>/images/end.gif">
							</a> &nbsp; ${curPage }page / ${totalPage }pages
							</td>
						</tr>
					</table>
				</div>
			</div>
		</c:when>
		<c:otherwise>
			<div class="noresult" style="margin-top: 50px;">대출한 내역이 없습니다</div>
		</c:otherwise>
	</c:choose>
</body>
</html>