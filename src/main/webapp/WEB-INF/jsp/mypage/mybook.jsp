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
	<table>
		<tr>
			<th width="10%">ī�װ�</th>
			<th width="20%">�׸�</th>
			<th width="30%">����</th>
			<th width="10%">����</th>
			<th width="10%">���ǻ�</th>
			<!-- 		<th width="10%">�뿩����</th>
		<th width="10%">�������</th> -->
		</tr>
		<%-- 		<c:choose>
		<c:when test=""> --%>
		<c:forEach var="vo" items="${list}">
			<tr>
				<td width="10%"><input type="hidden" value="${vo.book_code}" />
					<input type="hidden" value="${id}" /> ${vo.book_category}</td>
				<td width="20%">${vo.book_image }</td>
				<td width="30%">${vo.book_name}</td>
				<td width="10%">${vo.book_author}</td>
				<td width="10%">${vo.book_publish}</td>
				<%-- 				<td width="10%">${vo.rent_yn}</td>
				<td width="10%">${vo.reserve_yn}</td>	 --%>
			</tr>
		</c:forEach>
		<%--  		</c:when>
		<c:otherwise> 
			<tr>
				<td colspan="5" align="center" valign="top">
					��ϵ� ���� �����ϴ�.
				</td>
			</tr>
		</c:otherwise>
		</c:choose> --%>
	</table>
	<table class="button_table" width="100%">
		<tr>
			<td id="right_td" style="text-align: center;"><a
				href="/mypage/mybook.do?page=1&id=${id}"> <img
					src="<%=application.getContextPath()%>/images/begin.gif">
			</a> <!-- �⺻�����δ� 5������ ������ ������ �̵�, ó�� ��ϰ� ������ ��Ͽ����� 1�������� �̵� --> <c:if
					test="${curPage > block }">
					<a href="/mypage/mybook.do?page=${fromPage-1}&id=${id}"> <img
						src="<%=application.getContextPath()%>/images/prev.gif">
					</a>
				</c:if> <c:if test="${curPage<block }">
					<a
						href="/mypage/mybook.do?page=${curPage>1 ? curPage-1 : 1 }&id=${id}">
						<img src="<%=application.getContextPath()%>/images/prev.gif">
					</a>
				</c:if> <c:forEach var="i" begin="${fromPage}" end="${toPage}">
				[
				<c:if test="${curPage == i}">
						<font color="red"> ${i} </font>
					</c:if>
					<c:if test="${curPage != i}">
						<a href="/mypage/mybook.do?page=${i}&id=${id}">${i}</a>
					</c:if>
				]
				</c:forEach> <c:if test="${toPage<totalPage }">
					<a href="/mypage/mybook.do?page=${toPage+1 }&id=${id}"> <img
						src="<%=application.getContextPath()%>/images/next.gif">
					</a>
				</c:if> <c:if test="${toPage>=totalPage }">
					<a
						href="/mypage/mybook.do?page=${curPage<totalPage ? curPage+1 : totalPage }&id=${id}">
						<img src="<%=application.getContextPath()%>/images/next.gif">
					</a>
				</c:if> <a href="/mypage/mybook.do?page=${totalPage }&id=${id}"> <img
					src="<%=application.getContextPath()%>/images/end.gif">
			</a> &nbsp; ${curPage}page / <c:choose>
					<c:when test="${totalPage == 1}">${totalPage}</c:when>
					<c:otherwise>${totalPage + 1 }</c:otherwise>
				</c:choose>pages</td>
		</tr>
	</table>
</body>
</html>