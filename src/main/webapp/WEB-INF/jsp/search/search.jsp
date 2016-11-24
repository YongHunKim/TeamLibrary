<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>        
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href='http://fonts.googleapis.com/css?family=Open+Sans:300' rel='stylesheet' type='text/css'>
<style>
h1{
text-align:center;
color:#533515;
}
h1 a{
color:#533515;
text-decoration:none;
}
#search_div{
    font-family: 'Open Sans', sans-serif;
    color:#848484;
	width:510px;	
    padding:4px 4px 4px 4px; 
    margin:5px 5px 5px 350px;
	line-height: 62px;
	border-radius:5px;
	background:#f2f2f2;
	margin-left: 235px;
}
::-webkit-input-placeholder { color: #acacac;}
input {
    margin:0px 1px;
    border:none;    
	background-image:url('http://2.bp.blogspot.com/-ZcucRVPWaIo/UtNfv-HAMtI/AAAAAAAABUo/T5aajO9bkxA/s1600/How+To+Create+CSS+Search+Box+Form+Design+Tutorial+2.png');
	background-repeat:no-repeat;
	background-size:45px 45px;
	background-position:left center;
    height:60px;
    width:340px;
    vertical-align:bottom;
    font-size:14px;
	padding-left:40px;
    border-radius:5px;
	
}
input[type=button]{
    background:#30aa13;
    color:#fff;
	font-size:24px;
    height:60px;	
	width:153px;
    padding:0px 7px;
    border-radius:5px;
}
</style>
<script>
	function search_check(){
		var search = $('#search_val').val();
		if(search == ''){
			showMessage('검색값을 입력하세요');
			return;
		}
		$('#search_form').submit();
	}
	
	function goRent(rentform_id){
		//alert(rentform_id);
		var f = document.getElementById(rentform_id);
		f.submit();
	}
	
	function goReserve(reserveform_id){
		var f = document.getElementById(reserveform_id);
		$(f).attr("action","/book/reserve.do");
		f.submit();
	}
	
	function goDetail(detailform_id){
		var f = document.getElementById(detailform_id);
		$(f).attr("action","/book/detail.do");
		f.submit();
	}
</script>

</head>
<body>
<c:choose>
<c:when test="${type=='search' }">
<h1>자 료 검 색</h1>
<div id="search_div">
<form action="/search/search_ok.do" method="post" id="search_form">
	<input type="text" name="searchWord" placeholder="검색하세요." id="search_val" value="${searchWord }"/>
	<input value="검색" type="button" id="search_btn" onclick="search_check()"/>
</form>
</div>
</c:when>
<c:when test="${type=='newbook' }">
<h1>신 간 도 서</h1>
</c:when>
<c:when test="${type=='popular' }">
<h1>인 기 도 서</h1>
</c:when>
</c:choose>


<!-- 
================================================================
<c:set var="sessionid">
	<%=session.getAttribute("id") %>
</c:set>
<c:if test="${sessionid=='admin' }">
		<input type="button" name="book_plus" id="book_plus" onclick="book_plus" value="도서추가">
</c:if>
===================================================================
 -->
 
 
<c:choose>
	<c:when test="${list.size() > 0 }">
		<div class="result_group">
			<div class="sectit">				
				<p><font style="font-size:12px;">검색결과 ${totalRow }건</font></p>
			</div>
			<!-- foreach -->
			<c:forEach var="i" begin="0" end="${list.size()-1 }">
				<form name="subFormInfo${i}" id="subFormInfo${i}" method="post" action="/book/rent.do">
					<input type="hidden" name="book_code" id="book_code" value="${list.get(i).book_code }"/>
					<input type="hidden" name="curPage" id="curPage" value="${curPage}"/>
					<input type="hidden" name="searchWord" id="searchWord" value="${searchWord}"/>
				</form>
				<ul class="resultsty1" style="left:80px;">
					<li class="book_cover"><img src="${list.get(i).book_image }" width="60" height="83" alt="책표지" /></li>
					<li>
					<dl>
					<dt>
					<p class="fl"><a href="#nolink" onclick="goDetail('subFormInfo${i}');"><font color="red" style="font-size: 12px;">${list.get(i).book_category }</font>, <font style="font-size: 12px;">${list.get(i).book_name }</font></a></p>
					<p class="book_state">
						<c:choose>
							<c:when test="${list.get(i).rent_yn == 'n' }">
								<img id="haveBook${i}" src="<%=application.getContextPath() %>/images/rental_ok.gif" width="58" height="17" title="대출상태" onclick="goRent('subFormInfo${i}');">
							</c:when>
							<c:when test="${list.get(i).rent_yn == 'y' and list.get(i).reserve_yn =='n' }">
								<img id="haveBook${i}" src="<%=application.getContextPath() %>/images/reservation_ok.gif" width="58" height="17" title="대출상태" onclick="goReserve('subFormInfo${i}');" style="height:30px;">
							</c:when>
							<c:otherwise>
								<img id="haveBook${i}" src="<%=application.getContextPath() %>/images/reservation_x.png" width="58" height="17" title="대출상태" style="height:22px; width:62px;">
							</c:otherwise>
						</c:choose>
					</p>
					</dt>
					<dd class="summary">저자 : ${list.get(i).book_author } |
										발행사 : ${list.get(i).book_publish} |
										발행일 : <fmt:formatDate value="${list.get(i).book_publish_date }" pattern="yyyy-MM-dd"/>
					</dd>
					</dl>
					</li>
					<dt></dt><dd id="duplicate_manage0" style="display:none"></dd>
				</ul>				
			</c:forEach>
			<c:if test="${totalRow > 10 }">
			<div>			
			<table class="button_table" width="100%">
					<tr>
						<td id="right_td" style="text-align:center;">
						<!-- 
							[1][2][3][4][5][6]
							fp			tp	
						 -->
					 	<a href="/search/search_ok.do?page=1&searchWord=${searchWord }">
					 		<img src="<%=application.getContextPath() %>/images/begin.gif">
					 	</a>
					 	<!-- 기본적으로는 5페이지 단위로 페이지 이동, 처음 블록과 마지막 블록에서만 1페이지씩 이동 -->
						<c:if test="${curPage>block }">
							<a href=" ">
								<img src="<%=application.getContextPath() %>/images/prev.gif">				 		
						 	</a>
						</c:if>	
						<c:if test="${curPage<block }">
							<a href="/search/search_ok.do?page=${curPage>1 ? curPage-1 : 1 }&searchWord=${searchWord }">
								<img src="<%=application.getContextPath() %>/images/prev.gif">				 		
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
						 		<a href="/search/search_ok.do?page=${i }&searchWord=${searchWord }">
						 			${i }
						 		</a>
						 	</c:if>	
						 	]
						</c:forEach>
						<c:if test="${toPage<totalPage }">
							<a href="/search/search_ok.do?page=${toPage+1 }&searchWord=${searchWord }">
								<img src="<%=application.getContextPath() %>/images/next.gif">				 		
						 	</a>
						</c:if>
						<c:if test="${toPage>=totalPage }">
							<a href="/search/search_ok.do?page=${curPage<totalPage ? curPage+1 : totalPage }&searchWord=${searchWord }">
								<img src="<%=application.getContextPath() %>/images/next.gif">				 		
						 	</a>
						</c:if>
						<a href="/search/search_ok.do?page=${totalPage }&searchWord=${searchWord }">
					 		<img src="<%=application.getContextPath() %>/images/end.gif">
					 	</a>
					 	&nbsp;
					 	${curPage }page / ${totalPage }pages 
						</td>
					</tr>
				</table>
				</div>	
				</c:if>
		</div>
	</c:when>
	<c:otherwise>
		<c:if test="${searchWord != null }">
		<div class="noresult" style="margin-top: 50px;">
				<ul>
					<ol>검색어<span>${searchWord}</span>로 검색된 결과가 없습니다!
					</ol>
					<li>단어의 철자가 정확한지 확인해주세요.</li>
					<li>검색어의 단어 수를 줄이거나, 다른 검색어로 검색해 보세요.</li>	
					<li>보다 일반적인 검색어로 다시 검색해 보세요.</li>
				</ul>
			</div>
		</c:if>	
	</c:otherwise>
</c:choose>
</body>
</html>