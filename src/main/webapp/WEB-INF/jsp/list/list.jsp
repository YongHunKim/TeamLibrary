<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/csslist/table.css">
</head>
<body>
	<center>
		<h3>분실물Q&A</h3>
		<hr>
		<table border="0" width="960">
			<tr>
				<td align="left">
					<a href="insert.do"><img src="/imagelist/btn_write.gif" border="0"></a>
				</td>
				<td><a href="/main/main.do">메인</a></td>
			</tr>
		</table>
		<table id="table_content" width="960">
			<tr>
				<th width="10%">번호</th>
				<th width="45%">제목</th>
				<th width="15%">이름</th>
				<th width="20%">작성일</th>
				<th width="10%">조회수</th>
			</tr>
			<c:forEach var="vo" items="${list}">
				<tr class="dataTr">
					<td width="10%" class="tdcenter">${vo.lb_no}</td>
			<%-- 		<td width="45%" class="tdleft">
						 <c:if test="${vo.lb_group_tab>0}">
						 	<c:forEach var="i" begin="1" end="${vo.lb_group_tab}">
						 		&nbsp;&nbsp;
						 	</c:forEach>
						 	<img src="/imagelist/icon_reply.gif">
						 </c:if>
					</td> --%>
					<td width="45%" class="tdcenter"><a href="/list/content.do?lb_no=${vo.lb_no }">${vo.lb_subject}</a></td>
					<td width="15%" class="tdcenter">${vo.id}</td>
					<td width="20%" class="tdcenter">
					<fmt:formatDate value="${vo.lb_regdate}" pattern="yyyy-MM-dd"/>
					</td>
					<td width="10%" class="tdcenter">${vo.lb_hit}</td>
				</tr>
			</c:forEach>
		</table>
		<table border="0" width="960">
			<tr>
				<td align="right">
					 <c:if test="${curPage > block}">
					 	<a href="list.do?page=1">
					 		<img src="/imagelist/begin.gif" border="0">
					 	</a>&nbsp;
					 	<a href="list.do?page=${fromPage-1}">
					 		<img src="/imagelist/prev.gif" border="0">
					 	</a>
					 </c:if>
					 <c:if test="${curPage <= block}">
					 	<a href="list.do?page=1">
					 		<img src="/imagelist/begin.gif" border="0">
					 	</a>&nbsp;
					 	<a href="list.do?page=${curPage>1?curPage-1:curPage}">
					 		<img src="/imagelist/prev.gif" border="0">
					 	</a>
					 </c:if>
					 
					 <c:forEach var="i" begin="${fromPage}" end="${toPage}">
					 	&nbsp;[
					 	<c:if test="${curPage == i}">
					 		<span style="color:red">${i}</span>
					 	</c:if>
					 	<c:if test="${curPage != i}">
					 		<a href="list.do?page=${i}">${i}</a>
					 	</c:if>
					 	]&nbsp;
					 </c:forEach>
					 
					 <c:if test="${toPage >= totalPage}">
					 	<a href="list.do?page=${curPage<totalPage?curPage+1:curPage}">
					 		<img src="/imagelist/next.gif" border="0">
					 	</a>&nbsp;
					 	<a href="list.do?page=${totalPage}">
					 		<img src="/imagelist/end.gif" border="0">
					 	</a>
					 </c:if>
					 <c:if test="${toPage < totalPage}">
					 	<a href="list.do?page=${toPage+1}">
					 		<img src="/imagelist/next.gif" border="0">
					 	</a>&nbsp;
					 	<a href="list.do?page=${totalPage}">
					 		<img src="/imagelist/end.gif" border="0">
					 	</a>
					 </c:if>
					 &nbsp;&nbsp;
					 ${curPage} page / ${totalPage} pages
				</td>
			</tr>
		</table>
	</center>
</body>
</html>