<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
	function check_pass(id) {
		var id = $('#id').val();
		var pwd = $('#pwd').val();
	
		$.ajax({
			url : '/mypage/member_pcheck_ok.do',
			type : 'post',
			data : {
				"id" : id,
				"pwd" : pwd,
			},
			datatype : "JSON",
			success : function(data) {
				if (data == "success") {
					showMessage('Ȯ�εǾ����ϴ�.', 1000);
					setTimeout(function() {
						location.href = "/mypage/member_update.do?id=${id}";
					}, 1000);
				} else {
					showMessage('���� ��ȣ�� Ȯ���ϼ���.');
				}
			}
		});
	}
</script>
</head>
<body>
	<div align="left">
		<span style="color: blue; font-weight: bold; font-size: 20pt;">ȸ������
			����</span>
		<form action="/mypage/member_pcheck_ok.do">
			<p>��й�ȣ�� �Է��ϼ���</p>
			<input type="hidden" name="id"
				value="<%=session.getAttribute("id")%>" id="id"> <input
				type="password" size="16" maxlength="16" name="pwd" id="pwd" />&nbsp;
			<input type="button" value="Ȯ��"
				onclick="check_pass('<%=session.getAttribute("id")%>');" />
		</form>
		<br />
		<p style="font-size: 9pt;">

			�ܺηκ��� ${id } ���� ������ �����ϰ� ��ȣ�ϱ� ���� ��й�ȣ�� �ٽ� �� �� Ȯ�� �մϴ�.<br /> �׻� ��й�ȣ��
			Ÿ�ο��� ������� �ʵ��� ������ �ּ���.
		</p>
	</div>
</body>
</html>