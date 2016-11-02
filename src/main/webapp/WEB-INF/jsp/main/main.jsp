<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String session_id = session.getAttribute("id")==null ? "xxx" : (String)session.getAttribute("id");
	System.out.println(session.getAttribute("id"));
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
</head>
<body>
	<div id="container">
		<div id="inner">
			<div id="header">
				<h1>
					<a href="/main/main.do"><div id="mainpage"><font color="black">SIST LIBRARY</font></div></a>
				</h1>
				<!-- 로그인 시 회원가입 창이 없어지고, 로그아웃 및 마이페이지로 변경되어야 합니다. -->
				<div align="right">
					<c:set var="session_id" value="<%=session_id %>"/>
					<c:if test="${session_id eq 'xxx'}">
						<a href="/login/login.do"><img src="<c:url value='/images/headLogin.gif'/>" ></a>&nbsp;&nbsp;
						<a href="/login/join.do"><img src="<c:url value='/images/headRegist.gif'/>" id="mjoin"></a>
					</c:if>
					
					<c:if test="${session_id ne 'xxx'}">
						<a href="/login/logout.do"><img src="<c:url value='/images/headLogout.gif'/>" ></a>&nbsp;&nbsp;
						<a href="/mypage/mypage.do"><img src="<c:url value='/images/headMypage.gif'/>"></a>
					</c:if>
				</div>
				<div class="clear"></div>
			</div>
			<div class="menubar">
				<ul>					
					<li><a href="#" id="current">자료신청 및 예약</a>
						<ul>
							<li><a href="">대출조회 및 연기</a></li>
							<li><a href="#">대출예약 및 연기</a></li>
							<li><a href="#">희망도서신청</a></li>
						</ul>
					</li>
					<li><a href="#" id="current">자료검색</a>
						<ul>
							<li><a href="/search/search.do">자료검색</a></li>
							<li><a href="#">신간자료 검색</a></li>
							<li><a href="#">인기자료 검색</a></li>
						</ul>
					</li>
					<li><a href="#" id="current">좌석예약</a>
						<ul>
							<li><a href="#">좌석예약</a></li>
							<li><a href="#">좌석보기</a></li>
						</ul>
					</li>
					<li><a href="#" id="current">참여마당</a>
						<ul>
							<li><a href="#">공지사항</a></li>
							<li><a href="#">분실물 게시판</a></li>
						</ul>
					</li>
					<li><a href="#" id="current">이용안내</a>
						<ul>
							<li><a href="/userguide/library_map.do">오시는길</a></li>
							<li><a href="/userguide/library_time.do">도서관 이용시간</a></li>
						</ul>
					</li>
				</ul>
			</div>
			<!-- include -->
			<div id="content"> 
			<jsp:include page="${jsp }"></jsp:include>
			</div>			
			<div class="footer" style="margin-top: 20px;">
				<p>
					SIST <a href="http://www.sist.co.kr">쌍용교육센터</a>
				</p>
			</div>
		</div>
	</div>
	</div>
	<%@ include file="/WEB-INF/include/include-body.jspf" %>
	
</body>
</html>