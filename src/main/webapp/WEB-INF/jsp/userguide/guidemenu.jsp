<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>이용안내</title>
<link rel="stylesheet" type="text/css" href="http://fonts.googleapis.com/earlyaccess/nanumgothic.css">
<link rel="stylesheet" type="text/css" href="/css/libraryguide.css">
</head>
<body>
	<div>
		<p>이용안내</p>
		<div align="left">
		<ul>
			<li><a href="/userguide/library_map.do">오시는길</a></li>
			<li><a href="/userguide/library_time.do">도서관 이용시간</a></li>
		</ul>
		</div>
		
		<div align="center"><jsp:include page="${ usersubmenu }"></jsp:include></div>
	</div>

</body>
</html>