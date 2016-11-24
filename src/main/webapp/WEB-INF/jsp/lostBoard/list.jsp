<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/css/csslostBoard/table.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript">
	function check() {
	    if (document.search.keyWord.value == "") {
	        alert("검색어를 입력하세요.");
	        document.search.keyWord.focus();
	        return;
	    }
	    document.search.submit();
	}
	function list() {
        document.list.action = "list.action";
        document.list.submit();
    }
 
    function read(value) {
        document.read.action = "list.action";
        document.read.seq.value = value; 
        document.read.keyField.value = document.search.keyField.value;
        document.read.keyWord.value = document.search.keyWord.value;
        document.read.submit();
    }


</script>
</head>
<body>
	<center>
		<h3>분실물Q&A</h3>
		<hr>
		<table border="0" width="960">
			<tr>
				<td align="left">
					<a href="insert.do"><img src="/images/imagelist/btn_write.gif" border="0"></a>
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
					<td width="45%" class="tdcenter"><a href="/lostBoard/content.do?lb_no=${vo.lb_no }">${vo.lb_subject}</a></td>
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
					 		<img src="/images/imagelist/begin.gif" border="0">
					 	</a>&nbsp;
					 	<a href="list.do?page=${fromPage-1}">
					 		<img src="/images/imagelist/prev.gif" border="0">
					 	</a>
					 </c:if>
					 <c:if test="${curPage <= block}">
					 	<a href="list.do?page=1">
					 		<img src="/images/imagelist/begin.gif" border="0">
					 	</a>&nbsp;
					 	<a href="list.do?page=${curPage>1?curPage-1:curPage}">
					 		<img src="/images/imagelist/prev.gif" border="0">
					 	</a>
					 </c:if>
					 <c:forEach var="i" begin="${frompage}" end="${topage}">
					 	&nbsp;[
					 	<c:if test="${curPage == i}">
					 		<span style="color:red">${i}</span>
					 	</c:if>
					 	<c:if test="${curPage != i}">
					 		<a href="list.do?page=${i}">${i}</a>
					 	</c:if>
					 	]&nbsp;
					 </c:forEach>
					 
					 <c:if test="${topage >= totalPage}">
					 	<a href="list.do?page=${curPage<totalPage?curPage+1:curPage}">
					 		<img src="/images/imagelist/next.gif" border="0">
					 	</a>&nbsp;
					 	<a href="list.do?page=${totalPage}">
					 		<img src="/images/imagelist/end.gif" border="0">
					 	</a>
					 </c:if>
					 <c:if test="${topage < totalPage}">
					 	<a href="list.do?page=${toPage+1}">
					 		<img src="/images/imagelist/next.gif" border="0">
					 	</a>&nbsp;
					 	<a href="list.do?page=${totalPage}">
					 		<img src="/images/imagelist/end.gif" border="0">
					 	</a>
					 </c:if>
					 &nbsp;&nbsp;
					 ${curPage} page / ${totalPage} pages
				</td>
			</tr>
			<form action="/lostboard/search.do" name="search" method="post">
		        <table border=0 width=960 cellpadding=5 cellspacing=0>
		 
		        <tr>
		            <td align=left valign=top>
		            <select name="keyField" size="1">
		                <option value="id" <c:if test="${'name'==keyField }"> selected</c:if>> 이름 </option>
		                <option value="lb_subject" <c:if test="${'title'==keyField }"> selected</c:if>> 제목 </option>
		                <option value="lb_content" <c:if test="${'content'==keyField }"> selected</c:if>> 내용 </option>
		            </select>
		            <input type="text" size="16" name="keyWord" value="${keyWord }">
		            <input type="button" value="검색" onClick="check()">
		            </td>
		        </tr>                
		        </table>
		    </form> 
		</table>    
	</center>
</body>
</html>