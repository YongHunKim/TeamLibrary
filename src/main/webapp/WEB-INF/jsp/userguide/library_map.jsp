<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" type="text/css"
	href="http://fonts.googleapis.com/earlyaccess/nanumgothic.css">
<title>Insert title here</title>
</head>
<body>
	<div id="wrap">
		<h3>���ô� ��</h3>
		<table width="700">
			<tr>
				<th>�ּ�</th>
				<td>����Ư���� ������ ����� 18(���굿) ��ȭ���� 2,3�� �ֿ뵵����</td>
			</tr>
			<tr>
				<th>��ȭ��ȣ</th>
				<td>(02)336-8546~8</td>
			</tr>
		</table>
		<br />

		<div align="left">
			����ö �̿��<br />
			<ul>
				<li>2ȣ�� ���̿�(6�� �ⱸ) ���� 3�� �Ÿ�</li>
				<li>�����߾Ӽ� �����뿪(2�� �ⱸ) ���� 7�� �Ÿ�</li>
			</ul>
			<br /> ���� �̿��<br />
			<ul>
				<li>���� ���͸� �����忡�� ����</li>
				<li>110�� ����, 604�� ����, 753�� ����, 730�� ����, 7711�� ����, 7613�� ����,
					7016�� ����, 5714�� ����, 170�� ����</li>
			</ul>
		</div>

		<!-- <span id="map_nav">
		����Ư���� ������ ����� 18(���굿) ��ȭ���� 2,3�� �ֿ뵵����<br /> 02)336-8546~8 <br />
		<br /> ����ö �̿�<br /> 2ȣ�� ���̿� 7��, 6�� �Ǵ� 5�� �ⱸ ������ �������� ���� 5��. <br /> ��
		�ּ�) ������ ����� �ݴ���, ����&��� �ڵ��� ��. </span> -->
	</div>
	<br />
	<div id="map" style="width: 700px; height: 300px;"></div>
	<!-- width:960px; height: 400px; -->

	<script
		src="//apis.daum.net/maps/maps3.js?apikey=e47c8bea4f2b08491a5fcec4d77bb5ce"></script>
	<script>
		var mapContainer = document.getElementById('map'), // ������ ǥ���� div 
		mapOption = {
			center : new daum.maps.LatLng(37.55318, 126.93690), // ������ �߽���ǥ
			level : 1, // ������ Ȯ�� ����
			mapTypeId : daum.maps.MapTypeId.ROADMAP
		// ��������
		};

		// ������ �����Ѵ� 
		var map = new daum.maps.Map(mapContainer, mapOption);

		// ������ Ȯ�� ��� ��Ʈ���� �����Ѵ�
		var zoomControl = new daum.maps.ZoomControl();

		// ������ ������ Ȯ�� ��� ��Ʈ���� �߰��Ѵ�
		map.addControl(zoomControl, daum.maps.ControlPosition.RIGHT);

		// ���� Ȯ�� ���� ��ȭ �̺�Ʈ�� ����Ѵ�
		daum.maps.event.addListener(map, 'zoom_changed', function() {
			console.log('������ ���� Ȯ�뷹���� ' + map.getLevel() + '���� �Դϴ�.');
		});

		// ���� Ŭ�� �̺�Ʈ�� ����Ѵ� (��Ŭ�� : click, ��Ŭ�� : rightclick, ����Ŭ�� : dblclick)
		daum.maps.event.addListener(map, 'click', function(mouseEvent) {
			console.log('�������� Ŭ���� ��ġ�� ��ǥ�� ' + mouseEvent.latLng.toString()
					+ ' �Դϴ�.');
		});

		// ������ ��Ŀ�� �����ϰ� ǥ���Ѵ�
		var marker = new daum.maps.Marker({
			position : new daum.maps.LatLng(37.55318, 126.93690), // ��Ŀ�� ��ǥ
			map : map
		// ��Ŀ�� ǥ���� ���� ��ü
		});

		// ��Ŀ�� Ŭ�� �̺�Ʈ�� ����Ѵ� (��Ŭ�� : rightclick)
		daum.maps.event.addListener(marker, 'click', function() {
			alert('�ֿ� �������Դϴ�.');
		});
	</script>
</body>
</html>