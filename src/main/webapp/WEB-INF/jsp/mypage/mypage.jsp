<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/css/mypage.css" />
</head>
<body>
	<br/><br/><br/>
	<table>
	<tr>
		<td align="left"><jsp:include page="${submenu}"></jsp:include></td>
		<td align="right"><jsp:include page="${subpage}"></jsp:include></td>
	</tr>
	</table>
</body>
</html>