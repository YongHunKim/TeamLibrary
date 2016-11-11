<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/css/table.css">
</head>
<body>
	<center>
	<h3>���뺸��</h3>
  	<table id="table_content">
	<tr>
			<th width="20%">��ȣ</th>
			<td width="45%" align="center">${vo.nt_no }</td>
			
			<th width="20%">�ۼ��� </th>
			<td width="45%" align="center"><fmt:formatDate value="${vo.nt_regdate }" pattern="yyyy-MM-dd"/></td>
			</tr>
			
		
			<th width="20%">���̵�</th>
			<td width="45%" align="center">${vo.id }</td>
			
			<th width="20%">��ȸ��</th>
			<td width="45%" align="center">${vo.nt_hit }</td>
			</tr>
			
	
			<th width="20%">����</th>
			<td width="45%" align="center">${vo.nt_subject} </td>
			</tr> 
			
		
			<th width="20%">����</th>
			<td width="45%"  align="center">${vo.nt_content} </td>
			</tr>
			
			
			<%-- <tr>
				<td colspan="4" valign="top" align="left" height="200">
					<pre>${vo.nt_content }</pre>
				</td>
			</tr>
			 --%>
			
			</table>
			
			<table id="table_content" width="700">
			<tr>
				<td align="right">
					<a href="/notice/update.do?nt_no=${vo.nt_no }">���� </a>&nbsp;
					<a href="/notice/delete.do?nt_no=${vo.nt_no }">���� </a>&nbsp;
					<a href="list.do">���</a>&nbsp;
				</td>
			</tr> 
		</table> 

	</center>
</body>
</html>