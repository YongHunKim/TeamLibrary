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
	<h3>���뺸��</h3>
  	<table id="table_content">
	<tr id="contenttr">
			<th width="21%">��ȣ</th>
			<td width="47%" align="left">${vo.nt_no }</td>
			
			<th width="21%">�ۼ��� </th>
			<td width="47%" align="center"><fmt:formatDate value="${vo.nt_regdate }" pattern="yyyy-MM-dd"/></td>
			</tr>
			
		
			<th width="21%">���̵�</th>
			<td width="47%" align="left">${vo.id }</td>
			
			<th width="21%">��ȸ��</th>
			<td width="47%" align="center">${vo.nt_hit }</td>
			</tr>
			
	
			<th width="21%">����</th>
			<td width="47%" style="text-align: left;" colspan="3" valign="top">${vo.nt_subject} </td>
			</tr> 
			
		
			<th width="21%">����</th>
			<td style="text-align: left;" colspan="4" height="250" valign="top">${vo.nt_content} </td>
			</tr>
			
			
			
		<%-- 	<c:if test="${vo.filecount !=0 }">
				<tr>
					<th width="21%">÷������</th>
					<td colspan="5" align="center">
						<c:forEach var="fname" items="${vo.nt_addfile }">
							<a href="download.do?fn=${fname }">${fname }</a>&nbsp;
						</c:forEach>
					</td>
				</tr>
			
			</c:if> 
				 --%>
			
			
			</table>
			&nbsp;
			&nbsp;
			<table id="under_btn" width="700">
			<tr>
				 <td align="right"> 
					<a href="/notice/update.do?nt_no=${vo.nt_no }&page=${curpage}"><button type="button" class="btn btn-success">����</button></a>&nbsp;
					<a href="/notice/delete.do?nt_no=${vo.nt_no }"><button type="button" class="btn btn-success">����</button></a>&nbsp;
					<a href="/notice/list.do?page=${curpage}"><button type="submit" class="btn btn-success">���</button></a>&nbsp;
				</td>
			</tr> 
		</table> 

	</center>
</body>
</html>