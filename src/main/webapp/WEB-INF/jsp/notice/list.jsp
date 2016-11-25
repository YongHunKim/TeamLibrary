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
		&nbsp;&nbsp;
		<h3>공지사항</h3>
		<table border="0" width="700" id="crud">
				<c:set var="sessionid">
					<%=session.getAttribute("id") %>
				</c:set>
				
			<tr>
				<td align="left">
				<c:if test="${sessionid=='admin' }"> 
					<a href="/notice/insert.do?type=${type }" type="button" class="btn btn-default">글쓰기</a>
				</c:if>	
				</td>
				 <td align=right> 
				 총  ${totalRow } 건 
				 </td>
			</tr> 
		</table>
			&nbsp;
			&nbsp;

		
		<table id="table_content" width="700" > 
			<tr>
				<th width="10%" id="menubar">No.</th>
				<th width="45%" id="menubar">제목</th>
				<th width="15%" id="menubar">아이디</th>
				<th width="20%" id="menubar">작성일</th>
				<th width="10%" id="menubar">조회수</th>	
			</tr>
			
		<c:forEach var="vo2" items="${list2 }">
			<tr id="toptr">
				<td width="10%" align="center"><img src="/images/notice/topList.png" border="0"></td>
				<td width="45%" align="center"><a href="/notice/content.do?nt_no=${vo2.nt_no }&page=${curpage}">${vo2.nt_subject }</a></td>
				<td width="15%" align="center">${vo2.id }</td>
				<td width="20%" align="center">
					<fmt:formatDate value="${vo2.nt_regdate }" pattern="yyyy-MM-dd"/>
				</td>
				<td width="10%" align="center">${vo2.nt_hit }</td>
			</tr>
		</c:forEach>
		
		<c:forEach var="vo" items="${list }">                                                                              
			<tr id="dataTr">
				<td width="10%" align="center">${vo.nt_no }</td>
				<td width="45%" align="center"><a href="/notice/content.do?nt_no=${vo.nt_no }&page=${curpage}">${vo.nt_subject }</a></td>
				<td width="15%" align="center">${vo.id }</td>
				<td width="20%" align="center">
					<fmt:formatDate value="${vo.nt_regdate }" pattern="yyyy-MM-dd"/>
				</td>
				<td width="10%" align="center">${vo.nt_hit }</td>			
			</tr>
		</c:forEach>
			</table>
			&nbsp;
			&nbsp;
			<form class="form-inline" action="/notice/list.do" method="post" >
			<div class="form-group">
			<!-- 검색 타입 선택 리스트 -->
				<select name="fs" class="form-control input-sm" style="width: 88px" >
					<option value="id">아이디</option>
					<option value="nt_subject">제목</option>
					<option value="nt_content">내용</option>
				</select>


			</div>
			<div class="form-group">

			<!-- 키워드 입력 부분 -->
				<input type="text" name="sk" class="form-control" placeholder="Search" />
				<input type="hidden" name="page" value="${curpage }">
			</div>
				<button type="submit" class="btn btn-default">검색</button>
				
		</form>
		
		&nbsp;
		&nbsp;

		<table border="0" width="700">
			<tr>
				<td align="right">
				 		<img src="/images/notice/begin.gif" border="0">
				 		<a href="list.do?page=${curpage>1?curpage-1:curpage }">이전</a>&nbsp;
					 </a>
			         <c:forEach var="i" begin="${frompage}" end="${topage}">		 
				
					<a href="list.do?page=${i}">[${i}]</a>
				</c:forEach>		 
				<a href="list.do?page=${curpage<totalpage?curpage+1:curpage }">&nbsp;다음</a>&nbsp;
					<img src="/images/notice/end.gif" border="0">
					 	</a>
					 	${curpage }page / ${totalpage }page 
					 	
				</td>
				
			
			
				<tr>
				<c:choose>			
				 <c:when test="${empty list }">
                  		  검색된 결과가 없습니다.
                    </c:when>
                      <c:otherwise>
                        <c:set var="i" value="false" />
                    </c:otherwise>
				</c:choose>
				</tr>
		
		</tr>
		</table> 
	</center>
</body>
</html>