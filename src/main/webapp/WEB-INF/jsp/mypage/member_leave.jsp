<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
function delete_check(){
	var f = $('#delete_form');
	var id = $('#id').val();
	var pwd = $('#pwd').val();

	if(pwd == ''){
		showMessage('��й�ȣ�� �Է��ϼ���.');
		return;
	}
	
	$.ajax({
		url : '/mypage/member_leave_ok.do',
		type : 'post',
		data : {
			"id" : $('#id').val(),
			"pwd" : $('#pwd').val()
		},
		datatype:"JSON",
		success : function(data) {
			//check.innerHTML = data;
			if (data == "success") {
				showMessage('Ż��Ǿ����ϴ�.',1000);
				setTimeout(function(){
					location.href="/main/main.do";
				},1000);
				
			} else {
				showMessage('��й�ȣ�� Ȯ�����ּ���.',1000);
				setTimeout(function(){
					location.href="/mypage/member_leave.do";
				})
			}
		}
	});
}
</script>
</head>
<body>
	<span style="font-size: 20pt; font-weight: bold;">ȸ��Ż��</span>

	<p style="font-size: 9pt;">��й�ȣ�� �Է��ϼ���.</p>
	<form action="/mypage/member_leave_ok.do" id="delete_form">
		<input type="hidden" name="id" id="id" value="<%= session.getAttribute("id") %>" />
		<input type="password" size="20" name="pwd" id="pwd" />&nbsp;<input
			type="submit" value="Ȯ��" onclick="delete_check()"/>
	</form>
	<p style="font-size: 9pt;">
		�ܺηκ���
		<!-- ���̵� -->
		${id}���� ������ �����ϰ� ��ȣ�ϱ� ���� ��й�ȣ�� �ٽ� �� �� Ȯ���մϴ�.
	</p>
	<br />

	<p style="font-size: 9pt;">
		�׻� <span style="color: red; font-weight: bold;">��й�ȣ�� Ÿ�ο��� �������
			�ʵ��� ����</span>�� �ּ���.
	</p>

</body>
</html>