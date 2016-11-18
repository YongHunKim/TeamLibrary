<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

<link href='http://fonts.googleapis.com/css?family=Open+Sans:300' rel='stylesheet' type='text/css'>
<style>
#bg{
	background-image: url("/css/admin/background.jpg");
	background-repeat: no-repeat;
	background-position: center;
	background-size: 95% 95%; 
	background-color:transparent
}
</style>
<style>
@import url(http://fonts.googleapis.com/earlyaccess/nanummyeongjo.css);
h2 {font-family: 'Hanna';}
h2{
text-align:center;
color:#533515;
text-shadow: 2px 2px 2px gray;
}



th{
	font-size:15px;
    font-family: 'Open Sans', sans-serif;
    color:green;	
	
}
::-webkit-input-placeholder { color: #acacac;}

input[type=button]{
    background:#ccccff;
    color:green;
    font-style: 
	font-size:10px;
	font:bolder;
    height:23px;	
	width:56px;
    padding:0px 7px;
    border-radius:5px;
}
</style>

<script type="text/javascript">
function send(){
	
	var f=document.frm;
	if(f.book_name.value==""){
		alert("제목을 입력하세요.")
		f.book_name.focus();
		return;
	}
	if(f.book_author.value==""){
		alert("내용을 입력하세요.")
		f.book_author.focus();
		return;
	}
	f.submit();
}
</script>
</head>
<body>
	<table width="960" height="500" id="bg">
	<tr>
	<td>
		<center>
			<form:form method="post" action="/admin/book_plus_ok.do" name="frm">
				<table width="500" id="table_content" border="0" style="background-color:white;">
					<tr>
					<td colspan="4">
					<h2>도서 입력</h2>
					</td>
					<tr height="27">
						<th width="20%" align="left">카테고리 : </th>
						<td width="30%">
							<select name="book_category">
								<option value="IT">IT</option>
								<option value="스포츠">스포츠</option>
							</select>
						</td>
						<th width="20%" align="left">제목 : </th>
						<td width="30%">
							<input type="text" size="20" name="book_name">
						</td>
					</tr>
					<tr height="27">
						<th width="20%" align="left">저자 : </th>
						<td width="30%">
						<input type="text" size="20" name="book_author">
						</td>
						<th width="20%" align="left">출판사 : </th>
						<td width="30%">
						<input type="text" size="20" name="book_publish">
						</td>
					</tr>
					<tr height="27">
						<th width="20%" align="left">책 이미지 : </th>
						<td width="30%"><input type="text" size="20" name="book_image" ></td>
						<th width="20%" align="left">발행일 : </th>
						<td width="30%"'><input type="text" size="20" name="book_publish_date"  placeholder="yy/mm/dd">
						</td>
					</tr>	
					<tr height="27">
						<th width="20%">책 정보</th>
						<td width="80%" colspan="3"><textarea rows="10" cols="58" name="book_info"></textarea>
						</td>
					</tr>
					<tr>
						<td colspan="4" align="center">
							<input type="button" value="글쓰기" onclick="send()">
							<input type="button" value="취소" onclick="javascript:history.back()">
						</td>
					</tr>
				</table>
			</form:form>
		</center>
			</td>
		</tr>
	</table>
</body>
</html>