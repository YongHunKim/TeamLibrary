<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<table>
	<tr>
		<th width="10%">번호</th>
		<th width="60%">제목</th>
		<th width="10%">글쓴이</th>
		<th width="10%">일자</th>
		<th width="10%">조회</th>
	</tr>
		<c:choose>
		<c:when test="">
			<c:forEach var="vo" items="${list}">
			<tr>
				<td width="10%">${vo.no}</td>
				<td width="60%">${vo.subject}</td>
				<td width="10%">${vo.name}</td>
				<td width="10%"><fmt:formatDate value="${vo.regdate }" pattern="yyyy-MM-dd"/></td>				
				<td width="10%">${vo.hit}</td>				
			</tr>
			</c:forEach>
		</c:when>
		<c:otherwise>
			<tr>
				<td colspan="5" align="center" valign="top">
					등록된 글이 없습니다.
				</td>
			</tr>
		</c:otherwise>
		</c:choose>
	</table>
	<table class="button_table" width="100%">
		<tr>
			<td id="right_td" style="text-align: center;">
				<c:forEach var="i" begin="${fromPage}" end="${toPage}">
				[
				<%-- <c:if test="${curPage == i}">
					<font color="red">
						${i}
					</font>
				</c:if>
				<c:if tst="${curPage != i}">
					<a href="#">${i}</a>
				</c:if> --%>
				]
				</c:forEach>
				
				&nbsp;
				${curPage}page / ${totalPage}pages
			</td>
		</tr>
	</table>
</body>
</html>