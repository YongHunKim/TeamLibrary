<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<center>
<h3>������� ��û ���</h3>
<c:choose>
	<c:when test="${wishList.size()>0 }">
	<div style="text-align:right;"><span>������� ��û���� : ${totalRow}</span></div>
		<form>
		<table class="table">
			<tr>		
				<th width="15%">��û���̵�</th>
				<th width="30%">������</th>
				<th width="20%">����</th>
				<th width="20%">���ǻ�</th>
				<th width="15%">ī�װ�</th>
			</tr>
			<c:forEach var="i" begin="0" end="${wishList.size()-1 }">
			<tr>
				<td>${wishList.get(i).id }</td>
				<td>${wishList.get(i).wish_book_name }</td>
				<td>${wishList.get(i).wish_book_author }</td>
				<td>${wishList.get(i).wish_book_publish }</td>				
				<td>${wishList.get(i).wish_book_category }</td>
			</tr>	
			</c:forEach>	
		</table>
		</form>
		
		 <div>			
				<table class="button_table" width="100%">
						<tr>
							<td id="right_td" style="text-align:center;">
							<!-- 
								[1][2][3][4][5][6]
								fp			tp	
							 -->
						 	<a href="/admin/wishbooklist.do?page=1">
						 		<img src="/images/begin.gif">
						 	</a>
						 	<!-- �⺻�����δ� 5������ ������ ������ �̵�, ó�� ��ϰ� ������ ��Ͽ����� 1�������� �̵� -->
							<c:if test="${curPage>block }">
								<a href="/admin/wishbooklist.do?page=${fromPage-1}">
									<img src="/images/prev.gif">				 		
							 	</a>
							</c:if>	
							<c:if test="${curPage<block }">
								<a href="/admin/wishbooklist.do?page=${curPage>1 ? curPage-1 : 1 }">
									<img src="/images/prev.gif">				 		
							 	</a>
							</c:if>							
							<c:forEach var="i" begin="${fromPage }" end="${toPage }">								
							 	[
								<c:if test="${curPage==i}">
									<font color="red">
										${i}
									</font>				 	
							 	</c:if>
							 	<c:if test="${curPage!=i}">
							 		<a href="/admin/wishbooklist.do?page=${i}">
							 			${i}
							 		</a>
							 	</c:if>	
							 	]
							</c:forEach>
							<c:if test="${toPage<totalPage }">
								<a href="/admin/wishbooklist.do?page=${toPage+1 }">
									<img src="/images/next.gif">				 		
							 	</a>
							</c:if>
							<c:if test="${toPage>=totalPage }">
								<a href="/admin/wishbooklist.do?page=${curPage<totalPage ? curPage+1 : totalPage }">
									<img src="/images/next.gif">				 		
							 	</a>
							</c:if>
							<a href="/admin/wishbooklist.do?page=${totalPage }">
						 		<img src="/images/end.gif">
						 	</a>
						 	&nbsp;
						 	${curPage }page / ${totalPage }pages 
							</td>
						</tr>
					</table>
					</div>	

	</c:when>
	<c:otherwise>
	������� ��û������ �����ϴ�.
	</c:otherwise>
</c:choose>
</center>
</body>
</html>