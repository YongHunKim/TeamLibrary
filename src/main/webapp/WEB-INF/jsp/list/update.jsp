<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/csslist/table.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript">
	/* 	var fileIndex=0;
	 $(function() {
	 $('#addBtn').click(function() {
	 $('.fileView').append(
	 '<tr id=f'+fileIndex+'>'
	 +'<td width=20%>파일'+(fileIndex+1)+'</td>'
	 +'<td width=80% align=left>'
	 +'<input type=file name=files['+fileIndex+'] size=30>'
	 +'</td>'
	 +'</tr>'
	 );
	 fileIndex=fileIndex+1;
	 }); 
	
	 $('#removeBtn').click(function(){
	 $('#f' +(fileIndex-1)).remove();
	 fileIndex=fileIndex-1;
	 });
	
	 });  */

	function send() {
		var f = document.frm;
		if (f.lb_subject.value == "") {
			alert("제목을 입력하세요.")
			f.lb_subject.focus();
			return;
		}
		if (f.lb_content.value == "") {
			alert("내용을 입력하세요.")
			f.lb_content.focus();
			return;
		}
		f.submit();
	}
</script>
</head>
<body>
	<center>
		<h3>수정하기</h3>
		<form:form method="post"
			action="/list/update_ok.do" name="frm">

			<table width="700" id="table_content">

				<tr height="27">
					<td width="20%" align="center">제목</td>
					<td width="80%" align="left"><input type="text" size="45"
						name="lb_subject" value="${vo.lb_subject }">
					<input type="hidden" name="id" value="${vo.id}">
					<input type="hidden" name="lb_no" value=${vo.lb_no}></td>
				</tr>

				<tr height="27">
					<td width="20%" align="center">내용</td>
					<td width="80%" align="left"><textarea rows="8" cols="50"
							name="lb_content">${vo.lb_content }</textarea></td>
				</tr>
			</table>

			<table id="table_content" width="560" class="fileView">



				<tr>
					<td colspan="2" align="center"><input type="button" value="수정"
						onclick="send()"> <input type="button" value="취소"
						onclick="javascript:history.back()"></td>
				</tr>
			</table>
		</form:form>
	</center>
</body>
</html>



















