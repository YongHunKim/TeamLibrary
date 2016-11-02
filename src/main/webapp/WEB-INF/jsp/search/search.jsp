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
			alert('검색값을 입력하세요');
			return;
		}
		$('#search_form').submit();
	}
</script>

</head>
<body>
<h1>자 료 검 색</h1>
<div id="search_div">
<form action="/search/search_ok.do" method="post" id="search_form">
	<input type="text" name="searchWord" placeholder="검색하세요." id="search_val"/>
	<input value="검색" type="button" id="search_btn" onclick="search_check()"/>
</form>
</div>
<c:choose>
	<c:when test="${list.size() > 0 }">
		<div class="result_group">
			<div class="sectit">				
				<p><font style="font-size:12px;">검색결과 ${list.size() }건</font></p>
			</div>
			<!-- foreach -->
			<c:forEach var="i" begin="0" end="${list.size()-1 }">
				<form name="subFormInfo${i}" id="subFormInfo${i}" method="post" action="/book/bookinfo.do">
					<input type="hidden" name="book_code" id="book_code" value="${list.get(i).book_code }"/>
				</form>
				<ul class="resultsty1" style="left:80px;">
					<li class="book_cover"><img src="${list.get(i).book_image }" width="60" height="83" alt="책표지" /></li>
					<li>
					<dl>
					<dt>
					<p class="fl"><a href="#nolink" onclick="goSelectedPage('subFormInfo0');"><font color="red" style="font-size: 12px;">${list.get(i).book_category }</font>, <font style="font-size: 12px;">${list.get(i).book_name }</font></a></p>
					<p class="book_state">
						<c:choose>
							<c:when test="${list.get(i).rent_yn == 'y' }">
								<img id="haveBook${i}" src="<%=application.getContextPath() %>/images/reservation_ok.gif" width="58" height="17" title="대출상태" onclick="goSelectedPage('subFormInfo0');">
							</c:when>
							<c:otherwise>
								<img id="haveBook${i}" src="<%=application.getContextPath() %>/images/rental_ok.gif" width="58" height="17" title="대출상태" onclick="goSelectedPage('subFormInfo0');">
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
		</div>
	</c:when>
	<c:otherwise>
		검색결과가 없습니다.
	</c:otherwise>
</c:choose>
</body>
</html>