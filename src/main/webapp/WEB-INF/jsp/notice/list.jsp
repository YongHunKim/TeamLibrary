<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String[] options = {"아이디","제목","내용"};
%>



<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/css/table.css">
</head>
<body>
	<center>
		<h3>공지사항</h3>
		<table border="0" width="700">
			<tr>
				<td align="left">
					<a href="/notice/insert.do">글쓰기</a>
				</td>
			</tr>
		</table>
		<table id="table_content" width="700" > 
			<tr>
				<th width="10%">번호</th>
				<th width="45%">제목</th>
				<th width="15%">아이디</th>
				<th width="20%">작성일</th>
				<th width="10%">조회수</th>
			</tr>
		
		<c:forEach var="vo" items="${list }">
			<tr id="dataTr">
				<td width="10%" align="center">${vo.nt_no }</td>
				<td width="45%" align="center"><a href="/notice/content.do?nt_no=${vo.nt_no }">${vo.nt_subject }</a></td>
				<td width="15%" align="center">${vo.id }</td>
				<td width="20%" align="center">
					<fmt:formatDate value="${vo.nt_regdate }" pattern="yyyy-MM-dd"/>
				</td>
				<td width="10%" align="center">${vo.nt_hit }</td>
			</tr>
		</c:forEach>
			</table>
		
			
		<table border="0" width="700">
			<tr>
				<td align="right">
				<a href="list.do?page=${curpage>1?curpage-1:curpage }">이전</a>&nbsp;
				<a href="list.do?page=${curpage<totalpage?curpage+1:curpage }">다음</a>&nbsp;&nbsp;
				${curpage }page /${totalpage }pages
				</td> 
			</tr>
				<td width="50%">
				<form action="list.do" method="post" name="frm">
				<c:set var="na" value="<%=options %>">
				</c:set>
				<select name="fs" id="fs">						
						<!-- <option value="name">글쓴이</option>
						<option value="subject">제목</option>
						<option value="content">내용</option> -->						
						<c:forEach var="name" items="${na }">
							<c:if test="${name==ss }">
							<option value="${name}" selected>
							${name }														
							</option>
							</c:if>
							<c:if test="${name!=ss }">
							<option value="${name}">
							${name }														
							</option>
							</c:if>
						</c:forEach>
					</select>
					<input type="text" name="ss" value="${(ss==null)?'':ss }">
					<input type="hidden" name="type" value=${type } />
					<input type="submit" value="검색">
				</form>
				</td>
			<tr>
		</tr>
		</table>
	</center>
</body>
</html>