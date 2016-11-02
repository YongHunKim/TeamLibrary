<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href='http://fonts.googleapis.com/css?family=Open+Sans:300' rel='stylesheet' type='text/css'>
<style>
h1{
text-align:center;
color:#533515;
}
h1 a{
color:#533515;
text-decoration:none;
}
#search_div{
    font-family: 'Open Sans', sans-serif;
    color:#848484;
	width:510px;	
    padding:4px 4px 4px 4px; 
    margin:5px 5px 5px 350px;
	line-height: 62px;
	border-radius:5px;
	background:#f2f2f2;
	margin-left: 235px;
}
::-webkit-input-placeholder { color: #acacac;}
input {
    margin:0px 1px;
    border:none;    
	background-image:url('http://2.bp.blogspot.com/-ZcucRVPWaIo/UtNfv-HAMtI/AAAAAAAABUo/T5aajO9bkxA/s1600/How+To+Create+CSS+Search+Box+Form+Design+Tutorial+2.png');
	background-repeat:no-repeat;
	background-size:45px 45px;
	background-position:left center;
    height:60px;
    width:340px;
    vertical-align:bottom;
    font-size:14px;
	padding-left:40px;
    border-radius:5px;
	
}
input[type=button]{
    background:#30aa13;
    color:#fff;
	font-size:24px;
    height:60px;	
	width:153px;
    padding:0px 7px;
    border-radius:5px;
}
</style>
<script>
	function search_check(){
		var search = $('#search_val').val();
		if(search == ''){
			alert('검색값을 입력하세요');
			return;
		}
		$('#search_form').submit();
	}
</script>

</head>
<body>
<h1>자 료 검 색</h1>
<div id="search_div">
<form action="/search/search_ok.do" method="post" id="search_form">
	<input type="text" name="name" placeholder="검색하세요." id="search_val"/>
	<input value="검색" type="button" id="search_btn" onclick="search_check()"/>
</form>
</div>
${list.size() }
</body>
</html>