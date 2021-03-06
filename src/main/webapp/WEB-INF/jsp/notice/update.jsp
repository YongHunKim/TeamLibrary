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
/* 		var name=$('#name').val();
		if(name.trim()=="")
		{
			$('#name').focus();
			$('#name').val("");
			return;
		} */
		var subject=$('#nt_subject').val();
		if(subject.trim()=="")
		{
			$('#nt_subject').focus();
			$('#nt_subject').val("");
			return;
		}
		var content=$('#nt_content').val();
		if(content.trim()=="")
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
	<form:form method="post" action="update_ok.do" id="frm" name="frm" >
	<table width="700" id="table_content" >
				<tr>
					<th style="line-height: 1.2;" >이름<span class="essential"></span></th>
					<td class="1Line"><%-- <input type="text" name="name" id="name"
						class="form-controll" size="45" maxlength="10" value=" --%><%=session.getAttribute("id") %>
<%-- 					<input type="hidden" name="id" id="id" value="<%=session.getAttribute("id") %>"> --%>
						<input type="hidden" name="page" value="${curpage}"/>
					</td>
				</tr>	
	
				<tr>
					<th style="line-height: 1.2;" >제목<span class="essential"></span></th>
					<td class="1Line"><input type="text" name="nt_subject" id="nt_subject"
						class="form-controll" size="45" maxlength="10" value="${vo.nt_subject }">
<%-- 					<input type="hidden" name="nt_subject" id="nt_subject" value="<%=session.getAttribute("nt_subject") %>"> --%>
					<input type="hidden" name="nt_no" value="${vo.nt_no }">
					</td>
				</tr>
	

				<tr>
				<th style="line-height: 1.2;" >내용<span class="essential"></span></th>
					<td class="1Line">
					<textarea rows="10" cols="45" name="nt_content" id="nt_content" class="form-controll" >${vo.nt_content }</textarea>
					</td>
					
				</tr>
				
			 	<!-- 
				<tr>
				<th style="line-height: 1.2;" >첨부파일<span class="essential"></span></th>
					<td class="1Line">
						<input type="button" value="추가"  id="addBtn">
						<input type="button" value="취소"  id="removeBtn">
					</td>
				</tr>
				
				<table id="table_content" width="560" class="fileView">
				</table> -->
			 
			
			
		<td colspan="2" align="center">
		<input type="button" value="작성" class="btn btn-primary" id="insert_submit_btn" />&nbsp;&nbsp;
		<input type="button" value="취소" class="btn btn-primary" onclick="javascript:history.back();"/>
		</td>
	</tr>

	
	</table>
	</form:form>
	</center>
</body>
</html>