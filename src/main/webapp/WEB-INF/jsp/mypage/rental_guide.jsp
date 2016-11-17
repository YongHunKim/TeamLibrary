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
	<p style="font-size: 2.2em">���⳻��</p>
	<table border="1" class="table" style="margin-top: 30px;">
		<tr>
			<th width="10%" align="center">�����ڵ�</th>
			<th width="50%" align="left">������</th>
			<th width="10%" align="center">����</th>
			<th width="10%" align="center">������</th>
			<th width="10%" align="center">�ݳ���</th>
			<th width="10%" align="center">������</th>
		</tr>
		<c:forEach var="vo"  items="${rental}" >
			<tr>
				<td width="10%" align="center">${vo.book_code}</td>
				<td width="50%" align="left">${vo.book_name}</td>
				<td width="10%" align="center">${vo.book_author}</td>
				<td width="10%" align="center"><fmt:formatDate value="${vo.rent_date}" pattern="yyyy-MM-dd"/></td>
				<td width="10%" align="center"><fmt:formatDate value="${vo.return_date}" pattern="yyyy-MM-dd"/></td>
				<td width="10%" align="center"><fmt:formatDate value="${vo.reserve_date}" pattern="yyyy-MM-dd"/></td>
				<%-- <td>
					<c:choose>
						<c:when test="${vo.rent_yn == 'y' }">
						���⿬��Ұ���
						</c:when>
						<c:otherwise>
							���⿬�尡��
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${vo.rent_yn == 'y' }">
						�ݳ�
						</c:when>
						<c:otherwise>
						
						</c:otherwise>
					</c:choose>
				</td> --%>
				
			</tr>
		</c:forEach>
	</table>

</body>
</html>