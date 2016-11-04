<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" type="text/css"
	href="http://fonts.googleapis.com/earlyaccess/nanumgothic.css">
<link rel="stylesheet" type="text/css" href="/css/libraryguide.css">
<title>Insert title here</title>
</head>
<body>
	<div align="center">
		<h3>오시는 길</h3>
		<span id="map_nav">
		서울특별시 마포구 백범로 18(노고산동) 미화빌딩 2,3층 쌍용도서관<br /> 02)336-8546~8 <br />
		<br /> 지하철 이용<br /> 2호선 신촌역 7번, 6번 또는 5번 출구 서강대 방향으로 도보 5분. <br /> 상세
		주소) 봉구스 밥버거 반대편, 현대&기아 자동차 옆. </span>
	</div>
	<br />
	<div id="map" style="width: 960px; height: 400px;"></div>

	<script
		src="//apis.daum.net/maps/maps3.js?apikey=302a3803f092a28878e4e439f7d96eae"></script>
	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new daum.maps.LatLng(37.55318, 126.93690), // 지도의 중심좌표
			level : 1, // 지도의 확대 레벨
			mapTypeId : daum.maps.MapTypeId.ROADMAP
		// 지도종류
		};

		// 지도를 생성한다 
		var map = new daum.maps.Map(mapContainer, mapOption);

		// 지도에 확대 축소 컨트롤을 생성한다
		var zoomControl = new daum.maps.ZoomControl();

		// 지도의 우측에 확대 축소 컨트롤을 추가한다
		map.addControl(zoomControl, daum.maps.ControlPosition.RIGHT);

		// 지도 확대 레벨 변화 이벤트를 등록한다
		daum.maps.event.addListener(map, 'zoom_changed', function() {
			console.log('지도의 현재 확대레벨은 ' + map.getLevel() + '레벨 입니다.');
		});

		// 지도 클릭 이벤트를 등록한다 (좌클릭 : click, 우클릭 : rightclick, 더블클릭 : dblclick)
		daum.maps.event.addListener(map, 'click', function(mouseEvent) {
			console.log('지도에서 클릭한 위치의 좌표는 ' + mouseEvent.latLng.toString()
					+ ' 입니다.');
		});

		// 지도에 마커를 생성하고 표시한다
		var marker = new daum.maps.Marker({
			position : new daum.maps.LatLng(37.55318, 126.93690), // 마커의 좌표
			map : map
		// 마커를 표시할 지도 객체
		});

		// 마커에 클릭 이벤트를 등록한다 (우클릭 : rightclick)
		daum.maps.event.addListener(marker, 'click', function() {
			alert('쌍용 도서관입니다.');
		});
	</script>
</body>
</html>