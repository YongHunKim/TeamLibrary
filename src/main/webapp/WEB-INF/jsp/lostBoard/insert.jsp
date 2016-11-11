<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/css/csslostBoard/table.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript">
	
	function send(){
		
		var f=document.frm;
		if(f.lb_subject.value==""){
			alert("제목을 입력하세요.")
			f.subject.focus();
			return;
		}
		if(f.lb_content.value==""){
			alert("내용을 입력하세요.")
			f.content.focus();
			return;
		}
/* 		if(f.pwd.value==""){
			alert("비밀번호를 입력하세요.")
			f.pwd.focus();
			return;
		} */
		f.submit();
	}
	
</script>
</head>
<body>
	<center>
		<h3>글쓰기</h3>
		<form:form method="post" action="/lostBoard/insert_ok.do" name="frm">
			<table width="700" id="table_content">
				<tr height="27">
					<td width="20%" align="center">제목</td>
					<td width="80%" align="left">
						<input type="text" size="10" name="lb_subject">
					</td>
				</tr>
				
				<tr height="27">
					<td width="20%" align="center">내용</td>
					<td width="80%" align="left">
						<textarea rows="8" cols="50" name="lb_content"></textarea>
					</td>
				</tr>
				
				
			
				
<!-- 				<tr height="27">
					<td width="20%" align="center">비밀번호</td>
					<td width="80%" align="left">
						<input type="password" size="10" name="pwd">
					</td>
				</tr> -->
				
				<tr>
					<td colspan="2" align="center">
						<input type="button" value="글쓰기" onclick="send()">
						<input type="button" value="취소" onclick="javascript:history.back()">
					</td>
				</tr>
			</table>
		</form:form>
	</center>
</body>
</html>








