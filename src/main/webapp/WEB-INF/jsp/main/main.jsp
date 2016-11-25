<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true"%>
<%
	String session_id = session.getAttribute("id")==null ? "x" : (String)session.getAttribute("id");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<%@ include file="/WEB-INF/include/include-header.jspf" %>
	<script>
	window.onload = function(){
		if(${sessionnull == '로그인 후 이용가능합니다.'}){
			showMessage('로그인 후 이용해주세요.',1000);
			setTimeout(function(){
				location.href="/login/login.do";
			},1000);
		}
		
	}
	
	</script>
</head>
<body>
	
	<div id="container" style="min-height:950px;">
		<div id="inner">
			<div id="header">
				<h1>   
					<a href="/main/main.do"><div id="mainpage"><font color="black">SIST LIBRARY</font></div></a>
				</h1>
				<div align="right">
					<c:set var="session_id" value="<%=session_id %>"/>
					<c:if test="${session_id eq 'x'}">
						<a href="/login/login.do"><img src="<c:url value='/images/headLogin.gif'/>" ></a>&nbsp;&nbsp;
						<a href="/login/join.do"><img src="<c:url value='/images/headRegist.gif'/>" id="mjoin"></a>
					</c:if>
					
					<c:if test="${session_id ne 'x'}">
						<img src="/images/headLogout.gif" onclick="javascript:logout();">&nbsp;&nbsp;
						<a href="/mypage/mypage.do"><img src="<c:url value='/images/headMypage.gif'/>"></a>
					</c:if>
					<img src="/images/headSitemap.gif" onclick="javascript:sitemap();">
				</div>
				<div class="clear"></div>
			</div>
			<div class="menubar">
				<ul>					
					<li><a href="/rent/rent.do" id="current">자료신청 및 예약</a>
						<ul>
							<li><a href="/rent/rent.do">대출 연기 및 반납</a></li>
							<li><a href="/rent/reserve.do">예약 연기 및 반납</a></li>
							<li><a href="/rent/wishbook.do">희망도서신청</a></li>
						</ul>
					</li>
					<li><a href="/search/search.do" id="current">자료검색</a>
						<ul>
							<li><a href="/search/search.do">자료검색</a></li>
							<li><a href="/search/newbook.do">신간자료</a></li>
							<li><a href="/search/popularbook.do">인기자료</a></li>
						</ul>
					</li>
					<li><a href="/notice/list.do" id="current">참여마당</a>
						<ul>
							<li><a href="/notice/list.do">공지사항</a></li>
							<li><a href="/lostBoard/list.do">분실물 게시판</a></li>
						</ul>
					</li>
					<li><a href="/userguide/guide.do" id="current">이용안내</a>
						<ul>
							<li><a href="/userguide/library_map.do">오시는길</a></li>
							<li><a href="/userguide/library_time.do">도서관 이용시간</a></li>
						</ul>
					</li>					
					<c:set var="sessionid">
						<%=session.getAttribute("id") %>
					</c:set>
					<c:if test="${sessionid=='admin' }">
					<li><a href="/admin/book_management.do" id="current">관리자메뉴</a>
						<ul>
							<li><a href="/admin/book_plus.do">도서추가</a></li>
							<li><a href="/admin/book_management.do">도서관리</a></li>
							<li><a href="/admin/wishbooklist.do">희망도서 신청목록</a></li>
						</ul>
					</li>
					</c:if>	
				</ul>
			</div>
			<!-- include -->
			<div id="content"> 
			<jsp:include page="${jsp }"></jsp:include>
			<div id="modal-message">
				<div class="modal-close" onclick="closeMessage();">×</div>
				<div id="modal-message-text"> </div>
			</div>
			</div>
									
			<div class="footer" style="margin-top: 20px;">
				<p>
					SIST <a href="http://www.sist.co.kr">쌍용교육센터</a><br/>
					SISTLIBRARY					
				</p>
			</div>
		</div>
	</div>
	</div>
	<%@ include file="/WEB-INF/include/include-body.jspf" %>
	
</body>
</html>