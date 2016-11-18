<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
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
		<li><a href="javascript:void(0)" class="tablinks"
			onclick="openSeat(event, 'seat1')" id="defaultOpen">대출 연기 및 반납</a></li>
		<li><a href="javascript:void(0)" class="tablinks"
			onclick="openSeat(event, 'seat2')">예약 연기 및 취소</a></li>
		<li><a href="javascript:void(0)" class="tablinks"
			onclick="openSeat(event, 'seat3')">희망도서 신청</a></li>
	</ul>

	<div id="seat1" class="tabcontent">
		<span onclick="this.parentElement.style.display='none'"
			class="topright">x</span>		
		<jsp:include page="${subpage1}" />
	</div>

	<div id="seat2" class="tabcontent">
		<span onclick="this.parentElement.style.display='none'"
			class="topright">x</span>		
		<jsp:include page="${subpage2}" />
	</div>

	<div id="seat3" class="tabcontent">
		<span onclick="this.parentElement.style.display='none'"
			class="topright">x</span>		
		<jsp:include page="${subpage3}" />
	</div>
	<script>
		function openSeat(evt, seatName) {
			var i, tabcontent, tablinks;
			tabcontent = document.getElementsByClassName("tabcontent");
			for (i = 0; i < tabcontent.length; i++) {
				tabcontent[i].style.display = "none";
			}
			tablinks = document.getElementsByClassName("tablinks");
			for (i = 0; i < tablinks.length; i++) {
				tablinks[i].className = tablinks[i].className.replace(
						" active", "");
			}
			document.getElementById(seatName).style.display = "block";
			evt.currentTarget.className += " active";
		}

		// Get the element with id="defaultOpen" and click on it
		document.getElementById("defaultOpen").click();
	</script>
</body>
</html>