<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
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
				<div align="right">
					<a href="/login/login.do"><img src="<c:url value='/images/headLogin.gif'/>" ></a>&nbsp;&nbsp;
					<a href="/login/join.do"><img src="<c:url value='/images/headRegist.gif'/>" id="mjoin"></a>
				</div>
				<div class="clear"></div>
			</div>
			<div class="menubar">
				<ul>					
					<li><a href="#" id="current">자료신청 및 예약</a>
						<ul>
							<li><a href="/rent/delay.do">대출조회 및 연기</a></li>
							<li><a href="#">대출예약 및 연기</a></li>
							<li><a href="#">희망도서신청</a></li>
						</ul>
					</li>
					<li><a href="#" id="current">자료검색</a>
						<ul>
							<li><a href="#">자료검색</a></li>
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
							<li><a href="/lostBoard/list.do">분실물 게시판</a></li>
						</ul>
					</li>
					<li><a href="#" id="current">이용안내</a>
						<ul>
							<li><a href="#">오시는길</a></li>
							<li><a href="#">도서관 이용시간</a></li>
						</ul>
					</li>
				</ul>
			</div>
			<!-- include -->
			<jsp:include page="${jsp }"></jsp:include>			
			<div class="footer" style="margin-top: 50px;">
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