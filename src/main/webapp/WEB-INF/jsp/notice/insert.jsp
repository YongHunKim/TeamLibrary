<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/notice/table.css">
<script type="text/javascript">
$(function(){
	$('#insert_submit_btn').click(function(){
		var name=$('#name').val();
		if(name=="")
		{
			$('#id').focus();
			$('#id').val("");
			return;
		}
		var subject=$('#nt_subject').val();
		if(subject=="")
		{
			$('#nt_subject').focus();
			$('#nt_subject').val("");
			return;
		}
		var content=$('#nt_content').val();
		if(content=="")
		{
			$('#nt_content').focus();
			$('#nt_content').val("");
			return;
		}
		
		$('#frm').submit();
	});
});
</script>


</head>
<body>
	<center>
	<h3>글쓰기</h3>
	<form:form method="post" action="insert_ok.do" id="frm" name="frm" >
	<table width="700" id="table_content" >
				<tr>
					<th style="line-height: 1.2;" >이름<span class="essential"></span></th>
					<td class="1Line">
					<input type="hidden" name="id" id="id" value="<%=session.getAttribute("id")%>">
					<%=session.getAttribute("id")%>
					</td>
				</tr>
				
				<tr>
					<th style="line-height: 1.2;" >제목<span class="essential"></span></th>
					<td class="1Line"><input type="text" name="nt_subject" id="nt_subject"
						class="form-controll" size="75" maxlength="45">  
					<%-- <input type="hidden" name="nt_subject" id="nt_subject" value="<%=session.getAttribute("nt_subject") %>"> --%>
					</td>
				</tr>
	

				<tr>
				<th style="line-height: 1.2;" >내용<span class="essential"></span></th>
					<td class="1Line">
					<textarea rows="10" cols="75" name="nt_content" id="nt_content" class="form-controll" ></textarea>
					</td>	
				</tr>


		<td colspan="2" align="center">
		<input type="button" value="작성" class="btn btn-primary" id="insert_submit_btn" />&nbsp;&nbsp;
		<input type="button" value="취소" class="btn btn-primary" onclick="javascript:history.back();"/>
		</td>
	

	
	</table>
	</form:form>
	</center>
</body>
</html>