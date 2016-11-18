<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%-- <%
	String[] options = {"아이디","제목","내용"};
%>
 --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/notice/table.css">

</head>
<body>
	<center>
		<h3>공지사항</h3>
		<table border="0" width="700" id="crud">
			<tr>
				<td align="left">
				<a href="/notice/insert.do?type=${type }" type="button" class="btn btn-default">글쓰기</a>
				</td>
			</tr>
		</table>
		
		<table id="table_content" width="700" > 
			<tr>
				<th width="10%" id="menubar">번호</th>
				<th width="45%" id="menubar">제목</th>
				<th width="15%" id="menubar">아이디</th>
				<th width="20%" id="menubar">작성일</th>
				<th width="10%" id="menubar">조회수</th>	
			</tr>
			
		<c:forEach var="vo2" items="${list2 }">
			<tr style="background: yellow;">
				<td width="10%" align="center"><img src="/images/notice/topNotice.png" border="0"></td>
				<td width="45%" align="center"><a href="/notice/content.do?nt_no=${vo2.nt_no }">${vo2.nt_subject }</a></td>
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
				<td width="45%" align="center"><a href="/notice/content.do?nt_no=${vo.nt_no }">${vo.nt_subject }</a></td>
				<td width="15%" align="center">${vo.id }</td>
				<td width="20%" align="center">
					<fmt:formatDate value="${vo.nt_regdate }" pattern="yyyy-MM-dd"/>
				</td>
				<td width="10%" align="center">${vo.nt_hit }</td>			
			</tr>
		</c:forEach>
			</table>

		<form action="/notice/list.do" method="post">
			<!-- 액션에 적힌 주소로 폼 안의 값들을 보내겠다는거임. 위의 request.getparameter와 대응하는 부분을 액션주는 곳따로 만들어줘야하나 -->
			<div class="box-tools">

				<!-- 검색 타입 선택 리스트 -->
				<select name="fs" class="form-control input-sm" style="width: 88px">
					<option value="n">---</option>
					<option value="id">아이디</option>
					<option value="nt_subject">제목</option>
					<option value="nt_content">내용</option>
				</select>
				<!-- 검색 타입 선택 리스트  끝 -->
			</div>

			<div class="input-group input-group-sm" value="" style="width: 142px">

				<!-- 키워드 입력 부분 -->
				<input type="text" name="sk"
					class="form-control pull-right" placeholder="Search" />

				<!-- 검색 버튼 -->
				<!--  <div class="input-group-btn">
                  <button type="submit" id="searchBtn" class="btn btn-default"></button>
                  </div> -->
			</div>
			<div class="col-sm-offset-2 col-sm-10">
				<button type="submit" class="btn btn-default">검색</button>
			</div>
		</form>

		<table border="0" width="700">
			<tr>
				<td align="right">
				 		<img src="/images/notice/begin.gif" border="0">
				 		<a href="list.do?page=${curpage>1?curpage-1:curpage }">이전</a>&nbsp;
					 </a>
				<c:forEach var="i" begin="${frompage }" end="${topage}">				
					<a href="list.do?page=${i}">[${i}]</a>
				</c:forEach>		 
				<a href="list.do?page=${curpage<totalpage?curpage+1:curpage }">다음</a>&nbsp;
					<img src="/images/notice/end.gif" border="0">
					 	</a>
					 	${curPage }page / ${totalPage }page 
				</td>
				

			<%-- </tr>
				<td width="50%">
				<form action="list.do" method="post" name="frm">
				<c:set var="na" value="<%=options %>">
				</c:set>
		
				<select name="fs" id="fs">										
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
				
					<label for="fs">
					<input name="fs"  id="fs"  placeholder="입력하세요." type="text"></input>
					</label>
				    <input type="text" name="ss" value="${(ss==null)?'':ss }">
					<input type="hidden" name="type" value=${type }/> 
					<input type="submit" value="검색"> 
				</form>
				</td> --%>     		
         
				<%-- <c:choose>
					<c:otherwise>
					<c:if test="${fs != null }">
				<div class="fs" style="margin-top: 50px;">
					<ul>
					<ol>검색어<span>${fs}</span>로 검색된 결과가 없습니다!
					</ol>
					</ul>
				</div>
				</c:if>	
					</c:otherwise>
				</c:choose> --%>
				
				
			<tr>
		</tr>
		</table> 
	</center>
</body>
</html>