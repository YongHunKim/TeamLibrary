<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/notice/table.css">
</head>
<body>
	<center>
	<h3>내용보기</h3>
  	<table id="table_content">
	<tr>
			<th width="21%">번호</th>
			<td width="47%" align="center">${vo.nt_no }</td>
			
			<th width="21%">작성일 </th>
			<td width="47%" align="center"><fmt:formatDate value="${vo.nt_regdate }" pattern="yyyy-MM-dd"/></td>
			</tr>
			
		
			<th width="21%">아이디</th>
			<td width="47%" align="center">${vo.id }</td>
			
			<th width="21%">조회수</th>
			<td width="47%" align="center">${vo.nt_hit }</td>
			</tr>
			
	
			<th width="21%">제목</th>
			<td width="47%" align="center" colspan="3">${vo.nt_subject} </td>
			</tr> 
			
		
			<th width="21%">내용</th>
			<td align="center" colspan="4" height="250">${vo.nt_content} </td>
			</tr>
			
			
			<%-- <tr>
				<td colspan="4" valign="top" align="left" height="200">
					<pre>${vo.nt_content }</pre>
				</td>
			</tr>
			 --%>
			
			</table>
			
			<table id="under_btn" width="700">
			<tr>
				 <td align="right"> 
					<a href="/notice/update.do?nt_no=${vo.nt_no }">수정 </a>&nbsp;
					<a href="/notice/delete.do?nt_no=${vo.nt_no }">삭제 </a>&nbsp;
					<a href="list.do">목록</a>&nbsp;
				</td>
			</tr> 
		</table> 

	</center>
</body>
</html>