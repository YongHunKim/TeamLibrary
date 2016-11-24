<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
body {
	font-family: "Lato", sans-serif;
}

ul.tab {
	list-style-type: none;
	margin: 0;
	padding: 0;
	overflow: hidden;
	border: 1px solid #ccc;
	background-color: #f1f1f1;
}

/* Float the list items side by side */
ul.tab li {
	float: left;
}

/* Style the links inside the list items */
ul.tab li a {
	display: inline-block;
	color: black;
	text-align: center;
	padding: 14px 16px;
	text-decoration: none;
	transition: 0.3s;
	font-size: 17px;
}

/* Change background color of links on hover */
ul.tab li a:hover {
	background-color: #ddd;
}

/* Create an active/current tablink class */
ul.tab li a:focus, .active {
	background-color: #ccc;
}

/* Style the tab content */
.tabcontent {
	display: none;
	padding: 6px 12px;
	border: 1px solid #ccc;
	border-top: none;
}

.topright {
	float: right;
	cursor: pointer;
	font-size: 20px;
}

.topright:hover {
	color: red;
}
</style>
</head>
<body>

	<!-- <p>오른쪽 위에 있는 X버튼을 클릭하시면은 탭이 닫혀집니다.</p> -->

	<ul class="tab">
		<li><a href="/rent/rent.do" class="tablinks"
			id="defaultOpen">대출 연기 및 반납</a></li>
		<li><a href="/rent/reserve.do" class="tablinks"
			>예약 연기 및 취소</a></li>
		<li><a href="/rent/wishbook.do" class="tablinks"
			>희망도서 신청</a></li>
	</ul>

	<div id="seat1" class="tabcontent" style="display:block;">
		<span onclick="this.parentElement.style.display='block'"
			class="topright">x</span>		
		<jsp:include page="${subpage1}" />
	</div>
	<script>
		
	</script>
</body>
</html>