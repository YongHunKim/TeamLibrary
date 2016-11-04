<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/csslist/table.css">
</head>
<body>
	<center>
		<h3>내용보기</h3>
		<table id="table_content" width="700">
		
			<tr>
				<th width="20%">번호</th>
				<td width="30%" align="center">${vo.lb_no }</td>
				<th width="20%">작성일</th>
				<td width="30%" align="center">
					<fmt:formatDate value="${vo.lb_regdate }" pattern="yyyy-MM-dd"/>
				</td>
			</tr>
			
			<tr>
				<th width="20%">이름</th>
				<td width="30%" align="center">${vo.id }</td>
				<th width="20%">조회수</th>
				<td width="30%" align="center">${vo.lb_hit }</td>
			</tr>
			
			<tr>
				<th width="20%">제목</th>
				<td colspan="3">${vo.lb_subject }</td>
			</tr>
					
			<tr>
				<td colspan="4" valign="top" align="left" height="200">
					<pre>${vo.lb_content }</pre>
				</td>
			</tr>
			
			<table id="table_content" width="700">
				<tr>
					<td align="right">
						<a href="update.do?no=${vo.lb_no }">수정</a>&nbsp;
						<a href="delete.do?no=${vo.lb_no }">삭제</a>&nbsp;
						<a href="list.do">목록</a>&nbsp;
					</td>
				</tr>
			</table>
		</table>
	</center>
</body>
</html>