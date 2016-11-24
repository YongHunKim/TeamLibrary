<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>Insert title here</title>
	<script type="text/javascript">
	function rentReturn(book_code){
		//showMessage(book_code);
		$.ajax({
			url : '/rent/rentreturn.do',
			type : 'post',
			data : {
				"book_code" : book_code,
			},
			datatype:"JSON",
			success : function(data) {				
				if (data == "success") {
					showMessage("�ݳ��� �����߽��ϴ�.");
					setTimeout(function(){
						location.reload();
					},1000);
				} else {
					showMessage("�ݳ��� �����߽��ϴ�.");
				}
			}
		});
	}
	
	function rentDelay(book_code,i){
		$.ajax({
			url : '/rent/rentDelay.do',
			type : 'post',
			data : {
				"book_code" : book_code,
				"book_management_code" : $('#book_management_code'+i).val(),
				"id" : $('#book_management_id'+i).val()
			},
			datatype:"JSON",
			success : function(data) {				
				if (data == "success") {
					showMessage("���⿡ �����߽��ϴ�.");
					setTimeout(function(){
						location.reload();
					},1000);
				} else {
					showMessage("���⿡ �����߽��ϴ�.");
				}
			}
		});
	}
	</script>
</head>
<body>
<center>
<h3>���� ����</h3>
<c:choose>
	<c:when test="${rentList.size()>0 }">
	<div style="text-align:right;"><span>�� ���� ���� : ${totalRow}</span></div>
		<form>
		<table class="table">
			<tr>		
				<th width="15%">�����ڵ�</th>
				<th width="30%">������</th>
				<th width="20%">����</th>
				<th width="10%">������</th>
				<th width="10%">�ݳ���</th>
				<th width="15%">�ݳ� �� ����</th>
			</tr>
			<c:forEach var="i" begin="0" end="${rentList.size()-1 }">
			<tr>
				<td>${rentList.get(i).book_code }
				<input type="hidden" id="book_management_code${i}" value="${rentList.get(i).book_management_code }" />				
				<input type="hidden" id="book_management_id${i}" value="${rentList.get(i).id }" />
				</td>
				<td>${rentList.get(i).book_name }</td>
				<td>${rentList.get(i).book_author }</td>
				<td><fmt:formatDate value="${rentList.get(i).rent_date }" pattern="yyyy-MM-dd" /></td>
				<td><fmt:formatDate value="${rentList.get(i).return_date }" pattern="yyyy-MM-dd" /></td>
				<td><input type="button" class="btn btn-disabled" value="�ݳ�" onclick="javasciprt:rentReturn(${rentList.get(i).book_code})"/>
				<input type="button" class="btn btn-disabled" value="����" id="rentDelayBtn" onclick="javasciprt:rentDelay(${rentList.get(i).book_code},${i})"/></td>
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
						 	<a href="/rent/rent.do?page=1">
						 		<img src="/images/begin.gif">
						 	</a>
						 	<!-- �⺻�����δ� 5������ ������ ������ �̵�, ó�� ��ϰ� ������ ��Ͽ����� 1�������� �̵� -->
							<c:if test="${curPage>block }">
								<a href="/rent/rent.do?page=${fromPage-1}">
									<img src="/images/prev.gif">				 		
							 	</a>
							</c:if>	
							<c:if test="${curPage<block }">
								<a href="/rent/rent.do?page=${curPage>1 ? curPage-1 : 1 }">
									<img src="/images/prev.gif">				 		
							 	</a>
							</c:if>
							<c:forEach var="i" begin="${fromPage }" end="${toPage }">
							 	[
								<c:if test="${curPage==i }">
									<font color="red">
										${i }
									</font>				 	
							 	</c:if>
							 	<c:if test="${curPage!=i }">
							 		<a href="/rent/rent.do?page=${i }">
							 			${i }
							 		</a>
							 	</c:if>	
							 	]
							</c:forEach>
							<c:if test="${toPage<totalPage }">
								<a href="/rent/rent.do?page=${toPage+1 }">
									<img src="/images/next.gif">				 		
							 	</a>
							</c:if>
							<c:if test="${toPage>=totalPage }">
								<a href="/rent/rent.do?page=${curPage<totalPage ? curPage+1 : totalPage }">
									<img src="/images/next.gif">				 		
							 	</a>
							</c:if>
							<a href="/rent/rent.do?page=${totalPage }">
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
	���⳻���� �����ϴ�.
	</c:otherwise>
</c:choose>
</center>
</body>
</html>